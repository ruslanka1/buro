unit DevTransp;

interface
uses Windows, CommlibNew, ConnTypes;

const WorkPort:TComPort=Nil;
      WorkPortName:string='';
      ConfigSign=$13E2539B;

      SendPacketStatus:byte=$80;

      SrcAddr=0;
      TryCount=1;

      DestAddr:word=$FFFF;

      ecOK=$00;
      ecBadCommand=$01;
      ecParamError=$02;
      ecExecuteError=$03;
      ecBadAnswer=$04;
      ecConnectError=$05;
      ecInvalidDataSize=$06;

type

  TMACAddress=packed array[0..5] of byte;
  
TTabConfigA=packed record
  Signature:dword;
  IP, SubMask, Gate:dword;
  PortTCP:word;
  DevID:word;
  MAC:TMACAddress;
  uid:word;
  Options:byte;
  PortUDP:word;
  end;

TTabConfig=packed record
  Conf:TTabConfigA ;
  reserv:array [1..32-sizeof(TTabConfigA)] of byte;
  end;

PTabConfig=^TTabConfig;

TOutTextParams=packed record
  DispNo:byte;
  Font,
  Align,
  Opt,
  Speed,
  Color:byte;
  end;

POutTextParams=^TOutTextParams;

function  OpenPort:boolean;
procedure ClosePort;

function CheckConnect:integer;
function ctrlReboot(Loader:boolean):integer;
function ctrlCheckConnByMask(Id, Mask:word; Sw:boolean):integer;
function ctrlGetConfByMask(Id, Mask:word; Sw:boolean; Conf:PTabConfig):integer;
function ctrlSetConfByMask(Id, Mask:word; Sw:boolean; Conf:PTabConfig):integer;
function ctrlRestoreDefault:integer;
function ctrlSetBright(Br:integer):integer;
function ctrlSetTime(T:TSystemTime):integer;
function ctrlGetTime(var T:TSystemTime):integer;
function ctrlOutText(P:POutTextParams; s:ansistring {s:string}):integer;
function ctrlSetTestMode(Mask:word; Cycle:boolean):integer;
function ctrlSetTestMode2(Mask:word):integer;

//only for loader
(*
function ctrlExecFlashCommand(F: Pointer { PFlashDataRec }):integer;
function ctrlGetFontPageInfo(var PageCount, FlashSize:integer):integer;
*)

implementation

uses SysUtils;

const PacketId:byte=0;

      WaitTimeOut:integer=300;

      cmdCheckConnect=1;
      cmdSetBright=2;
      cmdSetTime=3;
      cmdGetTime=4;
      cmdOutText=5;

      cmdSetTestMode=10;

      cmdGetFontInfo=223;
      cmdReboot=224;
      cmdExecFlashCommand=225;
      cmdCheckConnByMask=226;
      cmdGetConfByMask=227;
      cmdSetConfByMask=228;
      cmdRestoreDef=229;

function OpenPort:boolean;
  begin
  if WorkPort.PortName<>WorkPortName
                   then begin
                        WorkPort.PortName:=WorkPortName;
                        end;
  Result:=WorkPort.Opened;
  WorkPortName:=WorkPort.PortName;
  if Result then begin
                 if WorkPort.LANConnection then WaitTimeOut:=1000
                                           else WaitTimeOut:=300; 
                 end;
  end;

procedure ClosePort;
  begin
  WorkPort.PortName:='';
  end;

function ExchangeDataPacket(SP, DP:PLevel2Pack; TimeOut:integer):boolean;
  begin
  Result:=WorkPort.SendBlock(SP);
  if not Result then Exit;
  repeat
  Result:=WorkPort.WaitBlock(DP, sizeof(TLevel2Pack), TimeOut)
  until not Result or ((DP^.PId=SP^.PId) and (DP^.Cmd=SP^.Cmd) and (DP^.DstAddr=SrcAddr) and (DP^.Status and $C0=0)); 
  end;

function SendCommandWithDataInt(DstAddr:word; Cmd:byte; Data:pointer; DataSize:integer; DB:PLevel2Pack; TimeOut:integer):integer;
 var SB, RB:TLevel2Pack;
  begin
  if (DataSize>RecBuffSizeByte) or (DataSize<0)
                              then begin
                                   Result:=ecInvalidDataSize;
                                   Exit;
                                   end;
  PacketId:=(integer(PacketId)+1) and $7F;
  SB.SrcAddr:=SrcAddr;
  SB.DstAddr:=DstAddr;
  SB.PId:=PacketId;
  SB.Cmd:=Cmd;
  SB.Flags:=0;
  SB.Status:=SendPacketStatus;
  SB.DataLen:=DataSize;
  if (DataSize>0) then Move(Data^, SB.Data, DataSize);
  if not ExchangeDataPacket(@SB, @RB, TimeOut)
     then begin
          Result:=ecConnectError;
          Exit;
          end;
  Result:=RB.Status;
  if (DB<>Nil) then Move(RB, DB^, RB.DataLen+sizeof(TLevel2Head));
  end;

function SendCommandWithData(DstAddr:word; Cmd:byte; Data:pointer; DataSize:integer; DB:PLevel2Pack; TimeOut:integer):integer;
 var n:integer;
  begin
  n:=0;
  repeat
  Result:=SendCommandWithDataInt(DstAddr, Cmd, Data, DataSize, DB, TimeOut);
  inc(n);
  until (Result<>ecConnectError) or (n>=TryCount);
  end;

function ExchangeCommandData(Cmd:byte; Data:pointer; DataSize:integer; OutBuff:pointer; NeedSz:integer; var OutSize:integer):integer;
 var D:TLevel2Pack;
  begin
  OutSize:=0;
  Result:=SendCommandWithData(DestAddr, Cmd, Data, DataSize, @D, WaitTimeOut);
  if Result<>ecOK then Exit;
  if NeedSz>=0 then begin
                    if D.DataLen<>NeedSz then begin
                                              Result:=ecBadAnswer;
                                              Exit;
                                              end;
                    end;
  OutSize:=D.DataLen;
  if (OutSize>0) and (OutBuff<>Nil) then Move(D.Data, OutBuff^, OutSize);
  end;

function ExchangeCommandSimple(Cmd:byte; Data:pointer; DataSize:integer):integer;
  begin
  Result:=SendCommandWithData(DestAddr, Cmd, Data, DataSize, Nil, WaitTimeOut);
  end;

function CheckConnect:integer;
  begin
  Result:=ExchangeCommandSimple(cmdCheckConnect, Nil, 0);
  end;

function ctrlReboot(Loader:boolean):integer;
 var b:byte;
  begin
  if Loader then b:=$A2
            else b:=$7A;
  Result:=ExchangeCommandSimple(cmdReboot, @b, 1);
  end;

type TReqDetails=packed record
  opts:byte;
  reserv:byte;
  Id:word;
  Mask:word;
  end;

function ctrlCheckConnByMask(Id, Mask:word; Sw:boolean):integer;
 var RD:TReqDetails;
  begin
  FillChar(RD, sizeof(RD), 0);
  if Sw then RD.opts:=1;
  RD.Id:=Id;
  RD.Mask:=Mask;
  Result:=ExchangeCommandSimple(cmdCheckConnByMask, @RD, sizeof(RD));
  end;

function ctrlGetConfByMask(Id, Mask:word; Sw:boolean; Conf:PTabConfig):integer;
 var sz:integer;
     RD:TReqDetails;
  begin
  FillChar(RD, sizeof(RD), 0);
  if Sw then RD.opts:=1;
  RD.Id:=Id;
  RD.Mask:=Mask;
  Result:=ExchangeCommandData(cmdGetConfByMask,  @RD, sizeof(RD), Conf, sizeof(TTabConfig), sz);
  if Result<>ecOK then Exit;
  end;

type TConfigWithDetails=packed record
  Passw:dword;
  D:TReqDetails;
  C:TTabConfig;
  end;

function ctrlSetConfByMask(Id, Mask:word; Sw:boolean; Conf:PTabConfig):integer;
 var CD:TConfigWithDetails;
  begin
  FillChar(CD, sizeof(CD), 0);
  if Sw then CD.D.opts:=1;
  CD.D.Id:=Id;
  CD.D.Mask:=Mask;
  CD.C:=Conf^;
  CD.Passw:=$7A129A71;
  Result:=ExchangeCommandSimple(cmdSetConfByMask, @CD, sizeof(CD));
  end;

function ctrlRestoreDefault:integer;
 var pass:dword;
  begin
  pass:=$A32E87B1;
  Result:=ExchangeCommandSimple(cmdRestoreDef, @pass, sizeof(dword));
  end;

function ctrlSetBright(Br:integer):integer;
  begin
  Result:=ExchangeCommandSimple(cmdSetBright, @Br, 1);
  end;

function WeekDayByDate(Day,Month,Year:integer):integer;
  begin
  try
  Result:=DayOfWeek(EncodeDate(Year,Month,Day));
  if Result=1 then Result:=7
              else Dec(Result);
  except
  Result:=1;
  end;
  end;

type
TMainTime=packed record
          Sec, Min, Hour,
          Date, Month, Year:byte;
          end;
          
function ctrlSetTime(T:TSystemTime):integer;
 var MT:TMainTime;
  begin
  MT.Sec:=T.wSecond;
  MT.Min:=T.wMinute;
  MT.Hour:=T.wHour;
  MT.Date:=T.wDay;
  MT.Month:=T.wMonth;
  MT.Year:=T.wYear mod 100;
//  MT.Hour:=0;
  Result:=ExchangeCommandSimple(cmdSetTime, @MT, sizeof(MT));
  end;

function ctrlGetTime(var T:TSystemTime):integer;
 var MT:TMainTime;
     sz:integer;
  begin
  Result:=ExchangeCommandData(cmdGetTime,  Nil, 0, @MT, sizeof(MT), sz);
  if Result<>ecOK then Exit;
  FillChar(T, sizeof(T), 0);
  T.wSecond:=MT.Sec;
  T.wMinute:=MT.Min;
  T.wHour:=MT.Hour;
  T.wDay:=MT.Date;
  T.wMonth:=MT.Month;
  T.wYear:=2000+MT.Year;
  T.wDayOfWeek:=WeekDayByDate(T.wDay, T.wMonth, T.wYear);
  end;


function ctrlOutText(P:POutTextParams; s:ansistring {s:string}):integer;
 var a:array [0..2047] of byte;
     n,i:integer;
  begin
  Move(P^, a, sizeof(TOutTextParams));
  n:=length(s);
  if (n>1006) then n:=1006;
  Move(Pointer(s)^, a[sizeof(TOutTextParams)], n);
//  for i:=0 to n-1 do a[sizeof(TOutTextParams)+i]:=a[sizeof(TOutTextParams)+i] and $7F;
  n:=n+sizeof(TOutTextParams);
  Result:=ExchangeCommandSimple(cmdOutText, @a, n);
  end;

function ctrlSetTestMode(Mask:word; Cycle:boolean):integer;
  begin
  Mask:=Mask and $07;
  if Cycle and (Mask<>0) then Mask:=Mask or $8000;
  Result:=ExchangeCommandSimple(cmdSetTestMode, @Mask, sizeof(Mask));
  end;

function ctrlSetTestMode2(Mask:word):integer;
  begin
  Result:=ExchangeCommandSimple(cmdSetTestMode, @Mask, sizeof(Mask));
  end;

//----------------------------------------------------------
//Only for loader
(*
function ctrlExecFlashCommand(F: Pointer { PFlashDataRec} ):integer;
var D:PFlashDataRec;
  begin
  D:=F;
  Result:=ExchangeCommandSimple(cmdExecFlashCommand, D, D.Head.size+sizeof(TFlashDataRecHeader));
  end;

function ctrlGetFontPageInfo(var PageCount, FlashSize:integer):integer;
 var a:array[0..1] of dword;
     sz:integer;
  begin
  PageCount:=0;
  FlashSize:=0;
  Result:=ExchangeCommandData(cmdGetFontInfo, Nil, 0, @a, sizeof(dword)*2, sz);
  if Result<>ecOK then Exit;
  PageCount:=a[0];
  FlashSize:=a[1];
  end;
*)

initialization
WorkPort:=TComPort.Create(true, true);

finalization
WorkPort.Free;

end.

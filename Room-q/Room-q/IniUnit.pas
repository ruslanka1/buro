unit IniUnit;

interface
uses Windows;

type
     TIniSet=record
             Position:TRect;
             PortNum:integer;
             Options, Id:integer;
             IpPort:string;
             end;

     PIniSet=^TIniSet;

var Ini:TIniSet;
const IniFileName:string='sets.ini';

procedure WriteIniFile(const Ini:TIniSet);
procedure ReadIniFile(var Ini:TIniSet);

implementation
uses IniFiles, SysUtils, classes;

const cIniParCount=5;
      RelPath='%PROGPATH%';
      cSect='Settings';
      cIniPars:array [1..cIniParCount] of PChar=(
      { 1 } 'Position',
      { 2 } 'PortNum',
      { 3 } 'Options',
      { 4 } 'IpPort',
      { 5 } 'ID'
      );

type TInt4=array[0..3] of integer;
     PInt4=^TInt4;

function SplitStringDiv(S:string;Dv:char):TStringList;
 var p:integer;
  begin
  S:=trim(S);
  Result:=TStringList.Create;
  if S='' then Exit;
  Result.Sorted:=false;
  repeat
  p:=Pos(Dv,S);
  if p=0 then begin
              Result.Add(trim(S))
              end
         else begin
              Result.Add(trim(copy(S,1,p-1)));
              S:=copy(S,p+1,Length(S)-p);
              end;
  until p=0;
  end;
      
function StringToRect(const S:string):TRect;
 var SL:TStringList;
     i,k,cd,n:integer;
     P:PInt4;
  begin
  SL:=SplitStringDiv(S,',');
  FillChar(Result,SizeOf(Result),0);
  n:=SL.Count;
  if n>4 then n:=4;
  P:=@Result;
  for i:=0 to n-1 do
    begin
    Val(trim(SL[i]),k,cd);
    P^[i]:=k;
    end;
  SL.Free;
  end;

function RectToString(R:TRect):string;
  begin
  Result:=IntToStr(R.Left)+','+IntToStr(R.Top)+','+IntToStr(R.Right)+','+IntToStr(R.Bottom);
  end;

  
procedure ReadIniFile(var Ini:TIniSet);
 var M:TMemIniFile;
//     err:boolean;
//     i:integer;
  begin
  try
  M:=TMemIniFile.Create(IniFileName);
  Ini.Position:=StringToRect(M.ReadString(cSect,cIniPars[1],''));
  Ini.PortNum:=M.ReadInteger(cSect, cIniPars[2], 1);
  Ini.Options:=M.ReadInteger(cSect, cIniPars[3],0);
  Ini.ID:=M.ReadInteger(cSect, cIniPars[5], 9999);
  Ini.IpPort:=M.ReadString(cSect, cIniPars[4],'192.168.0.11:5000');
  M.Free;
  except
  end;
  end;

procedure WriteIniFile(const Ini:TIniSet);
 var f:text;
//     i:integer;
  begin
  try
  assign(f,IniFileName);
  rewrite(f);
  writeln(f,'[',cSect,']');
  writeln(f,cIniPars[1],'=',RectToString(Ini.Position));
  writeln(f,cIniPars[2],'=',Ini.PortNum);
  writeln(f,cIniPars[3],'=',Ini.Options);
  writeln(f,cIniPars[5],'=',Ini.Id);
  writeln(f,cIniPars[4],'=',Ini.IpPort);
  close(f);
  except
  end;
  end;

initialization
end.


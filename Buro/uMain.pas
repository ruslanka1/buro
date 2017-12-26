unit uMain;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

{$IFDEF MSWINDOWS}
uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ComCtrls, Vcl.ExtCtrls,
  DBCtrlsEh,
  DBGridEhGrouping, GridsEh, DBGridEh, Data.DB,
  MemDB,
  ssWorks, SSheets,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack,
  IdSSL, IdSSLOpenSSL, IdMessage, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase,
  IdSMTP,
  Data.Win.ADODB
  ;
{$ENDIF}
{$IFDEF UNIX}
uses
//  Windows, Messages, 
  SysUtils, Variants, Classes, 
  Graphics, Forms, Dialogs,
  Controls, ComCtrls, StdCtrls, ExtCtrls,
//  Mask,
//  DBCtrlsEh,
//  DBGridEhGrouping, 
//  GridsEh, DBGridEh, 
  DB, DBGrids,
  DateTimePicker
//  ADODB,
  , SQLDB
//  MemDB,
  , MemDS
//  ssWorks, SSheets, 
  {$IFDEF INDY}
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack,
  IdSSL, IdSSLOpenSSL, IdMessage, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase,
  IdSMTP
  {$ENDIF}
  ;
{$ENDIF}

type

  { TMain }

  TMain = class(TForm)
    pnlTop: TPanel;
    btnNew: TButton;
    btnPrint: TButton;
    btnSend: TButton;
    btnScan: TButton;
    pcPGS: TPageControl;
    tsPerson: TTabSheet;
    tsTurn: TTabSheet;
    {$IFDEF MSWINDOWS}
    grdTurn: TDBGridEh;
    {$ENDIF}
    {$IFDEF UNIX}
    grdTurn: TDBGrid;
    {$ENDIF}
    imgPerson: TImage;
    sbTurn: TStatusBar;
    pnlTurn: TPanel;
    pnlPerson: TPanel;
    lblLNAME: TLabel;
    edLNAME: TEdit;
    lblFNAME: TLabel;
    edFNAME: TEdit;
    lblSNAME: TLabel;
    edSNAME: TEdit;
    lblSEX: TLabel;
    edSEX: TEdit;
    lblBDATE: TLabel;
    lblBPLACE: TLabel;
    edBPLACE: TEdit;
    lblWhDOC: TLabel;
    edWhDOC: TEdit;
    lblDTDOC: TLabel;
    lblCODEDOC: TLabel;
    edCODEDOC: TEdit;
    lblMAIL: TLabel;
    edMAIL: TEdit;
    lblOLD: TLabel;
    edOLD: TEdit;
    lblROOM: TLabel;
    edROOM: TEdit;
    {$IFDEF MSWINDOWS}
    edBDATE: TDBDateTimeEditEh;
    edDTDOC: TDBDateTimeEditEh;
    {$ENDIF}
    {$IFDEF UNIX}
    edBDATE: TDateTimePicker;
    edDTDOC: TDateTimePicker;
    {$ENDIF}
    lblTicket: TLabel;
    edTicket: TEdit;
    stStatus: TStaticText;
    lblDOCSER: TLabel;
    edDOCSER: TEdit;
    lblDOCNUM: TLabel;
    edDOCNUM: TEdit;
    lblGOAL: TLabel;
    edGOAL: TEdit;
//    stStatus: TPanel;
    tsList: TTabSheet;
    lblEvaID: TLabel;
    edEvaID: TEdit;
    btnEvaID: TButton;
//    pnlTurn: TPanel;
//    grdTurn: TDBGridEh;
//    sbTurn: TStatusBar;
    {$IFDEF MSWINDOWS}
    mt: TMemTable;
    {$ENDIF}
    {$IFDEF UNIX}
    mt: TMemDataset;
    {$ENDIF}
    mtNUM: TStringField;
    mtROOM: TStringField;
    mtLNAME: TStringField;
    mtFNMAE: TStringField;
    mtSNAME: TStringField;
    mtGOAL: TStringField;
    ds: TDataSource;
    btnTurnRefresh: TButton;
    pnlEva: TPanel;
    btnEvaRefresh: TButton;
    {$IFDEF MSWINDOWS}
    grdEva: TDBGridEh;
    sbEva: TStatusBar;
    mtReg: TMemTable;
    {$ENDIF}
    {$IFDEF UNIX}
    grdEva: TDBGrid;
    sbEva: TStatusBar;
    mtReg: TMemDataset;
    {$ENDIF}
    mtRegNumReg: TIntegerField;
    mtRegNmReg: TStringField;
    mtRegBdReg: TIntegerField;
    mtRegConnect: TStringField;
    dsReg: TDataSource;
    {$IFDEF MSWINDOWS}
    MSBase: TADOConnection;
    qReg: TADOQuery;
    ssw: TSSWriter;
    {$ENDIF}
    {$IFDEF UNIX}
    MSBase: TSQLConnector;
    qReg: TSQLQuery;
//    ssw: TSSWriter;
    {$ENDIF}
    lblEvaIP: TLabel;
    edEvaIP: TEdit;
    lblEvaBD: TLabel;
    edEvaBD: TEdit;
    lblEvaPort: TLabel;
    edEvaPort: TEdit;
    qRegGUID: TStringField;
    qRegLNAME: TWideStringField;
    qRegFNAME: TWideStringField;
    qRegSNAME: TWideStringField;
    qRegDT_MSE: TDateTimeField;
    qRegORG: TWideStringField;
    qRegROOM: TWideStringField;
    lblEvaOrg: TLabel;
    mmOrg: TMemo;
    procedure btnNewClick(Sender: TObject);
    procedure btnScanClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edBDATEExit(Sender: TObject);
    procedure btnEvaIDClick(Sender: TObject);
    procedure mtAfterScroll(DataSet: TDataSet);
    procedure btnTurnRefreshClick(Sender: TObject);
    procedure btnEvaRefreshClick(Sender: TObject);
    procedure grdEvaDblClick(Sender: TObject);
  private
    { Private declarations }
    f_ticket: integer;
    app_dir: string;
    f_save: boolean;
    procedure scan;
    procedure send;
    procedure save;
    procedure clear;
    procedure calc_old;
    procedure srun(nm: string);
    procedure init_ticket;
    function  set_barcode(s_num: string): string;
    procedure SaveDir;     // Ñîõðàíÿåì ïóòè â ðååñòð
    procedure LoadDir;     // Ñ÷èòûâàåì ïóòè èç ðååñòðà
    procedure save_eva(dt: TDateTime);
    procedure CrtXML(dt: TDateTime);
    procedure turn_refresh;// Ïåðå÷èòàòü î÷åðåäü
    procedure turn_write(lst: TStringList);  // Çàïèñàòü î÷åðåäü
    procedure GetConLst;
    procedure GetAllFiles(Path: string; Lb: TStringList; All: boolean=False);
  public
    { Public declarations }
  end;

var
  Main: TMain;

const
  {$IFDEF MSWINDOWS}
  FDIR = 'Z:\buro';
  {$ELSE}
  FDIR = './buro';
  {$ENDIF}
  FINI = 'data.ini';
  FIMG = 'data.jpg';
  FEVA = 'Z:\buro\_eva';

implementation

{$IFDEF MSWINDOWS}
uses System.IniFiles, Winapi.shellapi, JPEG, System.Win.Registry,
     System.DateUtils, System.Math, uTicket, System.StrUtils ;
{$ELSE}
uses IniFiles,
     DateUtils, StrUtils
//     , Math
     , Process
     , uTicket;
{$ENDIF}

{$IFDEF MSWINDOWS}
{$R *.dfm}
{$ENDIF}
{$IFDEF UNIX}
{$R *.lfm}
{$ENDIF}

procedure TMain.btnEvaRefreshClick(Sender: TObject);
begin
  GetConLst;
end;

procedure TMain.btnEvaIDClick(Sender: TObject);
begin
  Application.MessageBox('Ïîèñê â ÅÀÂÈÈÀÑ...','Âíèìàíèå');
end;

procedure TMain.btnNewClick(Sender: TObject);
begin
  clear;
end;

procedure TMain.btnPrintClick(Sender: TObject);
begin
  save;
  init_ticket;
end;

procedure TMain.btnSendClick(Sender: TObject);
begin
  //FIXME: not used here any more
end;

procedure TMain.btnScanClick(Sender: TObject);
begin
  clear;
  scan;
end;

procedure TMain.btnTurnRefreshClick(Sender: TObject);
begin
  turn_refresh;
end;

procedure TMain.calc_old;
begin
  {$IFDEF MSWINDOWS}
  if edBDATE.Value <> null then
    edOLD.Text:= IntToStr(YearsBetween(now, edBDATE.Value));
  {$ELSE}
  if edBDATE.Date <> null then
     edOLD.Text := IntToStr ( YearsBetween (Now, edBDATE.Date) );
  {$ENDIF}
end;

procedure TMain.clear;
begin
  stStatus.Caption:= '';
  edDOCSER.Text:= '';
  edDOCNUM.Text:= '';
  edLNAME.Text:= '';
  edFNAME.Text:= '';
  edSNAME.Text:= '';
  edSEX.Text:= '';
  {$IFDEF MSWINDOWS}
  edBDATE.Text:= '';
  edDTDOC.Text:= '';
  {$ELSE}
  edBDATE.Date:= NullDate;
  edDTDOC.Date:= NullDate;
  {$ENDIF}
  edBPLACE.Text:= '';
  edWhDOC.Text:= '';
  edCODEDOC.Text:= '';
  edMAIL.Text:= '';
  edOLD.Text:= '';
  edROOM.Text:= '';
  edGOAL.Text:= '';
  edEvaID.Text:= '';
  mmOrg.Lines.Text:= '';

  if f_save then
    inc(f_ticket);
  f_save:= false;
  edTicket.Text:=IntToStr(f_ticket);
  imgPerson.Hide;
end;

procedure TMain.edBDATEExit(Sender: TObject);
begin
  calc_old;
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveDir;
  Action := caFree;
end;

procedure TMain.FormShow(Sender: TObject);
var dir: string;
begin
  LoadDir;
  app_dir := ExtractFilePath (Application.ExeName);
  edTicket.Text := IntToStr(f_ticket);
  {$IFDEF MSWINDOWS}
  dir:= app_dir + '\' + 'About.jpg';
  {$ELSE}
  dir:= app_dir + '/' + 'About.jpg';
  {$ENDIF}
  imgPerson.Picture.LoadFromFile(dir);
  imgPerson.Show;
   pcPGS.ActivePage:= tsPerson;
end;

function TMain.set_barcode(s_num: string): string;
var dt_num: string;
begin
  dt_num:= IntToStr(DayOfTheYear(date));
  Result:= '*'+RightStr('000'+dt_num, 3)+RightStr('000'+s_num, 3)+'*';
end;

procedure TMain.init_ticket;
begin
  Ticket.mmOrg.Lines.Text:= trim(mmOrg.Lines.Text);
  Ticket.lblDate.Caption := FormatDateTime('dd.mm.yyyy', date);
  Ticket.lblRoom.Caption:= 'Êàáèíåò ¹ ' + edROOM.Text;
  Ticket.lblNumber.Caption:= set_barcode(edTicket.Text);
  Ticket.lblBarcode.Caption:= Ticket.lblNumber.Caption;
  Ticket.fdir:= FDIR+'\'+FormatDateTime('yyyy-mm-dd', now)+'\'+Format('%.3d', [f_ticket]);
  Ticket.femail:= trim(edMAIL.Text);
  Ticket.ShowModal;
end;

procedure TMain.save;
var
  c_dir: string;
  Ini: Tinifile;
  cdt: TDateTime;
begin
  if not DirectoryExists(FDIR) then
  begin
    stStatus.Caption:=  'Íåò ïîäêëþ÷åíèÿ ê õðàíèëèùó !';
    stStatus.Color:= clFuchsia;
    Application.ProcessMessages;
    exit;
  end;

  c_dir:= FDIR+'\'+FormatDateTime('yyyy-mm-dd', now);
  if (not DirectoryExists(c_dir)) and (not CreateDir(c_dir)) then
  begin
    stStatus.Caption:=  'Íåò âîçìîæíîñòè íà÷àòü ðåãèñòðàöèþ íà ñåãîäíÿ !';
    stStatus.Color:= clFuchsia;
    Application.ProcessMessages;
    exit;
  end;

  c_dir:= c_dir+'\'+Format('%.3d', [f_ticket]);  //IntToStr(f_ticket);
  if (not DirectoryExists(c_dir)) and (not CreateDir(c_dir)) then
  begin
    stStatus.Caption:=  'Íåò âîçìîæíîñòè ñîõðàíèòü ðåãèñòðàöèþ ïîñåòèòåëÿ !';
    stStatus.Color:= clFuchsia;
    Application.ProcessMessages;
    exit;
  end;

  cdt:= now;
  Ini:=TiniFile.Create(c_dir+'\'+FINI);
  try
    Ini.WriteDateTime('Person','dtcreat',cdt);
    Ini.WriteString('Person','docser',edDOCSER.Text);
    Ini.WriteString('Person','docnum',edDOCNUM.Text);
    Ini.WriteString('Person','fname',edFNAME.Text);
    Ini.WriteString('Person','lname',edLNAME.Text);
    Ini.WriteString('Person','sname',edSNAME.Text);
    Ini.WriteString('Person','sex',edSEX.Text);
    {$IFDEF MSWINDOWS}
    if (edBDATE.Value <> null) then
      Ini.WriteDate  ('Person','bdate',edBDATE.Value);
    {$ENDIF}
    {$IFDEF UNIX}
    if (edBDATE.Date <> NullDate) then
      Ini.WriteDate  ('Person','bdate',edBDATE.Date);
    {$ENDIF}
    Ini.WriteString('Person','bplase',edBPLACE.Text);
    Ini.WriteString('Person','whdoc',edWhDOC.Text);
    {$IFDEF MSWINDOWS}
    if (edDTDOC.Value <> null) then
      Ini.WriteDate  ('Person','dtdoc',edDTDOC.Value);
    {$ENDIF}
    {$IFDEF UNIX}
    if (edDTDOC.Date <> NullDate) then
      Ini.WriteDate  ('Person','dtdoc',edDTDOC.Date);
    {$ENDIF}
    Ini.WriteString('Person','coddoc',edCODEDOC.Text);
    Ini.WriteString('Person','mail',edMAIL.Text);
    Ini.WriteString('Person','room',edROOM.Text);
    Ini.WriteString('Person','ticket',edTicket.Text);
    Ini.WriteString('Person','old',edOLD.Text);
    Ini.WriteString('Person','goal',edGOAL.Text);
    Ini.WriteString('Person','evaid',edEvaID.Text);
    Ini.WriteString('Person','evaorg',mmOrg.Lines.Text);
    imgPerson.Picture.SaveToFile(c_dir+'\'+FIMG);
    save_eva(cdt);
  finally
    f_save:= True;
    Ini.Free;
    f_ticket:= f_ticket+1;
  end;
end;

procedure TMain.scan;
var
  s: string;
  lst: TStringList;
begin
  s :=  app_dir+'pscan.exe';
  if FileExists(s) then
    // ShellExecute(Handle, nil, PChar(s), '', '', SW_SHOW)  //SW_SHOWNOACTIVATE
    // WinExec('D:\AISU\[PRJS]\MSE\Buro\Buro\Win32\Debug\pscan.exe',SW_RESTORE)
    srun(s)
  else
    Application.MessageBox('Ïðîãðàììà ñêàíèðîâàíèÿ íå íàéäåíà...','Âíèìàíèå');
  stStatus.Caption:= '×èòàþ...';
  Application.ProcessMessages;
  s :=  app_dir+'scanned.txt';
  lst:= TStringList.Create;
  try
    lst.LoadFromFile(s);
    lst.Text:= StringReplace (lst.Text, ': ', '= ', [rfReplaceAll]);
    lst.Text:= StringReplace (lst.Text, '[+] ', '', [rfReplaceAll]);
    lst.Text:= StringReplace (lst.Text, '[-] ', '', [rfReplaceAll]);
    edDOCSER.Text := trim(lst.Values ['Series']);
    edDOCNUM.Text := trim(lst.Values ['Number']);
    edLNAME.Text := trim(lst.Values ['Surname']);
    edFNAME.Text := trim(lst.Values ['Name']);
    edSNAME.Text := trim(lst.Values ['Patronymic']);
    edSEX.Text := trim(lst.Values ['Gender']);
    {$IFDEF MSWINDOWS}
    edBDATE.Text := trim(lst.Values ['Birthdate']);
    {$ENDIF}
    {$IFDEF UNIX}
    edBDATE.Date := StrToDate (trim(lst.Values ['Birthdate']));
    {$ENDIF}
    edBPLACE.Text := trim(lst.Values ['Birthplace']);
    edWhDOC.Text := trim(lst.Values ['Authority']);
    edCODEDOC.Text := trim(lst.Values ['Authority code']);
    {$IFDEF MSWINDOWS}
    edDTDOC.Text := trim(lst.Values ['Issue date']);
    {$ENDIF}
    {$IFDEF UNIX}
    edDTDOC.Date := StrToDate (trim(lst.Values ['Issue date']));
    {$ENDIF}
  finally
    lst.Free;
    calc_old;
  end;

  try
    imgPerson.Picture.LoadFromFile(app_dir+'scanned.jpg');
  finally
    imgPerson.Show;
    stStatus.Caption:= '';
  end;
(*
  s :=  app_dir+'scanned.jpg';
  s_out:= FDIR+'\'+FormatDateTime('yyyy-mm-dd', now)+'\'+edTicket.Text;
  if not CopyFile(PChar(s),PChar(s_out),False) then
    Application.MessageBox('Îøèáêà êîïèðîâàíèÿ ñêàíà...','Âíèìàíèå');
*)
end;

procedure TMain.send;
begin
  Application.MessageBox('Îòïðàâëÿþ...','Âíèìàíèå');
end;

function Implode (separator: String; params: array of String): String;
var
  comma : String;
  n     : Integer;
begin
  Result := '';
  comma  := '';
  for n := Low (params) to High (params) do
  begin
    Result := Result + comma + params[n];
    comma  := separator
  end
end;

function runAndWait (nm: string; params: array of String): Boolean;
{$IFDEF MSWINDOWS}
var
  SEInfo: TShellExecuteInfo;
  ExitCode: DWORD;
  ExecuteFile: string;
//  ExecuteFile, ParamString, StartInString: string;
begin
  Result := False;

  ExecuteFile := nm;
  FillChar(SEInfo, SizeOf(SEInfo), 0);
  SEInfo.cbSize := SizeOf(TShellExecuteInfo);
  with SEInfo do
  begin
    fMask  := SEE_MASK_NOCLOSEPROCESS;
    Wnd    := Application.Handle;
    lpFile := PChar(ExecuteFile);
    {ParamString can contain theapplication parameters.}
    // lpParameters := PChar(ParamString);
    {StartInString specifies thename of the working
    directory.If ommited, the current
    directory is used.}
    // lpDirectory := PChar(StartInString);
    // nShow := SW_SHOWNORMAL;
    nShow := SW_HIDE;
  end;
  if not ShellExecuteEx(@SEInfo) then
    Exit;

  else
  begin
    repeat
      Sleep (100);
      Application.ProcessMessages;
      GetExitCodeProcess (SEInfo.hProcess, ExitCode);
    until (ExitCode <> STILL_ACTIVE)
       or  Application.Terminated
    ;
    Result := ExitCode <> STILL_ACTIVE
  end
{$ELSE}
var output : ansistring;
begin
  Result := RunCommand ('/bin/bash',['-c', nm, Implode (' ', params)], output) ;
//FIXME: save the output
//  if Result then
//     writeln (output);
{$ENDIF}
end;

type

Sys = class
public
  class function systemName () : String;
  class function OSVersion  () : String;
  class function command    (cmd: String; args: array of String) : Boolean;
  class function execUrl    (url : String) : Boolean;
end;

class function Sys.systemName () : String;
begin
  Result := '?';
{$IFDEF MSWINDOWS}
  Result := 'Windows';
{$ENDIF}
{$IFDEF LINUX}
  Result := 'Linux';
{$ELSE}
{$IFDEF UNIX}
  Result := 'Unix';
{$ENDIF}
{$ENDIF}
{$IFDEF OS_X}
// OS X ?
  Result := 'Mac';
{$ENDIF}
end;

//
// http://forum.lazarus.freepascal.org/index.php?topic=15390.0
//
class function Sys.OSVersion () : String;
 var
  osErr   : integer;
//  response: longint;
begin
  {$IFDEF LCLcarbon}
  OSVersion := 'Mac OS X 10.';
  {$ELSE}
  {$IFDEF Linux}
  OSVersion := 'Linux Kernel ';
  {$ELSE}
  {$IFDEF UNIX}
  OSVersion := 'Unix ';
  {$ELSE}
  {$IFDEF WINDOWS}
  if WindowsVersion = wv95 then OSVersion := 'Windows 95 '
   else if WindowsVersion = wvNT4 then OSVersion := 'Windows NT v.4 '
   else if WindowsVersion = wv98 then OSVersion := 'Windows 98 '
   else if WindowsVersion = wvMe then OSVersion := 'Windows ME '
   else if WindowsVersion = wv2000 then OSVersion := 'Windows 2000 '
   else if WindowsVersion = wvXP then OSVersion := 'Windows XP '
   else if WindowsVersion = wvServer2003 then OSVersion := 'Windows Server 2003 '
   else if WindowsVersion = wvVista then OSVersion := 'Windows Vista '
   else if WindowsVersion = wv7 then OSVersion := 'Windows 7 '
   else OSVersion:= 'Windows ';
  {$ENDIF}
  {$ENDIF}
  {$ENDIF}
  {$ENDIF}
//  Result := OSVersion
end;

class function Sys.command    (cmd: String; args: array of String) : Boolean;
begin
  Result := runAndWait (cmd, args);
end;

//
// https://stackoverflow.com/questions/36822025/execute-url-path-in-external-program-in-haxe
//

class function Sys.execUrl (url : String) : Boolean;
var
   urlOpen: String;
begin
    case ( Sys.systemName ()[1] ) of
      'L': urlOpen := 'xdg-open'; // Linux
      'U': urlOpen := 'xdg-open'; // Unix
      'M': urlOpen := 'open'    ; // Max (OS X)
      'W': urlOpen := 'start'   ; // Windows
      else urlOpen := 'xdg-open'; // FIXME: just hope it's true...
    end;
    Result := Sys.command (urlOpen, [url]);
end;


procedure TMain.srun(nm: string);
begin
  try
    Screen.Cursor    := crHourGlass;
    stStatus.Caption := 'Идёт сканирование...';
    Application.ProcessMessages;

    if runAndWait (nm, []) then
      stStatus.Caption := 'Сканирование закончено.'
    else
      ShowMessage ('Сканирование не запустилось...')

  finally
    Screen.Cursor := crDefault;
  end
end;

procedure TMain.SaveDir;
{$IFDEF MSWINDOWS}
var Reg: TRegIniFile;
{$ELSE}
  //FIXME: introduce application configuration
{$ENDIF}
begin
{$IFDEF MSWINDOWS}
  // Сохраняем пути в реестр
  Reg:= TRegIniFile.Create('Software');
  try
    Reg.OpenKey(ExtractFileName(ParamStr(0)), true);
    Reg.WriteInteger(Name, 'Max',    ord(Main.WindowState = wsMaximized));
    Reg.WriteInteger(Name, 'Left',   Main.Left);
    Reg.WriteInteger(Name, 'Top',    Main.Top);
    Reg.WriteInteger(Name, 'Height', Main.Height);
    Reg.WriteInteger(Name, 'Width',  Main.Width);
    Reg.WriteInteger(Name, 'ticket', f_ticket);
    Reg.WriteString (Name, 'sdate', DateToStr(date));
    Reg.WriteBool   (Name, 'save',   f_save);
    Reg.WriteString (Name, 'eva_bd', Trim(edEvaBD.Text));
    Reg.WriteString (Name, 'eva_ip', Trim(edEvaIP.Text));
    Reg.WriteString (Name, 'eva_pt', Trim(edEvaPort.Text));
  finally
    Reg.Free;
  end;
{$ELSE}
    //FIXME: save configuration
{$ENDIF}
end;

procedure TMain.LoadDir;
{$IFDEF MSWINDOWS}
var
  Reg: TRegIniFile;
  cdate: TDateTime;
  w_max: integer;
{$ELSE}
  //FIXME: introduce application configuration
{$ENDIF}
begin
  {$IFDEF MSWINDOWS}
  // Ñ÷èòûâàåì ïóòè èç ðååñòðà
  Reg:= TRegIniFile.Create('Software');
  try
    Reg.OpenKey(ExtractFileName(ParamStr(0)), true);
    w_max:=        Reg.ReadInteger(Name, 'Max',    0);
    if w_max = 1 then
      Main.WindowState:= wsMaximized
    else
      Main.WindowState:= wsNormal;
    Main.Left:=     Reg.ReadInteger(Name, 'Left',   Main.Left);
    Main.Top:=      Reg.ReadInteger(Name, 'Top',    Main.Top);
    Main.Height:=   Reg.ReadInteger(Name, 'Height', Main.Height);
    Main.Width:=    Reg.ReadInteger(Name, 'Width',  Main.Width);
    edEvaBD.Text:=  Reg.ReadString(Name, 'eva_bd', '');
    edEvaIP.Text:=  Reg.ReadString(Name, 'eva_ip', '');
    edEvaPort.Text:=Reg.ReadString(Name, 'eva_pt', '');
    f_save:=        Reg.ReadBool   (Name, 'save',   True);
    f_ticket:=      Reg.ReadInteger(Name, 'ticket', 0);
    cdate:=         StrToDate(Reg.ReadString (Name, 'sdate', '01.01.1900'));
    if cdate < date then
       f_ticket:=0;
  finally
    inc(f_ticket);
    Reg.Free;
  end;
  {$ELSE}
  //FIXME: load configuration
  {$ENDIF}
end;

procedure TMain.mtAfterScroll(DataSet: TDataSet);
begin
  sbTurn.Panels[0].Text:= Format('%d : %d', [DataSet.RecNo, DataSet.RecordCount]);
end;

procedure TMain.save_eva(dt: TDateTime);
begin
  if not DirectoryExists(FEVA) then
  begin
    stStatus.Caption:=  'Íåò ïîäêëþ÷åíèÿ ê õðàíèëèùó ÅÀÂÈÈÀÑ!';
    stStatus.Color:= clFuchsia;
    Application.ProcessMessages;
    exit;
  end;

  stStatus.Caption:= 'Âûãðóæàåì â XML...';
  Application.ProcessMessages;
  try
    CrtXML(dt);
  finally
    stStatus.Caption:= 'Ãîòîâî!';
    Application.ProcessMessages;
    sleep(1000);
    stStatus.Caption:= '';
    Application.ProcessMessages;
  end;
end;

procedure TMain.CrtXML(dt: TDateTime);
var
  s: string;
  fXML: TStringList;
  MyGUID : TGUID;

  function sxml(str: string): string;
  begin
    str:= StringReplace(str,'>','',[rfReplaceAll]);
    str:= StringReplace(str,'<','',[rfReplaceAll]);
    Result:= trim(str);
  end;

  procedure XmlHeader;
  begin
    fXML.Clear;
    fXML.Add('<?xml version="1.0" encoding="WINDOWS-1251"?>');
    fXML.Add('<EVA xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">');
    fXML.Add('  <PackageAttrs>');
    fXML.Add('    <CreatingDateTime>' + FormatDateTime('yyyy-mm-dd hh:mm:ss.zzz',now) + '</CreatingDateTime>');
    fXML.Add('    <SchemaVersion>1.0</SchemaVersion>');
    fXML.Add('  </PackageAttrs>');
  end;

  procedure XmlFooter;
  begin
    fXML.Add('</EVA>');
  end;

  procedure XmlBoby;
  begin
    fXML.Add('  <Person>');
    try
      fXML.Add('    <DT>'+sxml(FormatDateTime('yyyy-mm-dd hh:mm:ss',dt))+'</DT>');
      fXML.Add('    <ID>'+sxml(s)+'</ID>');
      fXML.Add('    <EVAID>'+sxml(edEvaID.Text)+'</EVAID>');
      fXML.Add('    <NUM>'+sxml(Format('%.3d', [f_ticket]))+'</NUM>');
      fXML.Add('    <LNAME>'+sxml(edLNAME.Text)+'</LNAME>');
      fXML.Add('    <FNAME>'+sxml(edFNAME.Text)+'</FNAME>');
      fXML.Add('    <SNAME>'+sxml(edSNAME.Text)+'</SNAME>');
      fXML.Add('    <BDATE>'+sxml(FormatDateTime ('yyyy-mm-dd hh:mm:ss', edBDATE.Date))+'</BDATE>');
      fXML.Add('    <GOAL>'+sxml(edGOAL.Text)+'</GOAL>');
    finally
      fXML.Add('  </Person>');
    end;
  end;
begin
  if (CreateGUID(MyGUID) = 0) then
  begin
    s:= StringReplace(StringReplace(GUIDToString(MyGuid),'{','',[]),'}','',[]);
    fXML:= TStringList.Create;
    try
      XmlHeader;
      try
        XmlBoby
      finally
        XmlFooter;
      end;
      fXML.SaveToFile(FEVA+'\'+s+'.xml');
    finally
      fXML.Free;
    end;
  end;
end;

procedure TMain.grdEvaDblClick(Sender: TObject);
begin
  if not qReg.IsEmpty then
  begin
    edEvaID.Text:= qRegGUID.AsString;
    mmOrg.Lines.Text:= qRegORG.AsString;
    edROOM.Text:=  qRegROOM.AsString;
    pcPGS.ActivePage:= tsPerson;
  end;
end;

procedure TMain.turn_refresh;
var
  s: string;
  lst: TStringList;
begin
  lst:= TStringList.Create;
  try
    if not DirectoryExists(FDIR) then
    begin
      s:= 'Ïàïêà èñòî÷íèêà ' + FDIR + ' íå ñóùåñòâóåò...';
      Application.MessageBox(PChar(s), PChar('Âíèìàíèå'));
      exit;
    end;
//    s:= '2017-12-15';
    s:= FormatDateTime('yyyy-mm-dd', date);
    GetAllFiles(FDIR+'\'+s, lst, True);
    turn_write(lst);
  finally
    lst.Free;
  end;
end;

procedure TMain.turn_write(lst: TStringList);
var
  i: integer;
  Ini: Tinifile;
  st: TStringList;
begin
  mt.DisableControls;
  st:= TStringList.Create;
  try
    mt.Close;
    mt.Open;
    for i := 0 to lst.Count - 1 do
    begin
      st.Text:= StringReplace(lst[i],'\',#13#10,[rfReplaceAll]);
      Ini:=TiniFile.Create(lst[i]);
      try
        mt.Append;
        mtNUM.AsString:=   st[st.Count-2];
        mtLNAME.AsString:= Ini.ReadString('Person','lname','');
        mtFNMAE.AsString:= Ini.ReadString('Person','fname','');
        mtSNAME.AsString:= Ini.ReadString('Person','sname','');
        mtROOM.AsString:=  Ini.ReadString('Person','room','');
        mtGOAL.AsString:=  Ini.ReadString('Person','goal','');
        mt.Post;
{
        Ini.ReadString('Person','docser','');
        Ini.ReadString('Person','docnum','');
        Ini.ReadString('Person','fname','');
        Ini.ReadString('Person','lname','');
        Ini.ReadString('Person','sname','');
        Ini.ReadString('Person','sex','');
        Ini.ReadDate('Person','bdate',date);
        Ini.ReadString('Person','bplase','');
        Ini.ReadString('Person','whdoc','');
        Ini.ReadDate('Person','dtdoc',date);
        Ini.ReadString('Person','coddoc','');
        Ini.ReadString('Person','mail','');
        Ini.ReadString('Person','room','');
        Ini.ReadString('Person','ticket','');
        Ini.ReadString('Person','old','');
        Ini.ReadString('Person','goal','');
}
      finally
        Ini.Free;
      end;
    end;
  finally
    mt.EnableControls;
  end;
end;

procedure TMain.GetAllFiles(Path: string; Lb: TStringList; All: boolean=False);
var
  sub, str: string;
  sRec: TSearchRec;
  isFound: boolean;
begin
  isFound := FindFirst( Path + '\*.*', faAnyFile, sRec ) = 0;
  while isFound do
  begin
    if (sRec.Name <> '.') and (sRec.Name <> '..') then
    begin
      if (sRec.Attr and faDirectory) = faDirectory then
      begin
        if All then
          GetAllFiles(Path + '\' + sRec.Name, Lb, All);
      end
      else
      begin
        str:= AnsiUpperCase(trim(sRec.Name));
        sub:= AnsiUpperCase(FINI);
        if str = sub then
          Lb.Add(Path + '\' + sRec.Name);
      end;
    end;
    Application.ProcessMessages;
    isFound:= FindNext(sRec) = 0;
  end;
  FindClose(sRec);
end;

procedure TMain.GetConLst;
//const
//  CONLOG = 'ConLog.txt';
//  CON = 'Provider=SQLOLEDB.1;Password=%s;Persist Security Info=True;User ID=%s;Initial Catalog=%s;Data Source=%s';
var
//  ConStr, ct, lg: string;
  us, ps, ds, dn: string;
  {$IFDEF UNIX}
  AvailableConnections: TStringList;
  {$ENDIF}
begin
//  lg:= '';
  stStatus.Caption:= '';
  MSBase.Close;
  mtReg.Close;
  mtReg.Open ;

  us := Trim('mseUser');      // user
  ps := Trim('123mse123');    // password
//  ct := Trim(edEvaBD.Text);   // èìÿ ÁÄ ÅÀÂÈÈÀÑ ÌÑÝ
  ds := Trim(edEvaIP.Text);   // àäðåñ MS SQL
  dn := Trim(edEvaPort.Text); // ïîðò MS SQL

//  ConStr:= '';

  if (ds <> '') and (dn <> '') then
    ds:= ds + ', ' + dn;

  if ds <> '' then
  begin
    try
    {$IFDEF MSWINDOWS}
    ConStr:= Format(CON,[ps,us,ct,ds]);
    MSBase.ConnectionString:= ConStr;
    {$ENDIF}
    {$IFDEF UNIX}
//    ConStr:= Format(CON,[ps,us,ct,ds]);
    AvailableConnections := TStringList.Create;
    GetConnectionList (AvailableConnections);
    MSBase.ConnectorType := AvailableConnections[0]; //FIXME: I hope, ms-sql
    MSBase.HostName:=ds;
    MSBase.UserName:=us;
    MSBase.Password:=ps;
    {$ENDIF}
    finally
    {$IFDEF UNIX}
    AvailableConnections.Free;
    {$ENDIF}
    end;
    try
      MSBase.Open;     // Òåñò
      qReg.Close;
      qReg.Open;
    except
      on E: Exception do
        stStatus.Caption:= 'Îøèáêà ïîäêëþ÷åíèÿ ê ÅÀÂÈÈÀÑ ( '+E.Message +' )';
    end;
      Application.ProcessMessages;
  end;
end;

end.

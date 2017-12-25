unit uMain;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

{$IFDEF MSWINDOWS}
uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Mask
  DBCtrlsEh,
  DBGridEhGrouping, GridsEh, DBGridEh
  ;
{$ELSE}
  uses
  SysUtils, Variants, Classes,
  Graphics, Controls, Forms, Dialogs, ComCtrls,
  StdCtrls, ExtCtrls
//  Mask,
//  DBGrid
  , DBGrids
  , DateTimeCtrls
  , DateTimePicker
  ;
{$ENDIF}

type

  { TMain }

  TMain = class(TForm)
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    pnlTop: TPanel;
    btnNew: TButton;
    btnPrint: TButton;
    btnSend: TButton;
    btnScan: TButton;
    pcPGS: TPageControl;
    tsPerson: TTabSheet;
    tsTurn: TTabSheet;
    grdTurn: TDBGrid;
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
    edBDATE: TDateTimePicker;
    edDTDOC: TDateTimePicker;
    lblTicket: TLabel;
    edTicket: TEdit;
    stStatus: TStaticText;
    lblDOCSER: TLabel;
    edDOCSER: TEdit;
    lblDOCNUM: TLabel;
    edDOCNUM: TEdit;
    lblGOAL: TLabel;
    edGOAL: TEdit;
    procedure btnNewClick(Sender: TObject);
    procedure btnScanClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edBDATEExit(Sender: TObject);
  private
    { Private declarations }
    f_ticket: integer;
    app_dir: string;
    procedure scan;
    procedure send;
    procedure save;
    procedure clear;
    procedure calc_old;
    procedure srun(nm: string);
    procedure init_ticket;
    function  set_barcode(s_num: string): string;
    procedure SaveDir;     // Сохраняем пути в реестр
    procedure LoadDir;     // Считываем пути из реестра
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

implementation

{$IFDEF MSWINDOWS}
uses System.IniFiles, Winapi.shellapi, JPEG, System.Win.Registry,
     System.DateUtils, System.Math, uTicket, System.StrUtils ;
{$ELSE}
uses IniFiles,
     DateUtils, Math, StrUtils
     , Process
     , uTicket;
{$ENDIF}

{$R *.dfm}

procedure TMain.btnNewClick(Sender: TObject);
begin
  clear;
end;

procedure TMain.btnPrintClick(Sender: TObject);
begin
  save;
  init_ticket;
end;

procedure TMain.btnScanClick(Sender: TObject);
begin
  clear;
  scan;
end;

procedure TMain.btnSendClick(Sender: TObject);
begin
  save;
  send;
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
  stStatus.Caption := '';
  edDOCSER.Text := '';
  edDOCNUM.Text := '';
  edLNAME.Text  := '';
  edFNAME.Text  := '';
  edSNAME.Text  := '';
  edSEX.Text    := '';
  {$IFDEF MSWINDOWS}
  edBDATE.Text  := '';
  {$ELSE}
  edBDATE.Date  := NullDate; // EncodeDate (1800, 1, 1);
  {$ENDIF}
  edBPLACE.Text := '';
  edWhDOC.Text  := '';
  {$IFDEF MSWINDOWS}
  edDTDOC.Text  := '';
  {$ELSE}
  edDTDOC.Date  := NullDate; // EncodeDate (1800, 1, 1);
  {$ENDIF}
  edCODEDOC.Text:= '';
  edMAIL.Text   := '';
  edOLD.Text    := '';
  edROOM.Text   := '';
  edTicket.Text := IntToStr (f_ticket);

  imgPerson.Hide;
end;

procedure TMain.edBDATEExit (Sender: TObject);
begin
  calc_old;
end;

procedure TMain.FormClose (Sender: TObject; var Action: TCloseAction);
begin
  SaveDir;
end;

procedure TMain.FormShow (Sender: TObject);
var
  dir: string;
begin
  LoadDir;
  app_dir:= ExtractFilePath (Application.ExeName);
  edTicket.Text := IntToStr (f_ticket);
  dir := IncludeTrailingPathDelimiter (app_dir) + 'About.jpg';
  imgPerson.Picture.LoadFromFile (dir);
  imgPerson.Show;
  pcPGS.ActivePage := tsPerson;
end;

function TMain.set_barcode(s_num: string): string;
begin
  Result := '*' + RightStr ('00000' + s_num, 5) + '*';
end;

procedure TMain.init_ticket;
begin
  Ticket.lblTitle.Caption   := 'ФГБУ ФБ МСЭ';
  Ticket.lblDate.Caption    := FormatDateTime ('dd.mm.yyyy', date);
  Ticket.lblRoom.Caption    := edROOM.Text;
  Ticket.lblNumber.Caption  := set_barcode (edTicket.Text);
  Ticket.lblBarcode.Caption := Ticket.lblNumber.Caption;
  Ticket.ShowModal;
end;

procedure TMain.save;
var
  s, c_dir: string;
  Ini: Tinifile;
begin
  if not DirectoryExists(FDIR) then
  begin
    s:= 'Папка ' + FDIR + ' не существует...';
    Application.MessageBox(PChar(s), PChar('Внимание'));
    exit;
  end;

  c_dir:= FDIR+'\'+FormatDateTime('yyyy-mm-dd', now);
  if (not DirectoryExists(c_dir)) and (not CreateDir(c_dir)) then
  begin
    s:= 'Папку для копий ' + c_dir + ' не удаётся создать...';
    Application.MessageBox(PChar(s), PChar('Внимание'));
    exit;
  end;

  c_dir:= c_dir+'\'+Format('%.5d', [f_ticket]);  //IntToStr(f_ticket);
  if (not DirectoryExists(c_dir)) and (not CreateDir(c_dir)) then
  begin
    s:= 'Папку для талона ' + c_dir + ' не удаётся создать...';
    Application.MessageBox(PChar(s), PChar('Внимание'));
    exit;
  end;

  Ini:=TiniFile.Create(c_dir+'\'+FINI);
  try
    Ini.WriteString('Person','docser',edDOCSER.Text);
    Ini.WriteString('Person','docnum',edDOCNUM.Text);
    Ini.WriteString('Person','fname',edFNAME.Text);
    Ini.WriteString('Person','lname',edLNAME.Text);
    Ini.WriteString('Person','sname',edSNAME.Text);
    Ini.WriteString('Person','sex',edSEX.Text);
    {$IFDEF MSWINDOWS}
    if (edBDATE.Value <> null) then
       Ini.WriteDate  ('Person','bdate',edBDATE.Value);
    {$ELSE}
    if (not edBDATE.DateIsNull) then
       Ini.WriteDate  ('Person','bdate',edBDATE.Date);
    {$ENDIF}
    Ini.WriteString('Person','bplase',edBPLACE.Text);
    Ini.WriteString('Person','whdoc',edWhDOC.Text);
    {$IFDEF MSWINDOWS}
    if (edDTDOC.Value <> null) then
      Ini.WriteDate  ('Person','dtdoc',edDTDOC.Value);
    {$ELSE}
    if (not edDTDOC.DateIsNull) then
       Ini.WriteDate  ('Person','dtdoc',edDTDOC.Date);
    {$ENDIF}
    Ini.WriteString('Person','coddoc',edCODEDOC.Text);
    Ini.WriteString('Person','mail',edMAIL.Text);
    Ini.WriteString('Person','room',edROOM.Text);
    Ini.WriteString('Person','ticket',edTicket.Text);
    Ini.WriteString('Person','old',edOLD.Text);
    Ini.WriteString('Person','goal',edGOAL.Text);
    imgPerson.Picture.SaveToFile(c_dir+'\'+FIMG);
  finally
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
    Application.MessageBox('Программа сканирования не найдена...','Внимание');
  stStatus.Caption:= 'Читаю...';
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
    {$ELSE}
     //FIXME:
    edBDATE.Date := StrToDate (lst.Values ['Birthdate']);
    {$ENDIF}
    edBPLACE.Text := trim(lst.Values ['Birthplace']);
    edWhDOC.Text := trim(lst.Values ['Authority']);
    edCODEDOC.Text := trim(lst.Values ['Authority code']);
    {$IFDEF MSWINDOWS}
    edDTDOC.Text := trim(lst.Values ['Issue date']);
    {$ELSE}
    edDTDOC.Date := StrToDate (lst.Values ['Issue date']);
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
    Application.MessageBox('Ошибка копирования скана...','Внимание');
*)
end;

procedure TMain.send;
begin
  Application.MessageBox('Отправляю...','Внимание');
end;

function runAndWait (nm: string): Boolean;
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
  Result := RunCommand ('/bin/bash',['-c', nm], output) ;
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
  response: longint;
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
  Result := runAndWait (cmd);
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
    Sys.command (urlOpen, [url]);
end;


procedure TMain.srun(nm: string);
begin
  try
    Screen.Cursor    := crHourGlass;
    stStatus.Caption := 'Идёт сканирование...';
    Application.ProcessMessages;

    if runAndWait (nm) then
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
    Reg.WriteInteger(Name, 'Left',   Main.Left);
    Reg.WriteInteger(Name, 'Top',    Main.Top);
    Reg.WriteInteger(Name, 'Height', Main.Height);
    Reg.WriteInteger(Name, 'Width',  Main.Width);
    Reg.WriteInteger(Name, 'ticket', f_ticket);
    Reg.WriteString (Name, 'sdate', DateToStr(date));
//    Reg.WriteString (Name, 'Flt',    edFlt.Value);
//    Reg.WriteString (Name, 'Src',    edSrc.Value);
//    Reg.WriteString (Name, 'Cpy',    edCpy.Value);
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
{$ELSE}
  //FIXME: introduce application configuration
{$ENDIF}
begin
{$IFDEF MSWINDOWS}
  // Считываем пути из реестра
  Reg:= TRegIniFile.Create('Software');
  try
    Reg.OpenKey(ExtractFileName(ParamStr(0)), true);
    Main.Left:=    Reg.ReadInteger(Name, 'Left',   Main.Left);
    Main.Top:=     Reg.ReadInteger(Name, 'Top',    Main.Top);
    Main.Height:=  Reg.ReadInteger(Name, 'Height', Main.Height);
    Main.Width:=   Reg.ReadInteger(Name, 'Width',  Main.Width);
    f_ticket:=     Reg.ReadInteger(Name, 'ticket', 0);
    cdate:=        StrToDate(Reg.ReadString (Name, 'sdate', '0'));
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

end.

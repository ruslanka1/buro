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
<<<<<<< HEAD
    grdTurn: TDBGridEh;
=======
    grdTurn: TDBGrid;
>>>>>>> 1-merge
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
<<<<<<< HEAD
    procedure SaveDir;     // Ñîõðàíÿåì ïóòè â ðååñòð
    procedure LoadDir;     // Ñ÷èòûâàåì ïóòè èç ðååñòðà
    procedure save_eva(dt: TDateTime);
    procedure CrtXML(dt: TDateTime);
    procedure turn_refresh;// Ïåðå÷èòàòü î÷åðåäü
    procedure turn_write(lst: TStringList);  // Çàïèñàòü î÷åðåäü
    procedure GetConLst;
    procedure GetAllFiles(Path: string; Lb: TStringList; All: boolean=False);
    function get_ticket: integer;
=======
    procedure SaveDir;     // Сохраняем пути в реестр
    procedure LoadDir;     // Считываем пути из реестра
>>>>>>> 1-merge
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

<<<<<<< HEAD
procedure TMain.btnEvaRefreshClick(Sender: TObject);
begin
  GetConLst;
end;

procedure TMain.btnEvaIDClick(Sender: TObject);
begin
  Application.MessageBox('Ïîèñê â ÅÀÂÈÈÀÑ...','Âíèìàíèå');
end;

=======
>>>>>>> 1-merge
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
<<<<<<< HEAD
  Ticket.mmOrg.Lines.Text:= trim(mmOrg.Lines.Text);
  Ticket.lblDate.Caption := FormatDateTime('dd.mm.yyyy', date);
  Ticket.lblTime.Caption := trim(edTime.Text);
  Ticket.lblRoom.Caption:= 'Êàáèíåò ' + edROOM.Text;
  Ticket.lblNumber.Caption:= set_barcode(edTicket.Text);
  Ticket.lblBarcode.Caption:= Ticket.lblNumber.Caption;
  Ticket.fdir:= prs_dir;
  Ticket.femail:= trim(edMAIL.Text);
=======
  Ticket.lblTitle.Caption   := 'ФГБУ ФБ МСЭ';
  Ticket.lblDate.Caption    := FormatDateTime ('dd.mm.yyyy', date);
  Ticket.lblRoom.Caption    := edROOM.Text;
  Ticket.lblNumber.Caption  := set_barcode (edTicket.Text);
  Ticket.lblBarcode.Caption := Ticket.lblNumber.Caption;
>>>>>>> 1-merge
  Ticket.ShowModal;
end;

procedure TMain.save;
var
  s, c_dir: string;
  Ini: Tinifile;
begin
  if not DirectoryExists(FDIR) then
  begin
<<<<<<< HEAD
    stStatus.Caption:=  'Íåò ïîäêëþ÷åíèÿ ê õðàíèëèùó !';
    stStatus.Color:= clFuchsia;
    Application.ProcessMessages;
=======
    s:= 'Папка ' + FDIR + ' не существует...';
    Application.MessageBox(PChar(s), PChar('Внимание'));
>>>>>>> 1-merge
    exit;
  end;

  c_dir:= FDIR+'\'+FormatDateTime('yyyy-mm-dd', now);
  if (not DirectoryExists(c_dir)) and (not CreateDir(c_dir)) then
  begin
<<<<<<< HEAD
    stStatus.Caption:=  'Íåò âîçìîæíîñòè íà÷àòü ðåãèñòðàöèþ íà ñåãîäíÿ !';
    stStatus.Color:= clFuchsia;
    Application.ProcessMessages;
=======
    s:= 'Папку для копий ' + c_dir + ' не удаётся создать...';
    Application.MessageBox(PChar(s), PChar('Внимание'));
>>>>>>> 1-merge
    exit;
  end;

  c_dir:= c_dir+'\'+Format('%.5d', [f_ticket]);  //IntToStr(f_ticket);
  if (not DirectoryExists(c_dir)) and (not CreateDir(c_dir)) then
  begin
<<<<<<< HEAD
    stStatus.Caption:=  'Íåò âîçìîæíîñòè ñîõðàíèòü ðåãèñòðàöèþ ïîñåòèòåëÿ !';
    stStatus.Color:= clFuchsia;
    Application.ProcessMessages;
=======
    s:= 'Папку для талона ' + c_dir + ' не удаётся создать...';
    Application.MessageBox(PChar(s), PChar('Внимание'));
>>>>>>> 1-merge
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
<<<<<<< HEAD
    Application.MessageBox('Ïðîãðàììà ñêàíèðîâàíèÿ íå íàéäåíà...','Âíèìàíèå');
  stStatus.Caption:= '×èòàþ...';
=======
    Application.MessageBox('Программа сканирования не найдена...','Внимание');
  stStatus.Caption:= 'Читаю...';
>>>>>>> 1-merge
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
<<<<<<< HEAD
    Application.MessageBox('Îøèáêà êîïèðîâàíèÿ ñêàíà...','Âíèìàíèå');
=======
    Application.MessageBox('Ошибка копирования скана...','Внимание');
>>>>>>> 1-merge
*)
end;

procedure TMain.send;
begin
<<<<<<< HEAD
  Application.MessageBox('Îòïðàâëÿþ...','Âíèìàíèå');
=======
  Application.MessageBox('Отправляю...','Внимание');
>>>>>>> 1-merge
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
<<<<<<< HEAD
    ShowMessage('Ñêàíèðîâàíèå íå çàïóñòèëîñü...')
  else
  begin
    stStatus.Caption:= 'Èäžò ñêàíèðîâàíèå...';
    Screen.Cursor:= crHourGlass;
    try
      repeat
        Sleep (100);
        Application.ProcessMessages;
        GetExitCodeProcess(SEInfo.hProcess, ExitCode);
      until (ExitCode <> STILL_ACTIVE)
         or  Application.Terminated
      ;
      stStatus.Caption:= 'Ñêàíèðîâàíèå çàêîí÷åíî.';
    finally
      Screen.Cursor:= crDefault;
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
  // Ñîõðàíÿåì ïóòè â ðååñòð
  Reg:= TRegIniFile.Create('Software');
  try
    Reg.OpenKey(ExtractFileName(ParamStr(0)), true);
    Reg.WriteInteger(Name, 'Max',    ord(Main.WindowState = wsMaximized));
    Reg.WriteInteger(Name, 'Left',   Main.Left);
    Reg.WriteInteger(Name, 'Top',    Main.Top);
    Reg.WriteInteger(Name, 'Height', Main.Height);
    Reg.WriteInteger(Name, 'Width',  Main.Width);
    //Reg.WriteInteger(Name, 'ticket', f_ticket);
    //Reg.WriteString (Name, 'sdate', DateToStr(date));
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
{
    f_ticket:=      Reg.ReadInteger(Name, 'ticket', 0);
    cdate:=         StrToDate(Reg.ReadString (Name, 'sdate', '01.01.1900'));
    if cdate < date then
      f_ticket:=0;
}
  finally
    inc(f_ticket);
    Reg.Free;
  end;
{$ELSE}
  //FIXME: load configuration
{$ENDIF}
=======
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
>>>>>>> 1-merge
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
<<<<<<< HEAD
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
    stStatus.Caption:= 'Â ÅÀÂÈÈÀÑ íàïðàâëåíî!';
    Application.ProcessMessages;
    sleep(1000);
    stStatus.Caption:= '';
    Application.ProcessMessages;
  end;
=======
  Result := runAndWait (cmd);
>>>>>>> 1-merge
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


<<<<<<< HEAD
procedure TMain.turn_refresh;
var
  s: string;
  lst: TStringList;
=======
procedure TMain.srun(nm: string);
>>>>>>> 1-merge
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

<<<<<<< HEAD
procedure TMain.turn_write(lst: TStringList);
  function set_code(s_num: string): string;
  var dt_num: string;
  begin
    dt_num:= IntToStr(DayOfTheYear(date));
    Result:= RightStr('000'+dt_num, 3)+RightStr('000'+s_num, 3);
  end;
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
        mtNUM.AsString:=   set_code(Ini.ReadString('Person','ticket',''));
        mtLNAME.AsString:= Ini.ReadString('Person','lname','');
        mtFNMAE.AsString:= Ini.ReadString('Person','fname','');
        mtSNAME.AsString:= Ini.ReadString('Person','sname','');
        mtBDATE.AsString:= Ini.ReadString('Person','bdate','');
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
        Ini.ReadString('Person','evaid','');
        Ini.ReadString('Person','evaorg','');
}
      finally
        Ini.Free;
      end;
    end;
  finally
    mt.Last;
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
const
  CONLOG = 'ConLog.txt';
  CON = 'Provider=SQLOLEDB.1;Password=%s;Persist Security Info=True;User ID=%s;Initial Catalog=%s;Data Source=%s';
var
  ConStr, us, ps, ct, ds, dn, lg: string;
begin
  lg:= '';
  stStatus.Caption:= '';
  MSBase.Close;
  mtReg.Close;
  mtReg.Open ;

  us := Trim('mseUser');      // user
  ps := Trim('123mse123');    // password
  ct := Trim(edEvaBD.Text);   // èìÿ ÁÄ ÅÀÂÈÈÀÑ ÌÑÝ
  ds := Trim(edEvaIP.Text);   // àäðåñ MS SQL
  dn := Trim(edEvaPort.Text); // ïîðò MS SQL

  ConStr:= '';

  if (ds <> '') and (dn <> '') then
    ds:= ds + ', ' + dn;

  if ds <> '' then
  begin
    ConStr:= Format(CON,[ps,us,ct,ds]);
    MSBase.ConnectionString:= ConStr;
    try
      MSBase.Open;     // Òåñò
      qReg.Close;
      qReg.Open;
    except
      on E: Exception do
        stStatus.Caption:= 'Îøèáêà ïîäêëþ÷åíèÿ ê ÅÀÂÈÈÀÑ ( '+E.Message +' )';
    end;
      Application.ProcessMessages;
=======
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
>>>>>>> 1-merge
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
<<<<<<< HEAD
  Result:= -1;
  cur_dir:= '';
  prs_dir:= '';
  fbk:= '\block';
  if not DirectoryExists(FDIR) then
  begin
    stStatus.Caption:=  'Íåò ïîäêëþ÷åíèÿ ê õðàíèëèùó !';
    stStatus.Color:= clFuchsia;
    Application.ProcessMessages;
    exit;
  end;

  cur_dir:= FDIR+'\'+FormatDateTime('yyyy-mm-dd', date);
  if (not DirectoryExists(cur_dir)) and (not CreateDir(cur_dir)) then
  begin
    stStatus.Caption:=  'Íåò âîçìîæíîñòè íà÷àòü ðåãèñòðàöèþ íà ñåãîäíÿ !';
    stStatus.Color:= clFuchsia;
    Application.ProcessMessages;
    exit;
  end;

  i:=0;
  while FileExists(cur_dir+fbk) and (i < 100) do
  begin
    sleep(100);
    inc(i);
    Application.ProcessMessages;
  end;

  if (i = 10) and (not DeleteFile(cur_dir+fbk)) then
  begin
    stStatus.Caption:=  'Ðåãèñòðàöèÿ íà ñåãîäíÿ çàáëîêèðîâàíà !';
    stStatus.Color:= clFuchsia;
    Application.ProcessMessages;
    exit;
  end;

  if (not DirectoryExists(cur_dir+fbk)) and (not CreateDir(cur_dir+fbk)) then
  begin
    stStatus.Caption:=  'Íåò âîçìîæíîñòè çàáëîêèðîâàòü ïàïêó !';
    stStatus.Color:= clFuchsia;
    Application.ProcessMessages;
    exit;
  end;

  k:= 0;
  fnl:= TStringList.Create;
  dnl:= TStringList.Create;
=======
{$IFDEF MSWINDOWS}
  // Считываем пути из реестра
  Reg:= TRegIniFile.Create('Software');
>>>>>>> 1-merge
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
<<<<<<< HEAD
    fnl.Free;
    dnl.Free;
    inc(k);
    prs_dir:= cur_dir+'\'+Format('%.3d', [k]);  //IntToStr(f_ticket);
    if DirectoryExists(prs_dir) or CreateDir(prs_dir) then
      Result:= k
    else
    begin
      stStatus.Caption:=  'Íåò âîçìîæíîñòè ñîõðàíèòü ðåãèñòðàöèþ ïîñåòèòåëÿ !';
      stStatus.Color:= clFuchsia;
      Application.ProcessMessages;
    end;
    if DirectoryExists(cur_dir+fbk) then
      RmDir(cur_dir+fbk);
    Application.ProcessMessages;
    if DirectoryExists(cur_dir+fbk) then
    begin
      stStatus.Caption:=  'Íåò âîçìîæíîñòè ñíÿòü áëîêèðîâêó ïàïêè !';
      stStatus.Color:= clFuchsia;
      Application.ProcessMessages;
      Result:= 0;
    end;
=======
    inc(f_ticket);
    Reg.Free;
>>>>>>> 1-merge
  end;
{$ELSE}
  //FIXME: load configuration
{$ENDIF}
end;

end.

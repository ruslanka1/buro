unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, DBCtrlsEh,
  Vcl.ExtCtrls, DBGridEhGrouping, GridsEh, DBGridEh, Vcl.ComCtrls;

type
  TMain = class(TForm)
    pnlTop: TPanel;
    btnNew: TButton;
    btnPrint: TButton;
    btnSend: TButton;
    btnScan: TButton;
    pcPGS: TPageControl;
    tsPerson: TTabSheet;
    tsTurn: TTabSheet;
    grdTurn: TDBGridEh;
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
    edBDATE: TDBDateTimeEditEh;
    edDTDOC: TDBDateTimeEditEh;
    lblTicket: TLabel;
    edTicket: TEdit;
    stStatus: TStaticText;
    lblDOCSER: TLabel;
    edDOCSER: TEdit;
    lblDOCNUM: TLabel;
    edDOCNUM: TEdit;
    procedure btnNewClick(Sender: TObject);
    procedure btnScanClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    f_ticket: integer;
    app_dir: string;
    procedure scan;
    procedure print;
    procedure send;
    procedure save;
    procedure clear;
    procedure srun(nm: string);
  public
    { Public declarations }
  end;

var
  Main: TMain;

const
  FDIR = 'Z:\buro';
  FINI = 'data.ini';

implementation

uses System.IniFiles, Winapi.shellapi, JPEG;

{$R *.dfm}

procedure TMain.btnNewClick(Sender: TObject);
begin
  clear;
end;

procedure TMain.btnPrintClick(Sender: TObject);
begin
  print;
end;

procedure TMain.btnScanClick(Sender: TObject);
begin
  clear;
  scan;
end;

procedure TMain.btnSendClick(Sender: TObject);
begin
  send;
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
  edBDATE.Text:= '';
  edBPLACE.Text:= '';
  edWhDOC.Text:= '';
  edDTDOC.Text:= '';
  edCODEDOC.Text:= '';
  edMAIL.Text:= '';
  edOLD.Text:= '';
  edROOM.Text:= '';
  f_ticket:= f_ticket+1;
  edTicket.Text:=IntToStr(f_ticket);
  imgPerson.Hide;
end;

procedure TMain.FormShow(Sender: TObject);
begin
  app_dir:= ExtractFilePath(Application.ExeName);
  f_ticket:= 0;
  edTicket.Text:= IntToStr(f_ticket);
  pcPGS.ActivePage:= tsPerson;
end;

procedure TMain.print;
begin
  save;
  Application.MessageBox('Печатаю...','Внимание')
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

  c_dir:= c_dir+'\'+edTicket.Text;
  if (not DirectoryExists(c_dir)) and (not CreateDir(c_dir)) then
  begin
    s:= 'Папку для талона ' + c_dir + ' не удаётся создать...';
    Application.MessageBox(PChar(s), PChar('Внимание'));
    exit;
  end;

  c_dir:= c_dir+'\'+FINI;
  Ini:=TiniFile.Create(c_dir);
  Ini.WriteString('Person','fname',edFNAME.Text);
  Ini.WriteString('Person','lname',edLNAME.Text);
  Ini.WriteString('Person','sname',edSNAME.Text);
  Ini.WriteString('Person','sex',edSEX.Text);
  Ini.WriteDate  ('Person','bdate',edBDATE.Value);
  Ini.WriteString('Person','bplase',edBPLACE.Text);
  Ini.WriteString('Person','whdoc',edWhDOC.Text);
  Ini.WriteDate  ('Person','dtdoc',edDTDOC.Value);
  Ini.WriteString('Person','coddoc',edCODEDOC.Text);
  Ini.WriteString('Person','mail',edMAIL.Text);
  Ini.WriteString('Person','room',edROOM.Text);
  Ini.WriteString('Person','ticket',edTicket.Text);
  Ini.WriteString('Person','old',edOLD.Text);
  Ini.Free;
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
    edBDATE.Text := trim(lst.Values ['Birthdate']);
    edBPLACE.Text := trim(lst.Values ['Birthplace']);
    edWhDOC.Text := trim(lst.Values ['Authority']);
    edCODEDOC.Text := trim(lst.Values ['Authority code']);
    edDTDOC.Text := trim(lst.Values ['Issue date']);
  finally
    lst.Free;
  end;

  try
    imgPerson.Picture.LoadFromFile(app_dir+'scanned.jpg');
  finally
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
  save;
  Application.MessageBox('Отправляю...','Внимание')
end;

procedure TMain.srun(nm: string);
var
  SEInfo: TShellExecuteInfo;
  ExitCode: DWORD;
  ExecuteFile: string;
//  ExecuteFile, ParamString, StartInString: string;
begin
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
    ShowMessage('Сканирование не запустилось...')
  else
  begin
    stStatus.Caption:= 'Идёт сканирование...';
    Screen.Cursor:= crHourGlass;
    try
      repeat
        Sleep (100);
        Application.ProcessMessages;
        GetExitCodeProcess(SEInfo.hProcess, ExitCode);
      until (ExitCode <> STILL_ACTIVE)
         or  Application.Terminated
      ;
      stStatus.Caption:= 'Сканирование закончено.';
    finally
      Screen.Cursor:= crDefault;
    end;
  end
end;

end.

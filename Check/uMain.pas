unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, DBCtrlsEh,
  Vcl.ExtCtrls, Vcl.Imaging.jpeg;

type
  TMain = class(TForm)
    pnlTop: TPanel;
    btnScan: TButton;
    pnlDetails: TPanel;
    imgPerson: TImage;
    pnlPerson: TPanel;
    lblLNAME: TLabel;
    lblFNAME: TLabel;
    lblSNAME: TLabel;
    lblSEX: TLabel;
    lblBDATE: TLabel;
    lblBPLACE: TLabel;
    lblWhDOC: TLabel;
    lblDTDOC: TLabel;
    lblCODEDOC: TLabel;
    lblMAIL: TLabel;
    lblOLD: TLabel;
    edLNAME: TEdit;
    edFNAME: TEdit;
    edSNAME: TEdit;
    edSEX: TEdit;
    edBPLACE: TEdit;
    edInfo: TEdit;
    edCODEDOC: TEdit;
    edMAIL: TEdit;
    edOLD: TEdit;
    edBDATE: TDBDateTimeEditEh;
    edDTDOC: TDBDateTimeEditEh;
    lblROOM: TLabel;
    edROOM: TEdit;
    lblTicket: TLabel;
    edTicket: TEdit;
    lblDOCSER: TLabel;
    edDOCSER: TEdit;
    lblDOCNUM: TLabel;
    edDOCNUM: TEdit;
    lblGOAL: TLabel;
    edGOAL: TEdit;
    stStatus: TPanel;
    lblEvaOrg: TLabel;
    mmOrg: TMemo;
    edCode: TEdit;
    lblDoc: TLabel;
    edDoc: TEdit;
    mmWhDOC: TMemo;
    lblTime: TLabel;
    edTime: TEdit;
    tmRefresh: TTimer;
    lblInTime: TLabel;
    edInTime: TEdit;
    lblMarker1: TLabel;
    lblMarker2: TLabel;
    lblMarker3: TLabel;
    lblMarker4: TLabel;
    lblMarker5: TLabel;
    pnlMarker: TPanel;
    pnlImg: TPanel;
    procedure btnScanClick(Sender: TObject);
    procedure edCode_KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edCodeKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure tmRefreshTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    f_mpanel: integer;
    f_no_sleep_F15,
    f_no_sleep_mouse: boolean;
    AutoRun: boolean;
    procedure run;
    procedure clear;
    procedure refresh;
    function  get_barcode(s_num: string): string;
    procedure SaveDir;     // Сохраняем пути в реестр
    procedure LoadDir;     // Считываем пути из реестра
    procedure read_ini;
    procedure marker_show;
  public
    { Public declarations }
  end;

var
  Main: TMain;

const
  FDIR = 'Z:\buro';
  FINI = 'data.ini';
  FIMG = 'data.jpg';

implementation

uses System.IniFiles, System.Win.Registry, System.StrUtils, System.DateUtils;

{$R *.dfm}

procedure TMain.btnScanClick(Sender: TObject);
begin
  refresh;
end;

procedure TMain.edCode_KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    run;
end;

procedure TMain.edCodeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    run;
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveDir;
end;

procedure TMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:= false;
  if (Application.MessageBox('Завершить работу?', 'Внимание', MB_OKCANCEL) <> IDOK) then Exit;
  CanClose:= true;
  if AutoRun then
    // WinExec('cmd /c start calc.exe', 1);
    WinExec('cmd /c logoff', 1);
end;

procedure TMain.FormCreate(Sender: TObject);
var
  i: integer;
  s, ss: string;
begin
  s   := '';
  ss  := '';
  AutoRun:= False;
  for i := 1 to ParamCount do
  begin
    s := ParamStr(i);
    ss:= LowerCase(s);
    if not AutoRun and (ss = '-auto') then
      AutoRun:= True;
  end;
end;

procedure TMain.FormResize(Sender: TObject);
begin
  if imgPerson.Visible then
    marker_show;
end;

procedure TMain.FormShow(Sender: TObject);
begin
  LoadDir;
  read_ini;
  refresh;
  tmRefresh.Enabled:= True;
end;

procedure TMain.read_ini;
var
  s, ss: string;
  Ini: Tinifile;
begin
  s:= ChangeFileExt(Application.ExeName, '.ini');
  if FileExists(s) then
  begin
    Ini:= TiniFile.Create(s);
    try
      f_mpanel:= Ini.ReadInteger('Sys','mpanel',5);
      ss  := Ini.ReadString('Sys','marker','Проходная');
      lblMarker1.Caption:= ss;
      lblMarker2.Caption:= ss;
      lblMarker3.Caption:= ss;
      lblMarker4.Caption:= ss;
      lblMarker5.Caption:= ss;

      f_no_sleep_F15  := Ini.ReadInteger('Sys','no_sleep_f15',0) = 1;
      f_no_sleep_mouse:= Ini.ReadInteger('Sys','no_sleep_mouse',0) = 1;
    finally
      Ini.Free;
    end;
  end;
end;

procedure TMain.refresh;
begin
  clear;
  edCode.Text:='';
  lblMarker1.Visible:= False;
  lblMarker2.Visible:= False;
  lblMarker3.Visible:= False;
  lblMarker4.Visible:= False;
  lblMarker5.Visible:= False;
  pnlMarker.Visible := False;
  if edCode.CanFocus then
    edCode.SetFocus;
  Application.ProcessMessages;
end;

procedure TMain.marker_show;
var i: integer;
begin
  i:= imgPerson.Height div 10;
  lblMarker1.Top:= imgPerson.Top + 1*i;
  lblMarker2.Top:= imgPerson.Top + 2*i;
  lblMarker3.Top:= imgPerson.Top + 3*i;
  lblMarker4.Top:= imgPerson.Top + 4*i;
  lblMarker5.Top:= imgPerson.Top + 5*i;

  pnlMarker.Top:= imgPerson.Top;
  pnlMarker.Height:= imgPerson.Height;
  pnlMarker.Width:= (imgPerson.Width * f_mpanel) div 100;
  pnlMarker.Left:= imgPerson.Left + imgPerson.Width - pnlMarker.Width;

  lblMarker1.Visible:= True;
  lblMarker2.Visible:= True;
  lblMarker3.Visible:= True;
  lblMarker4.Visible:= True;
  lblMarker5.Visible:= True;
  pnlMarker.Visible := True;
end;

procedure TMain.run;
var
  s, c_dir, s_ticket: string;
  Ini: Tinifile;
  //dt: TDateTime;
begin
  tmRefresh.Enabled:= False;
  clear;
  if not DirectoryExists(FDIR) then
  begin
    stStatus.Caption:=  'Нет подключения к хранилищу !';
    stStatus.Color:= clFuchsia;
    Application.ProcessMessages;
    tmRefresh.Enabled:= True;
    exit;
  end;

  c_dir:= FDIR+'\'+FormatDateTime('yyyy-mm-dd', now);
  if not DirectoryExists(c_dir) then
  begin
    stStatus.Caption:=  'Сегодня нет зарегистрированных посетителей !';
    stStatus.Color:= clBtnFace;
    Application.ProcessMessages;
    sleep(3000);
    edCode.Text:= '';
    tmRefresh.Enabled:= True;
    exit;
  end;

  s:= get_barcode(edCode.Text);
  s_ticket:= RightStr(s, 3);
  c_dir:= c_dir+'\'+s_ticket;
  if (DayOfTheYear(date) <> StrToIntDef(LeftStr(s, 3), 0)) or not DirectoryExists(c_dir) then
  begin
    stStatus.Caption:=  'Посетитель с талоном ' + s + ' сегодня не зарегистрирован !';
    stStatus.Color:= clRed;
    Application.ProcessMessages;
    sleep(3000);
    edCode.Text:= '';
    tmRefresh.Enabled:= True;
    exit;
  end;

  Ini:=TiniFile.Create(c_dir+'\'+FINI);
  try
    edDOC.Text:= Ini.ReadString('Person','doc','');
    edDOCSER.Text:= Ini.ReadString('Person','docser','');
    edDOCNUM.Text:= Ini.ReadString('Person','docnum','');
    edFNAME.Text:= Ini.ReadString('Person','fname','');
    edLNAME.Text:= Ini.ReadString('Person','lname','');
    edSNAME.Text:= Ini.ReadString('Person','sname','');
    edSEX.Text:= Ini.ReadString('Person','sex','');
    edBDATE.Value:= Ini.ReadDate('Person','bdate',date);
    edBPLACE.Text:= Ini.ReadString('Person','bplase','');
    mmWhDOC.Text:= Ini.ReadString('Person','whdoc','');
    edDTDOC.Value:= Ini.ReadDate('Person','dtdoc',date);
    edCODEDOC.Text:= Ini.ReadString('Person','coddoc','');
    edMAIL.Text:= Ini.ReadString('Person','mail','');
    edROOM.Text:= Ini.ReadString('Person','room','');
    edTicket.Text:= RightStr('000'+Ini.ReadString('Person','ticket',''), 3);
    edOLD.Text:= Ini.ReadString('Person','old','');
    edGOAL.Text:= Ini.ReadString('Person','goal','');
    mmORG.Text:= Ini.ReadString('Person','evaorg','');
    edInTime.Text:= Ini.ReadString('Person','intime','');
    edTime.Text:= Ini.ReadString('Person','evatime','');
    if FileExists(c_dir+'\'+FIMG) then
    begin
      imgPerson.Picture.LoadFromFile(c_dir+'\'+FIMG);
      marker_show;
    end
    else
      imgPerson.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'\About.jpg');
    imgPerson.Show;
  finally
    Ini.Free;
    stStatus.Caption:=  'Посетитель с талоном ' + s + ' зарегистрирован!';
    stStatus.Color:= clLime;
    Application.ProcessMessages;
    sleep(3000);
    edCode.Text:= '';
    tmRefresh.Enabled:= True;
  end;
end;

procedure TMain.SaveDir;
var Reg: TRegIniFile;
begin
  // Сохраняем пути в реестр
  Reg:= TRegIniFile.Create('Software');
  try
    Reg.OpenKey(ExtractFileName(ParamStr(0)), true);
    Reg.WriteInteger(Name, 'Max',    ord(Main.WindowState = wsMaximized));
    Reg.WriteInteger(Name, 'Left',   Main.Left);
    Reg.WriteInteger(Name, 'Top',    Main.Top);
    Reg.WriteInteger(Name, 'Height', Main.Height);
    Reg.WriteInteger(Name, 'Width',  Main.Width);
//    Reg.WriteString (Name, 'Flt',    edFlt.Value);
//    Reg.WriteString (Name, 'Src',    edSrc.Value);
//    Reg.WriteString (Name, 'Cpy',    edCpy.Value);
  finally
    Reg.Free;
  end;
end;

procedure TMain.tmRefreshTimer(Sender: TObject);
begin
  refresh;
  if f_no_sleep_mouse then
    Mouse_Event(MOUSEEVENTF_MOVE,0,0,0,0);

  if f_no_sleep_F15 then
  begin
    keybd_event(VK_F15, 0, 0, 0); //Нажатие F15
    Application.ProcessMessages;
    keybd_event(VK_F15, 0, KEYEVENTF_KEYUP, 0); //Отпускание F15.
    Application.ProcessMessages;
    //keybd_event(Ord('Z'), 0, 0, 0); //Нажатие 'z'.
    //keybd_event(Ord('Z'), 0, KEYEVENTF_KEYUP, 0); //Отпускание 'z'.
  end;
end;

procedure TMain.LoadDir;
var
  Reg: TRegIniFile;
  w_max: integer;
begin
  // Считываем пути из реестра
  Reg:= TRegIniFile.Create('Software');
  try
    Reg.OpenKey(ExtractFileName(ParamStr(0)), true);
    w_max:=        Reg.ReadInteger(Name, 'Max',    0);
    if w_max = 1 then
      Main.WindowState:= wsMaximized
    else
      Main.WindowState:= wsNormal;
    Main.Left:=    Reg.ReadInteger(Name, 'Left',   Main.Left);
    Main.Top:=     Reg.ReadInteger(Name, 'Top',    Main.Top);
    Main.Height:=  Reg.ReadInteger(Name, 'Height', Main.Height);
    Main.Width:=   Reg.ReadInteger(Name, 'Width',  Main.Width);
  finally
    Reg.Free;
  end;
end;

procedure TMain.clear;
begin
  stStatus.Caption:= '';
  stStatus.Color:= clBtnFace;
  edDOC.Text:= '';
  edDOCSER.Text:= '';
  edDOCNUM.Text:= '';
  edLNAME.Text:= '';
  edFNAME.Text:= '';
  edSNAME.Text:= '';
  edSEX.Text:= '';
  edBDATE.Text:= '';
  edBPLACE.Text:= '';
  mmWhDOC.Text:= '';
  edDTDOC.Text:= '';
  edCODEDOC.Text:= '';
  edMAIL.Text:= '';
  edOLD.Text:= '';
  edROOM.Text:= '';
  edTicket.Text:='';
  edGOAL.Text:='';
  edTime.Text:='';
  edInTime.Text:='';
  mmOrg.Lines.Text:='';
  imgPerson.Hide;
  edInfo.Text:='Сегодня: ' + FormatDateTime('dd.mm.yyyy hh:nn', now) +
               ' код [' + RightStr('000'+IntToStr(DayOfTheYear(date)), 3) + ']';
end;

function TMain.get_barcode(s_num: string): string;
begin
  Result:=StringReplace(s_num, '*', '',[rfReplaceAll]);
  //IntToStr(StrToIntDef(StringReplace(s_num, '*', '',[rfReplaceAll]), 0));
end;

end.

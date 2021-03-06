unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, DBCtrlsEh,
  Vcl.ExtCtrls, DBGridEhGrouping, GridsEh, DBGridEh, Vcl.ComCtrls, Data.DB,
  MemDB, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack,
  IdSSL, IdSSLOpenSSL, IdMessage, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase,
  IdSMTP, Data.Win.ADODB;

type
  TMain = class(TForm)
    pnlTop: TPanel;
    btnNew: TButton;
    btnPrint: TButton;
    btnScan: TButton;
    pcPGS: TPageControl;
    tsPerson: TTabSheet;
    tsTurn: TTabSheet;
    imgPerson: TImage;
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
    lblDOCSER: TLabel;
    edDOCSER: TEdit;
    lblDOCNUM: TLabel;
    edDOCNUM: TEdit;
    lblGOAL: TLabel;
    edGOAL: TEdit;
    stStatus: TPanel;
    tsList: TTabSheet;
    lblEvaID: TLabel;
    edEvaID: TEdit;
    btnEvaID: TButton;
    pnlTurn: TPanel;
    grdTurn: TDBGridEh;
    sbTurn: TStatusBar;
    mt: TMemTable;
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
    grdEva: TDBGridEh;
    sbEva: TStatusBar;
    mtReg: TMemTable;
    mtRegNumReg: TIntegerField;
    mtRegNmReg: TStringField;
    mtRegBdReg: TIntegerField;
    mtRegConnect: TStringField;
    dsReg: TDataSource;
    MSBase: TADOConnection;
    qReg: TADOQuery;
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
    mtBDATE: TStringField;
    lblTime: TLabel;
    edTime: TEdit;
    mtTIME: TStringField;
    procedure btnNewClick(Sender: TObject);
    procedure btnScanClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edBDATEExit(Sender: TObject);
    procedure btnEvaIDClick(Sender: TObject);
    procedure mtAfterScroll(DataSet: TDataSet);
    procedure btnTurnRefreshClick(Sender: TObject);
    procedure btnEvaRefreshClick(Sender: TObject);
    procedure grdEvaDblClick(Sender: TObject);
    procedure qRegAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    app_dir,
    cur_dir,
    prs_dir: string;
    f_save: boolean;
    procedure scan;
    procedure save;
    procedure clear;
    procedure calc_old;
    procedure srun(nm: string);
    procedure init_ticket;
    function  set_barcode(s_num: string): string;
    procedure SaveDir;     // ��������� ���� � ������
    procedure LoadDir;     // ��������� ���� �� �������
    procedure save_eva(dt: TDateTime);
    procedure CrtXML(dt: TDateTime);
    procedure turn_refresh;// ���������� �������
    procedure turn_write(lst: TStringList);  // �������� �������
    procedure GetConLst;
    procedure GetAllFiles(Path: string; Lb: TStringList; All: boolean=False);
    procedure GetAllDir(Path: string; Lb: TStringList; All: boolean=False);
    function get_ticket: integer;
  public
    { Public declarations }
  end;

var
  Main: TMain;

const
  FDIR = 'Z:\buro';
  FINI = 'data.ini';
  FIMG = 'data.jpg';
  FEVA = 'Z:\buro\_eva';

implementation

uses System.IniFiles, Winapi.shellapi, JPEG, System.Win.Registry,
     System.DateUtils, System.Math, uTicket, System.StrUtils ;

{$R *.dfm}

procedure TMain.btnEvaRefreshClick(Sender: TObject);
begin
  GetConLst;
end;

procedure TMain.btnEvaIDClick(Sender: TObject);
begin
  Application.MessageBox('����� � �������...','��������');
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
  if edBDATE.Value <> null then
    edOLD.Text:= IntToStr(YearsBetween(now, edBDATE.Value));
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
  edGOAL.Text:= '';
  edEvaID.Text:= '';
  edTime.Text:= '';
  mmOrg.Lines.Text:= '';
  edTicket.Text:='';
  f_save:= False;
  imgPerson.Hide;
end;

procedure TMain.edBDATEExit(Sender: TObject);
begin
  calc_old;
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  clear;
  SaveDir;
end;

procedure TMain.FormShow(Sender: TObject);
var dir: string;
begin
  cur_dir:= FDIR+'\'+FormatDateTime('yyyy-mm-dd', date);
  LoadDir;
  app_dir:= ExtractFilePath(Application.ExeName);
  dir:= app_dir+'\About.jpg';
  imgPerson.Picture.LoadFromFile(dir);
  imgPerson.Show;
  clear;
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
  Ticket.lblTime.Caption := trim(edTime.Text);
  Ticket.lblRoom.Caption:= '������� ' + edROOM.Text;
  Ticket.lblNumber.Caption:= set_barcode(edTicket.Text);
  Ticket.lblBarcode.Caption:= Ticket.lblNumber.Caption;
  Ticket.fdir:= prs_dir;
  Ticket.femail:= trim(edMAIL.Text);
  Ticket.ShowModal;
  // if Ticket.ShowModal <> mrOk then
  //   �������  prs_dir ???
end;

procedure TMain.save;
var
  //c_dir: string;
  Ini: Tinifile;
  cdt: TDateTime;
begin
{
  if not DirectoryExists(FDIR) then
  begin
    stStatus.Caption:=  '��� ����������� � ��������� !';
    stStatus.Color:= clFuchsia;
    Application.ProcessMessages;
    exit;
  end;

  c_dir:= FDIR+'\'+FormatDateTime('yyyy-mm-dd', now);
  if (not DirectoryExists(c_dir)) and (not CreateDir(c_dir)) then
  begin
    stStatus.Caption:=  '��� ����������� ������ ����������� �� ������� !';
    stStatus.Color:= clFuchsia;
    Application.ProcessMessages;
    exit;
  end;

  c_dir:= c_dir+'\'+Format('%.3d', [f_ticket]);  //IntToStr(f_ticket);
  if (not DirectoryExists(c_dir)) and (not CreateDir(c_dir)) then
  begin
    stStatus.Caption:=  '��� ����������� ��������� ����������� ���������� !';
    stStatus.Color:= clFuchsia;
    Application.ProcessMessages;
    exit;
  end;
}
  edTicket.Text:=IntToStr(get_ticket);
  Application.ProcessMessages;
  cdt:= now;
  Ini:=TiniFile.Create(prs_dir+'\'+FINI);
  try
    Ini.WriteDateTime('Person','dtcreat',cdt);
    Ini.WriteString('Person','docser',edDOCSER.Text);
    Ini.WriteString('Person','docnum',edDOCNUM.Text);
    Ini.WriteString('Person','fname',edFNAME.Text);
    Ini.WriteString('Person','lname',edLNAME.Text);
    Ini.WriteString('Person','sname',edSNAME.Text);
    Ini.WriteString('Person','sex',edSEX.Text);
    if (edBDATE.Value <> null) then
      Ini.WriteDate  ('Person','bdate',edBDATE.Value);
    Ini.WriteString('Person','bplase',edBPLACE.Text);
    Ini.WriteString('Person','whdoc',edWhDOC.Text);
    if (edDTDOC.Value <> null) then
      Ini.WriteDate  ('Person','dtdoc',edDTDOC.Value);
    Ini.WriteString('Person','coddoc',edCODEDOC.Text);
    Ini.WriteString('Person','mail',edMAIL.Text);
    Ini.WriteString('Person','room',edROOM.Text);
    Ini.WriteString('Person','ticket',edTicket.Text);
    Ini.WriteString('Person','old',edOLD.Text);
    Ini.WriteString('Person','goal',edGOAL.Text);
    Ini.WriteString('Person','evaid',edEvaID.Text);
    Ini.WriteString('Person','evatime',edTime.Text);
    Ini.WriteString('Person','evaorg',mmOrg.Lines.Text);
    imgPerson.Picture.SaveToFile(prs_dir+'\'+FIMG);
    save_eva(cdt);
  finally
    Ini.Free;
    f_save:= True;
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
    Application.MessageBox('��������� ������������ �� �������...','��������');
  stStatus.Caption:= '�����...';
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
    Application.MessageBox('������ ����������� �����...','��������');
*)
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
    ShowMessage('������������ �� �����������...')
  else
  begin
    stStatus.Caption:= '��� ������������...';
    Screen.Cursor:= crHourGlass;
    Application.ProcessMessages;
    try
      repeat
        Sleep (100);
        Application.ProcessMessages;
        GetExitCodeProcess(SEInfo.hProcess, ExitCode);
      until (ExitCode <> STILL_ACTIVE)
         or  Application.Terminated
      ;
      stStatus.Caption:= '������������ ���������.';
      Application.ProcessMessages;
    finally
      Screen.Cursor:= crDefault;
    end;
  end
end;

procedure TMain.SaveDir;
var Reg: TRegIniFile;
begin
  // ��������� ���� � ������
  Reg:= TRegIniFile.Create('Software');
  try
    Reg.OpenKey(ExtractFileName(ParamStr(0)), true);
    Reg.WriteInteger(Name, 'Max',    ord(Main.WindowState = wsMaximized));
    Reg.WriteInteger(Name, 'Left',   Main.Left);
    Reg.WriteInteger(Name, 'Top',    Main.Top);
    Reg.WriteInteger(Name, 'Height', Main.Height);
    Reg.WriteInteger(Name, 'Width',  Main.Width);
    Reg.WriteString (Name, 'eva_bd', Trim(edEvaBD.Text));
    Reg.WriteString (Name, 'eva_ip', Trim(edEvaIP.Text));
    Reg.WriteString (Name, 'eva_pt', Trim(edEvaPort.Text));
  finally
    Reg.Free;
  end;
end;

procedure TMain.LoadDir;
var
  Reg: TRegIniFile;
  w_max: integer;
begin
  // ��������� ���� �� �������
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
    edEvaBD.Text:=  Reg.ReadString (Name, 'eva_bd', '');
    edEvaIP.Text:=  Reg.ReadString (Name, 'eva_ip', '');
    edEvaPort.Text:=Reg.ReadString (Name, 'eva_pt', '');
  finally
    Reg.Free;
  end;
end;

procedure TMain.mtAfterScroll(DataSet: TDataSet);
begin
  sbTurn.Panels[0].Text:= Format('%d : %d', [DataSet.RecNo, DataSet.RecordCount]);
end;

procedure TMain.qRegAfterScroll(DataSet: TDataSet);
begin
  sbEva.Panels[0].Text:= Format('%d : %d', [DataSet.RecNo, DataSet.RecordCount]);
end;

procedure TMain.save_eva(dt: TDateTime);
begin
  if not DirectoryExists(FEVA) then
  begin
    stStatus.Caption:=  '��� ����������� � ��������� �������!';
    stStatus.Color:= clFuchsia;
    Application.ProcessMessages;
    exit;
  end;

  stStatus.Caption:= '��������� � XML...';
  Application.ProcessMessages;
  try
    CrtXML(dt);
  finally
    stStatus.Caption:= '� ������� ����������!';
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
  var id: string;
  begin
    id:= StringReplace(StringReplace(GUIDToString(MyGuid),'{','',[]),'}','',[]);
    fXML.Add('  <Person>');
    try
      fXML.Add('    <DT>'+sxml(FormatDateTime('yyyy-mm-dd hh:mm:ss',dt))+'</DT>');
      fXML.Add('    <ID>'+sxml(id)+'</ID>');
      fXML.Add('    <EVAID>'+sxml(edEvaID.Text)+'</EVAID>');
      fXML.Add('    <NUM>'+sxml(edTicket.Text)+'</NUM>');
      fXML.Add('    <LNAME>'+sxml(edLNAME.Text)+'</LNAME>');
      fXML.Add('    <FNAME>'+sxml(edFNAME.Text)+'</FNAME>');
      fXML.Add('    <SNAME>'+sxml(edSNAME.Text)+'</SNAME>');
      fXML.Add('    <BDATE>'+sxml(edBDATE.Text)+'</BDATE>');
      fXML.Add('    <GOAL>'+sxml(edGOAL.Text)+'</GOAL>');
      fXML.Add('    <DOCSER>'+sxml(edDOCSER.Text)+'</DOCSER>');
      fXML.Add('    <DOCNUM>'+sxml(edDOCNUM.Text)+'</DOCNUM>');
      fXML.Add('    <SEX>'+sxml(edSEX.Text)+'</SEX>');
      fXML.Add('    <BPLACE>'+sxml(edBPLACE.Text)+'</BPLACE>');
      fXML.Add('    <WhDOC>'+sxml(edWhDOC.Text)+'</WhDOC>');
      fXML.Add('    <DTDOC>'+sxml(edDTDOC.Text)+'</DTDOC>');
      fXML.Add('    <CODEDOC>'+sxml(edCODEDOC.Text)+'</CODEDOC>');
      fXML.Add('    <MAIL>'+sxml(edROOM.Text)+'</MAIL>');
      fXML.Add('    <OLD>'+sxml(edOLD.Text)+'</OLD>');
      fXML.Add('    <ROOM>'+sxml(edGOAL.Text)+'</ROOM>');
      fXML.Add('    <TIME>'+sxml(edTime.Text)+'</TIME>');
      fXML.Add('    <ORG>'+sxml(mmOrg.Lines.Text)+'</ORG>');
    finally
      fXML.Add('  </Person>');
    end;
  end;
begin
  if (CreateGUID(MyGUID) = 0) then
  begin
    s:= FormatDateTime('yyyy_mm_dd-', date)+edTicket.Text;
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
    edTime.Text:= FormatDateTime('hh:nn', qRegDT_MSE.AsDateTime);
    mmOrg.Lines.Text:= qRegORG.AsString;
    edROOM.Text:=  qRegROOM.AsString;
    pcPGS.ActivePage:= tsPerson;
  end;
end;

procedure TMain.turn_refresh;
var
  lst: TStringList;
begin
  lst:= TStringList.Create;
  try
//    prs_dir:= '2017-12-15';
    GetAllFiles(cur_dir, lst, True);
    turn_write(lst);
  finally
    lst.Free;
  end;
end;

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
begin
  mt.DisableControls;
  try
    mt.Close;
    mt.Open;
    for i := 0 to lst.Count - 1 do
    begin
      Ini:=TiniFile.Create(lst[i]);
      try
        mt.Append;
        mtNUM.AsString:=   set_code(Ini.ReadString('Person','ticket',''));
        mtTIME.AsString:=  Ini.ReadString('Person','evatime','');
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

procedure TMain.GetAllDir(Path: string; Lb: TStringList; All: boolean=False);
var
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
        Lb.Add(Path + '\' + sRec.Name);
        if All then
          GetAllDir(Path + '\' + sRec.Name, Lb, All);
      end
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
  ct := Trim(edEvaBD.Text);   // ��� �� ������� ���
  ds := Trim(edEvaIP.Text);   // ����� MS SQL
  dn := Trim(edEvaPort.Text); // ���� MS SQL

  ConStr:= '';

  if (ds <> '') and (dn <> '') then
    ds:= ds + ', ' + dn;

  if ds <> '' then
  begin
    ConStr:= Format(CON,[ps,us,ct,ds]);
    MSBase.ConnectionString:= ConStr;
    try
      MSBase.Open;     // ����
      qReg.Close;
      qReg.Open;
    except
      on E: Exception do
        stStatus.Caption:= '������ ����������� � ������� ( '+E.Message +' )';
    end;
      Application.ProcessMessages;
  end;
end;

function TMain.get_ticket: integer;
var
  i, j, k: integer;
  fnl, dnl: TStringList;
  fbk: string;
begin
  Result:= -1;
  cur_dir:= '';
  prs_dir:= '';
  fbk:= '\block';
  if not DirectoryExists(FDIR) then
  begin
    stStatus.Caption:=  '��� ����������� � ��������� !';
    stStatus.Color:= clFuchsia;
    Application.ProcessMessages;
    exit;
  end;

  cur_dir:= FDIR+'\'+FormatDateTime('yyyy-mm-dd', date);
  if (not DirectoryExists(cur_dir)) and (not CreateDir(cur_dir)) then
  begin
    stStatus.Caption:=  '��� ����������� ������ ����������� �� ������� !';
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
    stStatus.Caption:=  '����������� �� ������� ������������� !';
    stStatus.Color:= clFuchsia;
    Application.ProcessMessages;
    exit;
  end;

  if (not DirectoryExists(cur_dir+fbk)) and (not CreateDir(cur_dir+fbk)) then
  begin
    stStatus.Caption:=  '��� ����������� ������������� ����� !';
    stStatus.Color:= clFuchsia;
    Application.ProcessMessages;
    exit;
  end;

  k:= 0;
  fnl:= TStringList.Create;
  dnl:= TStringList.Create;
  try
    GetAllDir(cur_dir, fnl, true);
    for i := 0 to fnl.Count - 1 do
    begin
      dnl.Text:= StringReplace(fnl[i],'\',#13#10,[rfReplaceAll]);
      j:= StrToIntDef(dnl[dnl.Count-1], 0);
      if k < j then
        k:= j;
    end;
  finally
    fnl.Free;
    dnl.Free;
    inc(k);
    prs_dir:= cur_dir+'\'+Format('%.3d', [k]);
    if DirectoryExists(prs_dir) or CreateDir(prs_dir) then
      Result:= k
    else
    begin
      stStatus.Caption:=  '��� ����������� ��������� ����������� ���������� !';
      stStatus.Color:= clFuchsia;
      Application.ProcessMessages;
    end;
    if DirectoryExists(cur_dir+fbk) then
      RmDir(cur_dir+fbk);
    Application.ProcessMessages;
    if DirectoryExists(cur_dir+fbk) then
    begin
      stStatus.Caption:=  '��� ����������� ����� ���������� ����� !';
      stStatus.Color:= clFuchsia;
      Application.ProcessMessages;
      Result:= 0;
    end;
  end;
end;

end.

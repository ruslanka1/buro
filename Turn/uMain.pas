unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, Vcl.StdCtrls,
  DBCtrlsEh, Vcl.DBCtrls, Vcl.ComCtrls, GridsEh, DBGridEh, Vcl.Mask, CommVCL,
  Vcl.ExtCtrls, Data.DB, MemDB;

type
  TMain = class(TForm)
    mtTurn: TMemTable;
    mtTurnDTCREAT: TDateTimeField;
    mtTurnLNAME: TStringField;
    mtTurnFNAME: TStringField;
    mtTurnSNAME: TStringField;
    mtTurnROOM: TStringField;
    mtTurnDT: TDateTimeField;
    mtTurnORG: TStringField;
    mtTurnGOAL: TStringField;
    mtTurnTEL: TStringField;
    mtTurnMAIL: TStringField;
    mtTurnSRC: TStringField;
    dsTurn: TDataSource;
    tmNoSleep: TTimer;
    pcPGS: TExPageControl;
    tsList: TTabSheet;
    pnlTurn: TPanel;
    btnTurnRefresh: TButton;
    edTurnDT: TDBDateTimeEditEh;
    grdTurn: TDBGridEh;
    sbTurn: TStatusBar;
    tsPerson: TTabSheet;
    pnlPerson: TPanel;
    lblLNAME: TLabel;
    lblFNAME: TLabel;
    lblSNAME: TLabel;
    lblMAIL: TLabel;
    lblROOM: TLabel;
    lblGOAL: TLabel;
    lblEvaOrg: TLabel;
    lblTime: TLabel;
    lblDate: TLabel;
    lblTel: TLabel;
    cbGOAL: TDBEditEh;
    cbROOM: TDBEditEh;
    edDate: TDBDateTimeEditEh;
    mmOrg: TDBMemo;
    edFNAME: TDBEditEh;
    edSNAME: TDBEditEh;
    edLNAME: TDBEditEh;
    edMAIL: TDBEditEh;
    edTel: TDBEditEh;
    gbPerson: TGroupBox;
    gbDoc: TGroupBox;
    lblDoc: TLabel;
    cbDoc: TDBEditEh;
    lblDOCSER: TLabel;
    edDOCSER: TDBEditEh;
    lblDOCNUM: TLabel;
    edDOCNUM: TDBEditEh;
    lblSEX: TLabel;
    edSEX: TDBEditEh;
    lblBDATE: TLabel;
    edBDATE: TDBDateTimeEditEh;
    lblBPLACE: TLabel;
    edBPLACE: TDBEditEh;
    lblWhDOC: TLabel;
    mmWhDOC: TDBMemo;
    lblDTDOC: TLabel;
    edDTDOC: TDBDateTimeEditEh;
    lblCODEDOC: TLabel;
    edCODEDOC: TDBEditEh;
    lblOld: TLabel;
    edOld: TDBEditEh;
    pnlTop: TPanel;
    btnSave: TButton;
    stStatus: TPanel;
    btnCardLst: TButton;
    mtTurnTIME: TStringField;
    edIME: TDBEditEh;
    mtTurnGOALID: TStringField;
    mtTurnOLD: TStringField;
    mtTurnDOC: TStringField;
    mtTurnDOCSER: TStringField;
    mtTurnDOCNUM: TStringField;
    mtTurnSEX: TStringField;
    mtTurnBDATE: TDateTimeField;
    mtTurnBPLACE: TStringField;
    mtTurnWHDOC: TStringField;
    mtTurnDTDOC: TDateTimeField;
    mtTurnCODDOC: TStringField;
    mtTurnTICKET: TStringField;
    mtTurnINROOM: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnTurnRefreshClick(Sender: TObject);
    procedure grdTurnDblClick(Sender: TObject);
    procedure pcPGSChange(Sender: TObject);
    procedure btnCardLstClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure tsPersonShow(Sender: TObject);
    procedure mtTurnNewRecord(DataSet: TDataSet);
    procedure mtTurnAfterScroll(DataSet: TDataSet);
    procedure tmNoSleepTimer(Sender: TObject);
    procedure edTurnDTCloseUp(Sender: TObject; Accept: Boolean);
    procedure edTurnDTKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    f_room,
    app_dir,
    cur_dir: String;
    f_no_sleep_F15,
    f_no_sleep_mouse: boolean;
    f_lst_key: TStringList; // список целей для отображения
    procedure SaveDir;      // Сохраняем пути в реестр
    procedure LoadDir;      // Считываем пути из реестра
    procedure SetPage(Page: TTabSheet);
    procedure read_ini;
    procedure prev_refresh; // Перечитать предв. запись
    procedure prev_write(lst: TStringList; lst_clear: Boolean = True);  // Записать предв. запись
    procedure GetAllFiles(Path, Mask: string; Lb: TStringList);
    function pers_save: boolean;
    function RenameIniFile(orig: String): string;   // Изменить название файла
  public
    { Public declarations }
  end;

var
  Main: TMain;

const
  FDIR = 'T:';
  FINI = 'prs';

implementation

uses System.IniFiles, Winapi.shellapi, System.Win.Registry,
     System.DateUtils, System.Math, System.StrUtils, HmDsFtEh ;

{$R *.dfm}

procedure TMain.btnCardLstClick(Sender: TObject);
begin
  if pcPGS.ActivePage = tsList then
    SetPage(tsPerson)
  else if pcPGS.ActivePage = tsPerson then
    SetPage(tsList);
end;

procedure TMain.btnTurnRefreshClick(Sender: TObject);
begin
  prev_refresh;
end;

procedure TMain.btnSaveClick(Sender: TObject);
begin
  pers_save;
end;

procedure TMain.edTurnDTCloseUp(Sender: TObject; Accept: Boolean);
begin
  prev_refresh;
end;

procedure TMain.edTurnDTKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    prev_refresh;
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveDir;
end;

procedure TMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:= false;
  if Application.MessageBox('Завершить работу?', 'Внимание', MB_OKCANCEL) <> IDOK then Exit;
  CanClose:= true;
end;

procedure TMain.FormCreate(Sender: TObject);
begin
  mtTurn.Close;
  mtTurn.Open;
end;

procedure TMain.FormShow(Sender: TObject);
begin
  edTurnDT.Value:= date;
  cur_dir:= FDIR+'\'+FormatDateTime('yyyy-mm-dd', date);
  LoadDir;
  app_dir:= ExtractFilePath(Application.ExeName);
  read_ini;
  prev_refresh;

  if f_no_sleep_mouse or f_no_sleep_F15 then
    tmNoSleep.Enabled:= True;

  tsList.TabVisible:= False;
  tsPerson.TabVisible:= False;
  SetPage(tsList);
end;

procedure TMain.GetAllFiles(Path, Mask: string; Lb: TStringList);
var
  sRec: TSearchRec;
  isFound: boolean;
begin
  if Mask = '' then
    isFound := FindFirst( Path + '\*.*', faAnyFile, sRec ) = 0
  else
    isFound := FindFirst( Path + '\' + Mask, faAnyFile, sRec ) = 0;

  while isFound do
  begin
    if (sRec.Name <> '.') and (sRec.Name <> '..') and
      ((sRec.Attr and faDirectory) <> faDirectory) and (sRec.Size > 0) then
      Lb.Add(Path + '\' + sRec.Name);

    isFound:= FindNext(sRec) = 0;
  end;
  FindClose(sRec);
end;

procedure TMain.grdTurnDblClick(Sender: TObject);
begin
  SetPage(tsPerson);
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
    Main.Left:=     Reg.ReadInteger(Name, 'Left',   Main.Left);
    Main.Top:=      Reg.ReadInteger(Name, 'Top',    Main.Top);
    Main.Height:=   Reg.ReadInteger(Name, 'Height', Main.Height);
    Main.Width:=    Reg.ReadInteger(Name, 'Width',  Main.Width);
  finally
    Reg.Free;
  end;
end;

procedure TMain.mtTurnAfterScroll(DataSet: TDataSet);
begin
  sbTurn.Panels[0].Text:= Format('%d : %d', [DataSet.RecNo, DataSet.RecordCount]);
  if DataSet.RecordCount > 0 then
    sbTurn.Panels[1].Text:= Format('Проход: %s', [mtTurnDTCREAT.AsString])
  else sbTurn.Panels[1].Text:= '';
end;

procedure TMain.mtTurnNewRecord(DataSet: TDataSet);
begin
  mtTurnDT.AsDateTime:= edTurnDT.Value;
end;

procedure TMain.pcPGSChange(Sender: TObject);
begin
  if pcPGS.ActivePage = tsList then
  begin
    btnCardLst.Caption:= 'Редактор';
    Application.ProcessMessages;
  end;

  if pcPGS.ActivePage = tsPerson then
  begin
    btnCardLst.Caption:= 'Список';
    Application.ProcessMessages;
  end;
end;

function TMain.pers_save: boolean;
var
  c_fl: string;
begin
  Result:= False;
  if not DirectoryExists(FDIR) then
  begin
    stStatus.Caption:=  'Нет подключения к хранилищу !';
    stStatus.Color:= clFuchsia;
    Application.ProcessMessages;
    exit;
  end;

  c_fl:= mtTurnSRC.AsString;
  if not FileExists(c_fl) then
  begin
    stStatus.Caption:=  'Этого человека уже нет в очереди...';
    stStatus.Color:= clFuchsia;
    Application.ProcessMessages;
    exit;
  end;

  if RenameIniFile(c_fl) = '' then
  begin
    stStatus.Caption:=  'Нет возможности сделать отметку приема...';
    stStatus.Color:= clFuchsia;
    Application.ProcessMessages;
    exit;
  end;

  Result:= True;
  prev_refresh;
  if pcPGS.ActivePage <> tsList then
    SetPage(tsList);
end;

procedure TMain.prev_refresh;
var
  i: integer;
  dir, mask: string;
  lst: TStringList;
begin
  for i := 0 to grdTurn.Columns.Count - 1 do
    if grdTurn.Columns[i].FieldName = 'TICKET' then
      grdTurn.Columns[i].Title.SortMarker:= smUpEh
    else
      grdTurn.Columns[i].Title.SortMarker:= smNoneEh;

  lst:= TStringList.Create;
  try
    dir:= FDIR+'\'+FormatDateTime('yyyy-mm-dd', edTurnDT.Value);

    if (f_lst_key.Count=0) or ((f_lst_key.Count=1) and ((f_lst_key[0]='ALL'))) then
    begin
      mask:= FINI+'~*.ini';
      GetAllFiles(dir, mask, lst);
      prev_write(lst);
    end
    else
    for i := 0 to f_lst_key.Count - 1 do
    begin
      mask:= FINI+'~'+f_lst_key[i]+'*.ini';
      GetAllFiles(dir, mask, lst);
      prev_write(lst, i=0);
    end;
  finally
    btnSave.Enabled   := mtTurn.RecordCount > 0;
    btnCardLst.Enabled:= mtTurn.RecordCount > 0;
    lst.Free;
  end;
end;

procedure TMain.prev_write(lst: TStringList; lst_clear: Boolean = True);
var
  s: string;
  i: integer;
  Ini: Tinifile;
  f_nm :TStringList;
begin
  mtTurn.DisableControls;
  try
    mtTurn.Active:= True;
    if lst_clear then
    begin
      mtTurn.Close;
      mtTurn.Open;
    end;
    for i := 0 to lst.Count - 1 do
    begin
      f_nm:= TStringList.Create;
      s:= ExtractFileName(lst[i]);
      f_nm.Text:= StringReplace(StringReplace(s, '~', #13#10, [rfReplaceAll]), '.', #13#10, [rfReplaceAll]);
      Ini:=  TiniFile.Create(lst[i]);
      try
        mtTurn.Append;
        if f_nm.Count > 4 then
          mtTurnINROOM.AsString:=  f_nm[f_nm.Count-2];

        // Посетитель
        mtTurnDTCREAT.AsDateTime:= Ini.ReadDateTime('Person','dtcreat',0);
        mtTurnLNAME.AsString:=   Ini.ReadString('Person','lname','');
        mtTurnFNAME.AsString:=   Ini.ReadString('Person','fname','');
        mtTurnSNAME.AsString:=   Ini.ReadString('Person','sname','');
        mtTurnROOM.AsString:=    Ini.ReadString('Person','room','');
        mtTurnDT.AsDateTime:=    edTurnDT.Value;
        mtTurnTIME.AsString:=    Ini.ReadString('Person','turn_time','');
        mtTurnORG.AsString:=     Ini.ReadString('Person','turn_org','');
        mtTurnGOAL.AsString:=    Ini.ReadString('Person','goal','');
        mtTurnGOALID.AsString:=  Ini.ReadString('Person','goal_id','');
        mtTurnTEL.AsString:=     Ini.ReadString('Person','tel','');
        mtTurnMAIL.AsString:=    Ini.ReadString('Person','mail','');
        mtTurnOLD.AsString:=     Ini.ReadString('Person','old','');

        // Документ
        mtTurnDOC.AsString:=     Ini.ReadString('Person','doc','');
        mtTurnDOCSER.AsString:=  Ini.ReadString('Person','docser','');
        mtTurnDOCNUM.AsString:=  Ini.ReadString('Person','docnum','');
        mtTurnSEX.AsString:=     Ini.ReadString('Person','sex','');
        mtTurnBDATE.AsDateTime:= Ini.ReadDate('Person','bdate',date);
        mtTurnBPLACE.AsString:=  Ini.ReadString('Person','bplase','');
        mtTurnWHDOC.AsString:=   Ini.ReadString('Person','whdoc','');
        mtTurnDTDOC.AsDateTime:= Ini.ReadDate('Person','dtdoc',date);
        mtTurnCODDOC.AsString:=  Ini.ReadString('Person','coddoc','');
        mtTurnTICKET.AsString:=  RightStr('000'+Ini.ReadString('Person','ticket',''), 3);

        mtTurnSRC.AsString:=    lst[i];
        mtTurn.Post;
      finally
        f_nm.Free;
        Ini.Free;
      end;
    end;
  finally
    grdTurn.DefaultApplySorting;
    mtTurn.First;
    mtTurn.EnableControls;
  end;
end;

procedure TMain.read_ini;
var
  s: string;
  Ini: Tinifile;
begin
  s:= ChangeFileExt(Application.ExeName, '.ini');
  if FileExists(s) then
  begin
    Ini:= TiniFile.Create(s);
    try
      f_lst_key:= TStringList.Create;
      f_lst_key.Text:= AnsiUpperCase(
        StringReplace(trim(Ini.ReadString('Goal','key','')), ',', #13#10, [rfReplaceAll])
        );
{
      grdTurn.Columns[7].Visible:= (f_lst_key.Count=0) or
        ((f_lst_key.Count=1) and (f_lst_key[0]='ALL'));
}

      f_room          := Ini.ReadString ('Sys','room','');
      f_no_sleep_F15  := Ini.ReadInteger('Sys','no_sleep_f15',0) = 1;
      f_no_sleep_mouse:= Ini.ReadInteger('Sys','no_sleep_mouse',0) = 1;
    finally
      Ini.Free;
    end;
  end;
end;

function TMain.RenameIniFile(orig: String): string;
var
  f: File;
  ext: string;
begin
  Result:= '';
  try
    if FileExists(orig) then
    begin
      AssignFile(f, orig);
      ext:= ExtractFileExt(orig);
      Result:= LeftStr(orig, length(orig) - length(ext)) + '~' + f_room + ext;
      Rename(f,Result);
    end;
  except
    Result:= '';
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
  finally
    Reg.Free;
  end;
end;

procedure TMain.SetPage(Page: TTabSheet);
begin
  if not assigned(Page) then exit;
  with Page.PageControl do
    if ActivePage <> Page then
    try
      ActivePage:= Page;
      if Assigned(OnChange) then OnChange(Page.PageControl);
    except
       Application.HandleException(Application);
    end;
end;

procedure TMain.tmNoSleepTimer(Sender: TObject);
begin
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

procedure TMain.tsPersonShow(Sender: TObject);
begin
  if edLNAME.CanFocus then
    edLNAME.SetFocus;
end;

end.

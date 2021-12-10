unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, DBCtrlsEh,
  Vcl.ExtCtrls, DBGridEhGrouping, GridsEh, DBGridEh, Vcl.ComCtrls, Data.DB,
  MemDB, Vcl.DBCtrls, CommVCL, htPages;

type
  TMain = class(TForm)
    pnlTop: TPanel;
    btnNew: TButton;
    btnSave: TButton;
    btnDel: TButton;
    pcPGS: TExPageControl; // THTPageControl
    tsPerson: TTabSheet;
    tsList: TTabSheet;
    pnlPerson: TPanel;
    lblLNAME: TLabel;
    lblFNAME: TLabel;
    lblSNAME: TLabel;
    lblMAIL: TLabel;
    lblROOM: TLabel;
    lblGOAL: TLabel;
    stStatus: TPanel;
    pnlPrev: TPanel;
    grdPrev: TDBGridEh;
    sbPrev: TStatusBar;
    mtPrev: TMemTable;
    mtPrevROOM: TStringField;
    mtPrevLNAME: TStringField;
    mtPrevFNAME: TStringField;
    mtPrevSNAME: TStringField;
    mtPrevGOAL: TStringField;
    dsPrev: TDataSource;
    btnPrevRefresh: TButton;
    lblEvaOrg: TLabel;
    lblTime: TLabel;
    cbGOAL: TDBComboBoxEh;
    edPrevDT: TDBDateTimeEditEh;
    tmNoSleep: TTimer;
    cbROOM: TDBComboBoxEh;
    edTime: TDBDateTimeEditEh;
    lblDate: TLabel;
    edDate: TDBDateTimeEditEh;
    lblTel: TLabel;
    edMAIL: TDBEditEh;
    edTel: TDBEditEh;
    mmOrg: TDBMemo;
    edLNAME: TDBEditEh;
    edFNAME: TDBEditEh;
    edSNAME: TDBEditEh;
    mtPrevORG: TStringField;
    mtPrevTEL: TStringField;
    mtPrevMAIL: TStringField;
    btnCardLst: TButton;
    mtPrevDT: TDateTimeField;
    mtPrevSRC: TStringField;
    lblAuto: TLabel;
    edAuto: TDBEditEh;
    mtPrevAUTO: TStringField;
    mtPrevDTCREAT: TDateTimeField;
    procedure btnNewClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mtPrevAfterScroll(DataSet: TDataSet);
    procedure btnPrevRefreshClick(Sender: TObject);
    procedure tsPersonShow(Sender: TObject);
    procedure edUpKeyPress(Sender: TObject; var Key: Char);
    procedure edLwKeyPress(Sender: TObject; var Key: Char);
    procedure edPrevDTCloseUp(Sender: TObject; Accept: Boolean);
    procedure edPrevDTKeyPress(Sender: TObject; var Key: Char);
    procedure tmNoSleepTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbROOMExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure mtPrevNewRecord(DataSet: TDataSet);
    procedure btnDelClick(Sender: TObject);
    procedure grdPrevDblClick(Sender: TObject);
    procedure btnCardLstClick(Sender: TObject);
    procedure dsPrevStateChange(Sender: TObject);
    procedure pcPGSChange(Sender: TObject);
  private
    { Private declarations }
    f_user,
    app_dir,
    cur_dir: String;
    f_no_sleep_F15,
    f_no_sleep_mouse: boolean;
    f_lst_room,
    f_lst_org,
    f_lst_goal: TStringList;
    function pers_save(dt: TDateTime): boolean;
    procedure SaveDir;     // Сохраняем пути в реестр
    procedure LoadDir;     // Считываем пути из реестра
    procedure prev_refresh;// Перечитать предв. запись
    procedure prev_write(lst: TStringList);  // Записать предв. запись
    procedure GetAllFiles(Path: string; Lb: TStringList; All: boolean=False);
    procedure GetAllDir(Path: string; Lb: TStringList; All: boolean=False);
    procedure read_ini;
    procedure SetPage(Page: TTabSheet);
    function GetUserFromWindows: string;
  public
    { Public declarations }
  end;

var
  Main: TMain;

const
  FDIR = 'Q:\prev';
  FINI = 'prv';

implementation

uses System.IniFiles, Winapi.shellapi, JPEG, System.Win.Registry,
     System.DateUtils, System.Math, System.StrUtils, HmDsFtEh ;

{$R *.dfm}

procedure TMain.btnCardLstClick(Sender: TObject);
begin
  if pcPGS.ActivePage = tsList then
    SetPage(tsPerson)
  else if pcPGS.ActivePage = tsPerson then
    SetPage(tsList);
end;

procedure TMain.btnDelClick(Sender: TObject);
begin
  try
    if (mtPrev.RecordCount > 0) and
       (Application.MessageBox('Удалить запись?', 'Внимание', MB_OKCANCEL) = IDOK) and
       DeleteFile(mtPrevSRC.AsString) then
      mtPrev.Delete;
  except
    on e:Exception do
    begin
      stStatus.Caption:=  'Не удалось удалить! ' + e.Message;
      stStatus.Color:= clFuchsia;
      Application.ProcessMessages;
    end;
  end;
end;

procedure TMain.btnNewClick(Sender: TObject);
begin
  if not (mtPrev.State in [dsInsert]) then
  begin
    mtPrev.Append;
    SetPage(tsPerson);
  end;
  if edLNAME.CanFocus then
    edLNAME.SetFocus;
end;

procedure TMain.btnSaveClick(Sender: TObject);
begin
  if mtPrev.State in [dsEdit] then
    mtPrev.Post
  else if mtPrev.State in [dsInsert] then
    mtPrev.Next;
end;

procedure TMain.btnPrevRefreshClick(Sender: TObject);
begin
  prev_refresh;
end;

procedure TMain.dsPrevStateChange(Sender: TObject);
var need_save: boolean;
begin
  need_save:= btnSave.Enabled;
  btnSave.Enabled:= mtPrev.State in [dsEdit, dsInsert];
  if need_save and not btnSave.Enabled and (edDate.Value <> null) then
    if not pers_save(edDate.Value) then
      mtPrev.Edit;
end;

procedure TMain.edLwKeyPress(Sender: TObject; var Key: Char);
begin
  Key:= Char(CharLower(PWideChar(Key)));
end;

procedure TMain.edUpKeyPress(Sender: TObject; var Key: Char);
begin
  Key:= Char(CharUpper(PWideChar(Key)));
end;

procedure TMain.cbROOMExit(Sender: TObject);
var
  i, j: integer;
  room: string;
begin
  room:= trim(cbROOM.Text);
  if f_lst_org.Count > 0 then
    for i := 0 to f_lst_org.Count - 1 do
      if f_lst_org.Names[i] = room then
      begin
        mtPrevORG.AsString:= f_lst_org.Values[f_lst_org.Names[i]];
//        mmOrg.Text:= f_lst_org.Values[f_lst_org.Names[i]];
        break;
      end;

  if (f_lst_room.Count > 0) and (f_lst_goal.Count > 0) then
    for i := 0 to f_lst_room.Count - 1 do
      if f_lst_room.Names[i] = room then
      begin
        for j := 0 to f_lst_goal.Count - 1 do
          if f_lst_goal.Values[f_lst_goal.Names[j]] = f_lst_room.Values[f_lst_room.Names[i]] then
          begin
            cbGOAL.ItemIndex:= j;
            break;
          end;
        break;
      end;
end;

procedure TMain.edPrevDTCloseUp(Sender: TObject; Accept: Boolean);
begin
  prev_refresh;
end;

procedure TMain.edPrevDTKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    prev_refresh;
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveDir;
  f_lst_goal.Free;
  f_lst_room.Free;
  f_lst_org.Free;
end;

procedure TMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:= false;
  if Application.MessageBox('Завершить работу?', 'Внимание', MB_OKCANCEL) <> IDOK then Exit;
  CanClose:= true;
end;

procedure TMain.FormCreate(Sender: TObject);
begin
  f_lst_goal:= TStringList.Create;
  f_lst_room:= TStringList.Create;
  f_lst_org:=  TStringList.Create;
  mtPrev.Close;
  mtPrev.Open;
end;

procedure TMain.FormShow(Sender: TObject);
begin
  f_user:= GetUserFromWindows;
  edPrevDT.Value:= date;
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

procedure TMain.mtPrevAfterScroll(DataSet: TDataSet);
begin
  sbPrev.Panels[0].Text:= Format('%d : %d', [DataSet.RecNo, DataSet.RecordCount]);
  if DataSet.RecordCount > 0 then
    sbPrev.Panels[1].Text:= Format('Создано: %s', [mtPrevDTCREAT.AsString])
  else sbPrev.Panels[1].Text:= '';
end;

procedure TMain.mtPrevNewRecord(DataSet: TDataSet);
begin
  mtPrevDT.AsDateTime:= edPrevDT.Value;
end;

procedure TMain.read_ini;
var
  i: integer;
  s: string;
  Ini: Tinifile;
begin
  s:= ChangeFileExt(Application.ExeName, '.ini');
  if FileExists(s) then
  begin
    Ini:= TiniFile.Create(s);
    try
      f_lst_goal.Clear;
      Ini.ReadSectionValues('Goal', f_lst_goal);
      cbGOAL.Items.Clear;
      for i := 0 to f_lst_goal.Count - 1 do
        cbGOAL.Items.Add(f_lst_goal.Names[i]);

      f_lst_room.Clear;
      Ini.ReadSectionValues('Room_Goal', f_lst_room);

      f_lst_org.Clear;
      Ini.ReadSectionValues('Room_Org',  f_lst_org);
      cbROOM.Items.Clear;
      for i := 0 to f_lst_org.Count - 1 do
        cbROOM.Items.Add(f_lst_org.Names[i]);

      f_no_sleep_F15  := Ini.ReadInteger('Sys','no_sleep_f15',0) = 1;
      f_no_sleep_mouse:= Ini.ReadInteger('Sys','no_sleep_mouse',0) = 1;
    finally
      Ini.Free;
    end;
  end;
end;

procedure TMain.tsPersonShow(Sender: TObject);
begin
  if edLNAME.CanFocus then
    edLNAME.SetFocus;
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

function TMain.pers_save(dt: TDateTime): boolean;
var
  c_dir, f_nm: string;
  MyGUID : TGUID;
  Ini: Tinifile;
  is_old: boolean;
  rn: integer;
begin
  Result:= False;
  rn:= 1;
  if not DirectoryExists(FDIR) and (not CreateDir(FDIR)) then
  begin
    stStatus.Caption:=  'Нет подключения к хранилищу !';
    stStatus.Color:= clFuchsia;
    Application.ProcessMessages;
    exit;
  end;

  c_dir:= FDIR+'\'+FormatDateTime('yyyy-mm-dd', dt)+'\';
  if (not DirectoryExists(c_dir)) and (not CreateDir(c_dir)) then
  begin
    stStatus.Caption:=  'Нет возможности сделать запись на: ' +
                         FormatDateTime('dd.mm.yyyy', dt);
    stStatus.Color:= clFuchsia;
    Application.ProcessMessages;
    exit;
  end;

  is_old:= (mtPrevSRC.AsString <> '') and (ExtractFilePath(mtPrevSRC.AsString) = c_dir);
  if is_old then
  begin
    rn:= mtPrev.RecNo;
    f_nm:= mtPrevSRC.AsString;
    if FileExists(f_nm) and not DeleteFile(f_nm) then
    begin
      stStatus.Caption:=  'Нет возможности удалить старый файл';
      stStatus.Color:= clFuchsia;
      Application.ProcessMessages;
      exit;
    end;
  end
  else
  begin
    if (CreateGUID(MyGUID) <> 0) then
    begin
      stStatus.Caption:=  'Нет возможности создать GUID';
      stStatus.Color:= clFuchsia;
      Application.ProcessMessages;
      exit;
    end;

    f_nm:= c_dir+Format('%s~%s.%s', [f_user,
      StringReplace(StringReplace(GUIDToString(MyGuid),'{','',[]),'}','',[]),
      FINI]);
  end;

  Ini:=TiniFile.Create(f_nm);
  try
    Ini.WriteDateTime('Person','dtcreat',now);
    Ini.WriteString('Person','lname',edLNAME.Text);
    Ini.WriteString('Person','fname',edFNAME.Text);
    Ini.WriteString('Person','sname',edSNAME.Text);
    Ini.WriteString('Person','room',cbROOM.Text);
    if (edDATE.Value <> null) then
      Ini.WriteDateTime('Person','dt',edDATE.Value);
    Ini.WriteString('Person','org',mmOrg.Lines.Text);
    Ini.WriteString('Person','goal',cbGOAL.Text);
    Ini.WriteString('Person','tel',edTel.Text);
    Ini.WriteString('Person','mail',edMAIL.Text);
    Ini.WriteString('Person','auto',edAuto.Text);
    Ini.Free;
    Result:= True;
  except
    on e:Exception do
    begin
      stStatus.Caption:=  'Не удалось сохранить регистрацию посетителя !' + e.Message;
      stStatus.Color:= clFuchsia;
      Application.ProcessMessages;
      Ini.Free;
    end;
  end;
  if edPrevDT.Value <> dt then
    edPrevDT.Value:= dt;
  SetPage(tsList);
  if not is_old then
  begin
    prev_refresh;
    mtPrev.Last;
  end
  else
    mtPrev.RecNo:= rn;
end;

procedure TMain.prev_refresh;
var
  dir: string;
  lst: TStringList;
begin
  lst:= TStringList.Create;
  try
    dir:= FDIR+'\'+FormatDateTime('yyyy-mm-dd', edPrevDT.Value);
    GetAllFiles(dir, lst);
    prev_write(lst);
  finally
    lst.Free;
  end;
end;

procedure TMain.prev_write(lst: TStringList);
var
  i: integer;
  Ini: Tinifile;
begin
  mtPrev.DisableControls;
  try
    mtPrev.Close;
    mtPrev.Open;
    for i := 0 to lst.Count - 1 do
    begin
      Ini:=TiniFile.Create(lst[i]);
      try
        mtPrev.Append;
        mtPrevDTCREAT.AsDateTime:= Ini.ReadDateTime('Person','dtcreat',0);
        mtPrevLNAME.AsString:=  Ini.ReadString('Person','lname','');
        mtPrevFNAME.AsString:=  Ini.ReadString('Person','fname','');
        mtPrevSNAME.AsString:=  Ini.ReadString('Person','sname','');
        mtPrevROOM.AsString:=   Ini.ReadString('Person','room','');
        mtPrevDT.AsDateTime:=   Ini.ReadDateTime('Person','dt',0);
        mtPrevORG.AsString:=    Ini.ReadString('Person','org','');
        mtPrevGOAL.AsString:=   Ini.ReadString('Person','goal','');
        mtPrevTEL.AsString:=    Ini.ReadString('Person','tel','');
        mtPrevMAIL.AsString:=   Ini.ReadString('Person','mail','');
        mtPrevAUTO.AsString:=   Ini.ReadString('Person','auto','');
        mtPrevSRC.AsString:=    lst[i];
        mtPrev.Post;
      finally
        Ini.Free;
      end;
    end;
  finally
    grdPrev.DefaultApplySorting;
    mtPrev.First;
    mtPrev.EnableControls;
  end;
end;

procedure TMain.GetAllFiles(Path: string; Lb: TStringList; All: boolean=False);
var
  mask: string;
  sRec: TSearchRec;
  isFound: boolean;
begin
  mask:= Format('%s\%s~*.%s',[Path, f_user, FINI]);
  isFound := FindFirst( mask, faAnyFile, sRec ) = 0;
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
        Lb.Add(Path + '\' + sRec.Name);
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

procedure TMain.grdPrevDblClick(Sender: TObject);
begin
  SetPage(tsPerson);
end;

function TMain.GetUserFromWindows: string;
var
  UserName : string;
  UserNameLen : Dword;
begin
  UserNameLen := 255;
  SetLength(userName, UserNameLen);
  if GetUserName(PChar(UserName), UserNameLen) then
    Result := Copy(UserName,1,UserNameLen - 1)
  else
    Result := 'Unknown';
end;

end.

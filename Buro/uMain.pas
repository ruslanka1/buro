{
+ Отчет: сравнивать кабинеты в верхнем регистре
}
unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, DBCtrlsEh,
  Vcl.ExtCtrls, DBGridEhGrouping, GridsEh, DBGridEh, Vcl.ComCtrls, Data.DB,
  MemDB, Data.Win.ADODB, ZAbstractRODataset, ZDataset, ZAbstractConnection,
  ZConnection;

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
    lblDTDOC: TLabel;
    lblCODEDOC: TLabel;
    edCODEDOC: TEdit;
    lblMAIL: TLabel;
    edMAIL: TEdit;
    lblOLD: TLabel;
    edOLD: TEdit;
    lblROOM: TLabel;
    edBDATE: TDBDateTimeEditEh;
    edDTDOC: TDBDateTimeEditEh;
    lblDOCSER: TLabel;
    edDOCSER: TEdit;
    lblDOCNUM: TLabel;
    edDOCNUM: TEdit;
    lblGOAL: TLabel;
    stStatus: TPanel;
    tsList: TTabSheet;
    btnFind: TButton;
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
    dsReg: TDataSource;
    MSBase: TADOConnection;
    qReg: TADOQuery;
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
    lblDoc: TLabel;
    cbDoc: TDBComboBoxEh;
    mmWhDOC: TMemo;
    cbGOAL: TDBComboBoxEh;
    mtINTIME: TStringField;
    qRegFIND: TStringField;
    edTurnDT: TDBDateTimeEditEh;
    edEvaDT: TDBDateTimeEditEh;
    tmNoSleep: TTimer;
    pgBase: TZConnection;
    pgQry: TZReadOnlyQuery;
    pgQryGUID: TWideStringField;
    pgQryLNAME: TWideStringField;
    pgQryFNAME: TWideStringField;
    pgQrySNAME: TWideStringField;
    pgQryDT_MSE: TDateTimeField;
    pgQryORG: TWideStringField;
    pgQryROOM: TWideStringField;
    pgQryFIND: TStringField;
    cbROOM: TDBComboBoxEh;
    tsPrev: TTabSheet;
    mtPrev: TMemTable;
    mtPrevLNAME: TStringField;
    mtPrevFNAME: TStringField;
    mtPrevSNAME: TStringField;
    mtPrevROOM: TStringField;
    mtPrevDT: TDateTimeField;
    mtPrevORG: TStringField;
    mtPrevGOAL: TStringField;
    mtPrevTEL: TStringField;
    mtPrevMAIL: TStringField;
    mtPrevSRC: TStringField;
    dsPrev: TDataSource;
    sbPrev: TStatusBar;
    grdPrev: TDBGridEh;
    pnlPrev: TPanel;
    btnPrevRefresh: TButton;
    edPrevDT: TDBDateTimeEditEh;
    mtPrevOWN: TStringField;
    mtPrevFIND: TStringField;
    mtSRC: TStringField;
    mtPrevAUTO: TStringField;
    mtPrevDTCREAT: TDateTimeField;
    lblFLOOR: TLabel;
    cbFLOOR: TDBComboBoxEh;
    btnMtCsv: TButton;
    mtORG: TStringField;
    btnRepCsv: TButton;
    btnRep1: TButton;
    btnRep2: TButton;
    btnRep3: TButton;
    btnRep4: TButton;
    btnRep5: TButton;
    procedure btnNewClick(Sender: TObject);
    procedure btnScanClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edBDATEExit(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure mtAfterScroll(DataSet: TDataSet);
    procedure btnTurnRefreshClick(Sender: TObject);
    procedure btnEvaRefreshClick(Sender: TObject);
    procedure grdEvaDblClick(Sender: TObject);
    procedure qRegAfterScroll(DataSet: TDataSet);
    procedure tsPersonShow(Sender: TObject);
    procedure edUpKeyPress(Sender: TObject; var Key: Char);
    procedure edLwKeyPress(Sender: TObject; var Key: Char);
    procedure qRegCalcFields(DataSet: TDataSet);
    procedure tsTurnShow(Sender: TObject);
    procedure tsListShow(Sender: TObject);
    procedure edTurnDTCloseUp(Sender: TObject; Accept: Boolean);
    procedure edTurnDTKeyPress(Sender: TObject; var Key: Char);
    procedure edEvaDTCloseUp(Sender: TObject; Accept: Boolean);
    procedure edEvaDTKeyPress(Sender: TObject; var Key: Char);
    procedure tmNoSleepTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbROOMExit(Sender: TObject);
    procedure pgQryAfterScroll(DataSet: TDataSet);
    procedure pgQryCalcFields(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure tsPrevShow(Sender: TObject);
    procedure btnPrevRefreshClick(Sender: TObject);
    procedure edPrevDTCloseUp(Sender: TObject; Accept: Boolean);
    procedure edPrevDTKeyPress(Sender: TObject; var Key: Char);
    procedure mtPrevCalcFields(DataSet: TDataSet);
    procedure grdPrevDblClick(Sender: TObject);
    procedure grdTurnDblClick(Sender: TObject);
    procedure mtPrevAfterScroll(DataSet: TDataSet);
    procedure btnMtCsvClick(Sender: TObject);
    procedure btnRepCsvClick(Sender: TObject);
    procedure btnRepClick(Sender: TObject);
  private
    { Private declarations }
    app_dir,
    cur_dir,
    prs_dir,
    turn_dir,
    f_user,
    f_operator,
    f_buro_nm,
    f_eva_tp, // ms-MsSql, pg-PostGreSql
    f_eva_ip,
    f_eva_bd,
    f_eva_port,
    f_eva_login,
    f_eva_password,
    f_eva_id: string;
    f_floor_num,
    f_buro_id,
    f_view_num,
    f_ticket: integer;
    f_no_sleep_F15,
    f_no_sleep_mouse,
    f_view,
    f_save: boolean;
    f_view_dt: TDateTime;
    f_lst_floor,
    f_lst_r_floor,
    f_lst_room,
    f_lst_org,
    f_lst_docs,
    f_lst_goal,
    f_rep_room: TStringList;
    f_rep_names,
    f_rep_rooms: array [1..5] of string;
    procedure scan;
    function save(dt: TDateTime): boolean;
    procedure clear;
    procedure calc_old;
    procedure srun(nm: string);
    procedure init_ticket(dt: TDateTime; num: integer);
    function  set_barcode(num, mode: integer): string;
    procedure SaveDir;     // Сохраняем пути в реестр
    procedure LoadDir;     // Считываем пути из реестра
    function save_eva (dt: TDateTime): boolean;
    function save_turn(dt: TDateTime): boolean;
    function CrtXML(dt: TDateTime): boolean;
    function CrtIni(dt: TDateTime): boolean;
    procedure turn_refresh;// Перечитать очередь
    procedure turn_write(lst: TStringList);  // Записать очередь
    procedure GetConLst;   // Предворительная запись из ЕАВИИАС
    procedure GetAllFiles(Path, Mask: string; Lb: TStringList; All: boolean=False);
    procedure GetAllDir(Path: string; Lb: TStringList; All: boolean=False);
    function CheckMask(Mask, Name: string): boolean;
    function get_ticket(dt: TDateTime): integer;
    procedure read_ini;
    function find_eva: boolean;
    procedure insert_eva;
    procedure prev_refresh;// Перечитать предв. запись
    procedure prev_write(lst: TStringList);  // Записать предв. запись
    function find_prev: boolean;
    procedure insert_prev;
    procedure turn_show_pers(f_nm: string);
    function mvbTryConnectPath(const APath: string): Boolean; // Активация сетевого диска
    function GetUserFromWindows: string;
    procedure SaveErr(err: string = '');
    function visitor: string;
    function can_fio_rewrite: boolean;
    procedure ExportDataSet_CSV(DS: TDataSet; Descr: string; Rep: string = '');
    procedure ArcFilterFunc(Sender: TCustomMemTable; Param: Integer; var Skip: boolean);
    function UpperCaseFirst(const S : string; cnt: integer = MaxInt) : string;
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
  FTURN = 'Z:\buro\_turn';
  FPDIR = 'Q:\prev';
  FPINI = 'prv';
  FERR = 'err_log.txt';
  FREP = 'rep';

implementation

uses System.IniFiles, Winapi.shellapi, JPEG, System.Win.Registry,
     System.DateUtils, System.Math, uTicket, System.StrUtils, HmDsFtEh ;

{$R *.dfm}

function TMain.can_fio_rewrite: boolean;
begin
  Result:=
    (trim(edDOCSER.Text)='') and
    (trim(edDOCNUM.Text)='') and
    (trim(edLNAME.Text)='')  and
    (trim(edFNAME.Text)='')  and
    (trim(edSNAME.Text)='')
end;

procedure TMain.btnEvaRefreshClick(Sender: TObject);
begin
  GetConLst;
end;

procedure TMain.btnFindClick(Sender: TObject);
begin
  if not find_eva then
    find_prev;
end;

procedure TMain.btnNewClick(Sender: TObject);
begin
  clear;
end;

procedure TMain.btnPrevRefreshClick(Sender: TObject);
begin
  prev_refresh;
end;

procedure TMain.btnPrintClick(Sender: TObject);
var
  cdt: TDateTime;
begin
  if not f_view then
  begin
    cdt:= now;
    f_save:= save(cdt);
    if f_save then
    begin
      init_ticket(cdt, f_ticket);
      clear;
    end;
  end
  else
    init_ticket(f_view_dt, f_view_num);
end;

procedure TMain.btnMtCsvClick(Sender: TObject);
var fn, prf, rep, s: string;
begin
  if mt.RecordCount > 0 then
  begin
    fn:= app_dir + FREP;
    if (not DirectoryExists(fn)) and (not ForceDirectories(fn)) then
    begin
      stStatus.Caption:=  'Не удалось создать папку для отчетов...';
      stStatus.Color:= clFuchsia;
      Application.ProcessMessages;
      SaveErr(stStatus.Caption);
      abort;
    end;
    s:= 'ОТЧЁТ';
    if TButton(Sender).Tag in [0,1] then
      s:= trim(TButton(Sender).Caption)
    else if TButton(Sender).Tag in [2..6] then
      s:= trim(f_rep_names[TButton(Sender).Tag-1]);
    rep:= s + ' на ' + FormatDateTime('dd.mm.yyyy', edTurnDT.Value);
    prf:= StringReplace(s,' ','_',[rfReplaceAll]);
    fn:= fn + '\' + prf + '_' + FormatDateTime('yyyy-mm-dd_hh-nn-ss', now) + '.csv';
//    fn:= 'D:\_Dst\1\' + prf + FormatDateTime('yyyy-mm-dd_hh-nn-ss', now) + '.csv';
    try
      ExportDataSet_CSV(mt, fn, rep);
      mt.Last;
      stStatus.Caption:=  'Сохранён: '+fn;
      stStatus.Color:= clBtnFace;
      Application.ProcessMessages;
    except
      on E: Exception do
      begin
        stStatus.Caption:=  'Ошибка вывода в CSV ( '+ E.Message +' )';
        stStatus.Color:= clFuchsia;
        Application.ProcessMessages;
        SaveErr(stStatus.Caption);
      end;
    end;
  end;
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

procedure TMain.btnRepClick(Sender: TObject);
var i: integer;
begin
  i:= TButton(Sender).Tag - 1;
  if i in [1..5] then
    try
      //mt.DisableControls;
      f_rep_room.Text:= StringReplace(f_rep_rooms[i],',',#13#10,[rfReplaceAll]);
      mt.ApplyFilter(ArcFilterFunc);
      btnMtCsvClick(Sender);
    finally
      mt.CancelFilter;
      grdTurn.DefaultApplySorting;
      mt.Last;
      //mt.EnableControls;
      Application.ProcessMessages;
    end;
end;

procedure TMain.ArcFilterFunc(Sender: TCustomMemTable; Param: Integer; var Skip: boolean);
var
  i: integer;
begin
  Skip:= Length(Sender.FieldByName('ROOM').AsString) = 0;
  if not Skip then
  begin
    try
      for i := 0 to f_rep_room.Count -1 do
      begin
        Skip:= AnsiUpperCase(trim(Sender.FieldByName('ROOM').AsString)) = AnsiUpperCase(trim(f_rep_room[i]));
        if Skip then
          break;
      end;
    finally
      Skip:= not Skip;
    end;
  end;
end;

procedure TMain.btnRepCsvClick(Sender: TObject);
var
  i: integer;
begin
  try
    for i := 0 to grdTurn.Columns.Count - 1 do
      if grdTurn.Columns[i].FieldName = 'ORG' then
        grdTurn.Columns[i].Title.SortMarker:= smUpEh
      else
        grdTurn.Columns[i].Title.SortMarker:= smNoneEh;
    grdTurn.DefaultApplySorting;
    btnMtCsvClick(Sender);
  finally
    for i := 0 to grdTurn.Columns.Count - 1 do
      if grdTurn.Columns[i].FieldName = 'NUM' then
        grdTurn.Columns[i].Title.SortMarker:= smUpEh
      else
        grdTurn.Columns[i].Title.SortMarker:= smNoneEh;
    grdTurn.DefaultApplySorting;
    mt.Last;
    Application.ProcessMessages;
  end;
end;

procedure TMain.calc_old;
begin
  if edBDATE.Value <> null then
    edOLD.Text:= IntToStr(YearsBetween(now, edBDATE.Value));
end;

procedure TMain.clear;
begin
  stStatus.Caption:= '';
  stStatus.Color:= clBtnFace;
  cbDoc.Text:= '';
  edDOCSER.Text:= '';
  edDOCNUM.Text:= '';
  edLNAME.Text:= '';
  edFNAME.Text:= '';
  edSNAME.Text:= '';
  edSEX.Text:= '';
  edBDATE.Text:= '';
  edBPLACE.Text:= '';
  mmWhDOC.Lines.Text:= '';
  edDTDOC.Text:= '';
  edCODEDOC.Text:= '';
  edMAIL.Text:= '';
  edOLD.Text:= '';
  cbROOM.Text:= '';
  cbFLOOR.Text:= '';
  cbGOAL.Text:= '';
  edTime.Text:= '';
  mmOrg.Lines.Text:= '';
  f_eva_id:= '';
  f_ticket:= 0;
  f_save:= False;
  f_view:= False;
  imgPerson.Picture.LoadFromFile(app_dir+'About.jpg');
  imgPerson.Hide;
  pcPGS.ActivePage:= tsPerson;
  if edLNAME.CanFocus then
    edLNAME.SetFocus;
  btnFind.Caption:= 'Найти';
  pnlPerson.Enabled := not f_view;
  Application.ProcessMessages;
end;

procedure TMain.edBDATEExit(Sender: TObject);
begin
  calc_old;
end;

procedure TMain.edEvaDTCloseUp(Sender: TObject; Accept: Boolean);
begin
  GetConLst;
end;

procedure TMain.edEvaDTKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    GetConLst;
end;

procedure TMain.edLwKeyPress(Sender: TObject; var Key: Char);
begin
  Key:= Char(CharLower(PWideChar(Key)));
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

procedure TMain.cbROOMExit(Sender: TObject);
var
  i, j: integer;
  room: string;
begin
  room:= trim(cbROOM.Text);
  // подразделение
  if f_lst_org.Count > 0 then
    for i := 0 to f_lst_org.Count - 1 do
      if f_lst_org.Names[i] = room then
      begin
        mmOrg.Text:= f_lst_org.Values[f_lst_org.Names[i]];
        break;
      end;
  // цель визита
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
  // расположение - этаж
  if (f_lst_r_floor.Count > 0) and (f_lst_floor.Count > 0) then
    for i := 0 to f_lst_r_floor.Count - 1 do
      if f_lst_r_floor.Names[i] = room then
      begin
        for j := 0 to f_lst_floor.Count - 1 do
          if f_lst_floor.Values[f_lst_floor.Names[j]] = f_lst_r_floor.Values[f_lst_r_floor.Names[i]] then
          begin
            cbFLOOR.ItemIndex:= j;
            break;
          end;
        break;
      end;
end;

procedure TMain.edTurnDTCloseUp(Sender: TObject; Accept: Boolean);
begin
  turn_refresh;
end;

procedure TMain.edTurnDTKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    turn_refresh;
end;

procedure TMain.edUpKeyPress(Sender: TObject; var Key: Char);
begin
  Key:= Char(CharUpper(PWideChar(Key)));
end;

function TMain.find_eva: boolean;
var
  s: String;
begin
  Result:= False;
  if (not dsReg.DataSet.Active) or (edEvaDT.Value <> date) then
  begin
    edEvaDT.Value:= date;
    GetConLst;
  end;

  if dsReg.DataSet.Active and (dsReg.DataSet.RecordCount > 0) then
  begin
    s:= AnsiUpperCase(trim(edLNAME.Text)+trim(edFNAME.Text)+trim(edSNAME.Text));
    if (s <> '') then
    begin
      dsReg.DataSet.First;
      while not dsReg.DataSet.Eof do
      begin
        if pos(s, dsReg.DataSet.FieldByName('FIND').AsString) = 1 then
        begin
          Result:= True;
          insert_eva;
          break;
        end;
        dsReg.DataSet.Next;
      end;
    end
    else
      Application.MessageBox('Не указано ФИО для поиска...','Внимание!');
  end
  else
    Application.MessageBox('Список из ЕАВИИАС не загружен...','Внимание!');
end;

function TMain.find_prev: boolean;
var
  s: String;
begin
  Result:= False;
  //if (edPrevDT.Value <> date) then
  //begin
    edPrevDT.Value:= date;
    prev_refresh;
  //end;

  if mtPrev.Active and (mtPrev.RecordCount > 0) then
  begin
    s:= AnsiUpperCase(trim(edLNAME.Text)+trim(edFNAME.Text)+trim(edSNAME.Text));
    if (s <> '') then
    begin
      mtPrev.First;
      while not mtPrev.Eof do
      begin
        if pos(s, mtPrevFIND.AsString) = 1 then
        begin
          Result:= True;
          insert_prev;
          break;
        end;
        mtPrev.Next;
      end;
    end
    else
      Application.MessageBox('Не указано ФИО для поиска...','Внимание!');
  end;
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  clear;
  SaveDir;
  f_lst_docs.Free;
  f_lst_goal.Free;
  f_lst_room.Free;
  f_lst_org.Free;
  f_lst_floor.Free;
  f_lst_r_floor.Free;
  f_rep_room.Free;

  if MSBase.Connected then
    MSBase.Close;

  if pgBase.Connected then
    pgBase.Disconnect;
end;

procedure TMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:= false;
  if Application.MessageBox('Завершить работу?', 'Внимание', MB_OKCANCEL) <> IDOK then Exit;
  CanClose:= true;
end;

procedure TMain.FormCreate(Sender: TObject);
begin
  f_lst_docs:=    TStringList.Create;
  f_lst_goal:=    TStringList.Create;
  f_lst_room:=    TStringList.Create;
  f_lst_org:=     TStringList.Create;
  f_lst_floor:=   TStringList.Create;
  f_lst_r_floor:= TStringList.Create;
  f_rep_room:=    TStringList.Create;
end;

procedure TMain.FormShow(Sender: TObject);
//var dir: string;
begin
  f_user:= GetUserFromWindows;
  LoadDir;
  app_dir:= ExtractFilePath(Application.ExeName);
//  dir:= app_dir+'About.jpg';
//  imgPerson.Picture.LoadFromFile(dir);
//  imgPerson.Hide;
  read_ini;
  clear;
  if not DirectoryExists(FDIR) then
    mvbTryConnectPath(FDIR);          // Активировать сетевой диск
  if f_no_sleep_mouse or f_no_sleep_F15 then
    tmNoSleep.Enabled:= True;
end;

function TMain.set_barcode(num, mode: integer): string;
var s_num, dt_num: string;
begin
  Result:= '*000000*';
  s_num:= IntToStr(num);
  dt_num:= IntToStr(DayOfTheYear(date));
  case mode of
    0: Result:= '*'+RightStr('000'+dt_num, 3)+RightStr('000'+s_num, 3)+'*';
    1: Result:= '*'+RightStr('000'+s_num, 3)+'* - *'+RightStr('000'+dt_num, 3)+'*';
    2: Result:= RightStr('000'+dt_num, 3);
    3: Result:= RightStr('000'+ s_num, 3);
  end;
end;

procedure TMain.init_ticket(dt: TDateTime; num: integer);
var t_on: string;
begin
  Ticket.mmOrg.Lines.Text:= trim(mmOrg.Lines.Text);
  Ticket.lblDate.Caption := FormatDateTime('dd.mm.yyyy', dt);
  Ticket.lblInTimeNM.Caption:= 'Время: ' + FormatDateTime('hh:nn', dt);
  t_on := trim(edTime.Text);
  if t_on <> '' then
    Ticket.lblInTimeNM.Caption:= Ticket.lblInTimeNM.Caption + ' на ' + t_on;
  Ticket.lblRoom.Caption:= 'каб.' + trim(cbROOM.Text) + ' ' + trim(cbFLOOR.Text);
  Ticket.lblGoal.Caption:= trim(cbGOAL.Text);
  Ticket.lblBarcode.Caption:= set_barcode(num, 0);
  Ticket.lblNumber.Caption := set_barcode(num, 0);
  Ticket.lblNum.Caption := 'Талон № ' + set_barcode(num, 3) + '  ' + f_buro_nm;
  Ticket.fdir:= prs_dir;
  Ticket.femail:= trim(edMAIL.Text);
  Ticket.fvisitor := visitor;
  Ticket.foperator:= f_operator;
  Ticket.fnum:= 'Талон № ' + set_barcode(num, 3);
  Ticket.fview:= f_view;
  Ticket.ShowModal;
  // if Ticket.ShowModal <> mrOk then
  //   удалить  prs_dir ???
end;

function TMain.visitor: string;
var
  s: string;
begin
  s:=   AnsiUpperCase(edLNAME.Text)
  +' '+ AnsiUpperCase(edFNAME.Text)
  +' '+ AnsiUpperCase(edSNAME.Text)
  +', '+ AnsiLowerCase(cbDoc.Text)
  +' '+ edDOCSER.Text
  +' '+ edDOCNUM.Text
  ;
  if (trim(edBPLACE.Text) <> '') then
    s:= s + ', место рождения ' + trim(edBPLACE.Text);
  if (trim(mmWhDOC.Lines.Text) <> '') or (edDTDOC.Value <> null) then
    s:= s + ', выдан';
  if (edDTDOC.Value <> null) then
    s:= s + ' ' +  DateToStr(edDTDOC.Value);
  if (trim(mmWhDOC.Lines.Text) <> '') then
    s:= s + ' ' + trim(mmWhDOC.Lines.Text);
  if (trim(edCODEDOC.Text) <> '') then
    s:= s + ' код ' + trim(edCODEDOC.Text);
  Result:= s;
end;

function TMain.save(dt: TDateTime): boolean;
var
  //c_dir: string;
  Ini: Tinifile;
begin
{
  if not DirectoryExists(FDIR) then
  begin
    stStatus.Caption:=  'Нет подключения к хранилищу !';
    stStatus.Color:= clFuchsia;
    Application.ProcessMessages;
    exit;
  end;

  c_dir:= FDIR+'\'+FormatDateTime('yyyy-mm-dd', now);
  if (not DirectoryExists(c_dir)) and (not CreateDir(c_dir)) then
  begin
    stStatus.Caption:=  'Нет возможности начать регистрацию на сегодня !';
    stStatus.Color:= clFuchsia;
    Application.ProcessMessages;
    exit;
  end;

  c_dir:= c_dir+'\'+Format('%.3d', [f_ticket]);  //IntToStr(f_ticket);
  if (not DirectoryExists(c_dir)) and (not CreateDir(c_dir)) then
  begin
    stStatus.Caption:=  'Нет возможности сохранить регистрацию посетителя !';
    stStatus.Color:= clFuchsia;
    Application.ProcessMessages;
    exit;
  end;
}
  Result:= False;
  if (trim(edLNAME.Text)='') or
     (trim(cbROOM.Text )='') or
     (trim(cbROOM.Text )='') or
     (trim(cbGOAL.Text )='') then
  begin
    Application.MessageBox('Не указана Фамилия или Кабинет или Цель...','Внимание!');
    abort;
  end;
  f_ticket:= get_ticket(dt);
  if (f_ticket > 0) then
  begin
    Application.ProcessMessages;
//    Ini:=TiniFile.Create(prs_dir+'\'+FINI);
    Ini:=TiniFile.Create(app_dir+FINI);
    try
      Ini.WriteDateTime('Person','dtcreat',dt);
      Ini.WriteString('Person','intime',FormatDateTime('hh:nn',dt));
      Ini.WriteString('Person','doc',cbDoc.Text);
      Ini.WriteString('Person','docser',edDOCSER.Text);
      Ini.WriteString('Person','docnum',edDOCNUM.Text);
      Ini.WriteString('Person','fname',edFNAME.Text);
      Ini.WriteString('Person','lname',edLNAME.Text);
      Ini.WriteString('Person','sname',edSNAME.Text);
      Ini.WriteString('Person','sex',edSEX.Text);
      if (edBDATE.Value <> null) then
        Ini.WriteDate  ('Person','bdate',edBDATE.Value);
      Ini.WriteString('Person','bplase',edBPLACE.Text);
      Ini.WriteString('Person','whdoc',mmWhDOC.Lines.Text);
      if (edDTDOC.Value <> null) then
        Ini.WriteDate  ('Person','dtdoc',edDTDOC.Value);
      Ini.WriteString('Person','coddoc',edCODEDOC.Text);
      Ini.WriteString('Person','mail',edMAIL.Text);
      Ini.WriteString('Person','room',cbROOM.Text);
      Ini.WriteString('Person','ticket',IntToStr(f_ticket));
      Ini.WriteString('Person','old',edOLD.Text);
      Ini.WriteString('Person','goal',cbGOAL.Text);
      Ini.WriteString('Person','goal_id',f_lst_goal.Values[cbGOAL.Text]);
      Ini.WriteString('Person','floor',cbFLOOR.Text);
      Ini.WriteString('Person','floor_id',f_lst_floor.Values[cbFLOOR.Text]);
      Ini.WriteString('Person','evaid',f_eva_id);
      Ini.WriteString('Person','evatime',edTime.Text);
      Ini.WriteString('Person','evaorg',mmOrg.Lines.Text);

      Ini.WriteString('Buro','buro_id',IntToStr(f_buro_id));
      Ini.WriteString('Buro','buro_nm',f_buro_nm);
      Ini.WriteString('Buro','user',f_user);

      if not MoveFileEx(PChar(app_dir+FINI),PChar(prs_dir+'\'+FINI),MOVEFILE_COPY_ALLOWED) then
      begin
        stStatus.Caption:=  'Ошибка копирования ini файла посетителя на КПП ! '+IntToStr(GetLastError());
        stStatus.Color:= clFuchsia;
        Application.ProcessMessages;
        SaveErr(stStatus.Caption);
        abort;
      end;
      if imgPerson.Visible then
        imgPerson.Picture.SaveToFile(prs_dir+'\'+FIMG);
      save_turn(dt);
      if f_eva_tp <> '' then
        save_eva(dt);
      Result:= True;
    finally
      Ini.Free;
    end;
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
  begin
    stStatus.Caption:= 'Программа сканирования pscan.exe не найдена...';
    stStatus.Color:= clFuchsia;
    Application.ProcessMessages;
    SaveErr(stStatus.Caption);
    exit;
  end;

  stStatus.Caption:= 'Читаю...';
  Application.ProcessMessages;

  s :=  app_dir+'scanned.txt';
  if FileExists(s) then
  begin
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
      mmWhDOC.Lines.Text := trim(lst.Values ['Authority']);
      edCODEDOC.Text := trim(lst.Values ['Authority code']);
      edDTDOC.Text := trim(lst.Values ['Issue date']);
      if (edDOCSER.Text<>'') and (edDOCNUM.Text<>'') then
      begin
        if cbDoc.Items.Count > 0 then
          cbDoc.ItemIndex:= 0;
        if cbROOM.CanFocus then
          cbROOM.SetFocus;
      end
      else
      begin
        if cbDoc.Items.Count > 1 then
          cbDoc.ItemIndex:= 1;
        if edLNAME.CanFocus then
          edLNAME.SetFocus;
      end;
    finally
      lst.Free;
      calc_old;
      DeleteFile(s);
    end;
  end
  else
  begin
    stStatus.Caption:= 'Файл scanned.txt не найден...';
    Application.ProcessMessages;
    SaveErr(stStatus.Caption);
  end;

  s:= app_dir+'scanned.jpg';
  if FileExists(s) then
  begin
    try
      imgPerson.Picture.LoadFromFile(s);
    finally
      imgPerson.Show;
      stStatus.Caption:= '';
      DeleteFile(s);
    end;
  end
  else
  begin
    stStatus.Caption:= 'Файл scanned.jpg не найден...';
    Application.ProcessMessages;
    SaveErr(stStatus.Caption);
  end;
(*
  s :=  app_dir+'scanned.jpg';
  s_out:= FDIR+'\'+FormatDateTime('yyyy-mm-dd', now)+'\'+edTicket.Text;
  if not CopyFile(PChar(s),PChar(s_out),False) then
    Application.MessageBox('Ошибка копирования скана...','Внимание');
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
  begin
    stStatus.Caption:= 'Сканирование не запустилось...';
    stStatus.Color:= clFuchsia;
    Application.ProcessMessages;
    SaveErr(stStatus.Caption);
  end
  else
  begin
    stStatus.Caption:= 'Идёт сканирование...';
    Screen.Cursor:= crHourGlass;
    Application.ProcessMessages;
    try
      repeat
        Sleep (100);
        //Application.ProcessMessages;
        GetExitCodeProcess(SEInfo.hProcess, ExitCode);
      until (ExitCode <> STILL_ACTIVE)
         or  Application.Terminated
      ;
      stStatus.Caption:= 'Сканирование закончено.';
      Application.ProcessMessages;
    finally
      Screen.Cursor:= crDefault;
    end;
  end
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

procedure TMain.mtAfterScroll(DataSet: TDataSet);
begin
  sbTurn.Panels[0].Text:= Format('%d : %d', [DataSet.RecNo, DataSet.RecordCount]);
end;

procedure TMain.mtPrevAfterScroll(DataSet: TDataSet);
begin
  sbPrev.Panels[0].Text:= Format('%d : %d', [DataSet.RecNo, DataSet.RecordCount]);
  if DataSet.RecordCount > 0 then
    sbPrev.Panels[1].Text:= Format('Создано: %s от %s',
    [mtPrevOWN.AsString, mtPrevDTCREAT.AsString])
  else sbPrev.Panels[1].Text:= '';
end;

procedure TMain.mtPrevCalcFields(DataSet: TDataSet);
begin
  mtPrevFIND.AsString:= AnsiUpperCase(
    trim(mtPrevLNAME.AsString) +
    trim(mtPrevFNAME.AsString) +
    trim(mtPrevSNAME.AsString));
end;

procedure TMain.pgQryAfterScroll(DataSet: TDataSet);
begin
  sbEva.Panels[0].Text:= Format('%d : %d', [DataSet.RecNo, DataSet.RecordCount]);
end;

procedure TMain.pgQryCalcFields(DataSet: TDataSet);
begin
  pgQryFIND.AsString:= AnsiUpperCase(
    trim(pgQryLNAME.AsString) +
    trim(pgQryFNAME.AsString) +
    trim(pgQrySNAME.AsString));
end;

procedure TMain.qRegAfterScroll(DataSet: TDataSet);
begin
  sbEva.Panels[0].Text:= Format('%d : %d', [DataSet.RecNo, DataSet.RecordCount]);
end;

procedure TMain.qRegCalcFields(DataSet: TDataSet);
begin
  qRegFIND.AsString:= AnsiUpperCase(
    trim(qRegLNAME.AsString) +
    trim(qRegFNAME.AsString) +
    trim(qRegSNAME.AsString));
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
      f_lst_docs.Clear;
      Ini.ReadSectionValues('Docs', f_lst_docs);
      cbDoc.Items.Clear;
      for i := 0 to f_lst_docs.Count - 1 do
        cbDoc.Items.Add(f_lst_docs.Names[i]);

      f_lst_goal.Clear;
      Ini.ReadSectionValues('Goal', f_lst_goal);
      cbGOAL.Items.Clear;
      for i := 0 to f_lst_goal.Count - 1 do
        cbGOAL.Items.Add(f_lst_goal.Names[i]);

      f_lst_floor.Clear;
      Ini.ReadSectionValues('Floor', f_lst_floor);
      cbFLOOR.Items.Clear;
      for i := 0 to f_lst_floor.Count - 1 do
        cbFLOOR.Items.Add(f_lst_floor.Names[i]);

      f_lst_room.Clear;
      Ini.ReadSectionValues('Room_Goal', f_lst_room);

      f_lst_r_floor.Clear;
      Ini.ReadSectionValues('Room_Floor', f_lst_r_floor);

      f_lst_org.Clear;
      Ini.ReadSectionValues('Room_Org',  f_lst_org);
      cbROOM.Items.Clear;
      for i := 0 to f_lst_org.Count - 1 do
        cbROOM.Items.Add(f_lst_org.Names[i]);

      f_eva_tp      := Ini.ReadString('EVA','eva_tp','');
      if f_eva_tp = 'ms' then
        dsReg.DataSet := qReg
      else if f_eva_tp = 'pg' then
        dsReg.DataSet := pgQry;

      f_eva_ip      := Ini.ReadString('EVA','eva_ip','');
      f_eva_bd      := Ini.ReadString('EVA','eva_bd','');
      f_eva_port    := Ini.ReadString('EVA','eva_port','');
      f_eva_login   := Ini.ReadString('EVA','eva_login','');
      f_eva_password:= Ini.ReadString('EVA','eva_password','');

      f_no_sleep_F15  := Ini.ReadInteger('Sys','no_sleep_f15',0) = 1;
      f_no_sleep_mouse:= Ini.ReadInteger('Sys','no_sleep_mouse',0) = 1;
      f_buro_id:= Ini.ReadInteger('Sys','buro_id',0);
      f_buro_nm:= Ini.ReadString ('Sys','buro_nm','');
      f_floor_num:= Ini.ReadInteger('Sys','floor_num',0);
      f_operator:= Ini.ReadString('Sys','operator','Бюро МСЭ');

      f_rep_names[1]:= Ini.ReadString('Rep1','name','');
      f_rep_rooms[1]:= Ini.ReadString('Rep1','room','');
      f_rep_names[2]:= Ini.ReadString('Rep2','name','');
      f_rep_rooms[2]:= Ini.ReadString('Rep2','room','');
      f_rep_names[3]:= Ini.ReadString('Rep3','name','');
      f_rep_rooms[3]:= Ini.ReadString('Rep3','room','');
      f_rep_names[4]:= Ini.ReadString('Rep4','name','');
      f_rep_rooms[4]:= Ini.ReadString('Rep4','room','');
      f_rep_names[5]:= Ini.ReadString('Rep5','name','');
      f_rep_rooms[5]:= Ini.ReadString('Rep5','room','');

      btnRep1.Caption:= UpperCaseFirst(f_rep_names[1], 14);
      btnRep1.Visible:= f_rep_names[1]<>'';
      btnRep2.Caption:= UpperCaseFirst(f_rep_names[2], 14);
      btnRep2.Visible:= f_rep_names[2]<>'';
      btnRep3.Caption:= UpperCaseFirst(f_rep_names[3], 14);
      btnRep3.Visible:= f_rep_names[3]<>'';
      btnRep4.Caption:= UpperCaseFirst(f_rep_names[4], 14);
      btnRep4.Visible:= f_rep_names[4]<>'';
      btnRep5.Caption:= UpperCaseFirst(f_rep_names[5], 14);
      btnRep5.Visible:= f_rep_names[5]<>'';
    finally
      Ini.Free;
    end;
  end;
end;

function TMain.UpperCaseFirst(const S : string; cnt: integer = MaxInt) : string;
begin
 if Length(S) > 0 then
  Result := AnsiUpperCase(S[1]) + AnsiLowerCase(Copy(S, 2, cnt))
 else
  Result := '';
end;

function TMain.save_eva(dt: TDateTime): boolean;
begin
  Result:= False;
  if (not DirectoryExists(FEVA)) and (not CreateDir(FEVA)) then
  begin
    stStatus.Caption:=  'Нет подключения к хранилищу ЕАВИИАС!';
    stStatus.Color:= clFuchsia;
    Application.ProcessMessages;
    SaveErr(stStatus.Caption);
    exit;
  end;

  stStatus.Caption:= 'Выгружаем в XML...';
  Application.ProcessMessages;
  if CrtXML(dt) then
  begin
    stStatus.Caption:= 'В ЕАВИИАС направлено!';
    Application.ProcessMessages;
    //sleep(1000);
    stStatus.Caption:= '';
    Application.ProcessMessages;
    Result:= True;
  end
  else
  begin
    stStatus.Caption:= 'Ошибка записи XML в ЕАВИИАС.';
    Application.ProcessMessages;
    SaveErr(stStatus.Caption);
    sleep(1000);
    stStatus.Caption:= '';
    Application.ProcessMessages;
  end;
end;

function TMain.save_turn(dt: TDateTime): boolean;
begin
  Result:= False;
  turn_dir:= FTURN+'\'+FormatDateTime('yyyy-mm-dd', dt);
  if (not DirectoryExists(FTURN)) and (not CreateDir(FTURN)) then
  begin
    stStatus.Caption:=  'Нет подключения к хранилищу Эл. Очереди!';
    stStatus.Color:= clFuchsia;
    Application.ProcessMessages;
    SaveErr(stStatus.Caption);
    exit;
  end;

  if (not DirectoryExists(turn_dir)) and (not CreateDir(turn_dir)) then
  begin
    stStatus.Caption:=  'Нет возможности записать в Эл. Очереди на сегодня !';
    stStatus.Color:= clFuchsia;
    Application.ProcessMessages;
    SaveErr(stStatus.Caption);
    exit;
  end;

  stStatus.Caption:= 'Выгружаем в Эл. Очередь...';
  Application.ProcessMessages;
  if CrtIni(dt) then
  begin
    stStatus.Caption:= 'В Эл. Очередь направлено!';
    Application.ProcessMessages;
    //sleep(1000);
    stStatus.Caption:= '';
    Application.ProcessMessages;
    Result:= True;
  end
  else
  begin
    stStatus.Caption:= 'Ошибка записи в Эл. Очередь.';
    Application.ProcessMessages;
    SaveErr(stStatus.Caption);
    sleep(1000);
    stStatus.Caption:= '';
    Application.ProcessMessages;
  end;
end;

function TMain.CrtIni(dt: TDateTime): boolean;
var
  fn, goal_id, floor_id: string;
  Ini: Tinifile;
begin
  Result:= False;
  if (f_ticket > 0) then
  begin
    Application.ProcessMessages;
    goal_id:= f_lst_goal.Values[cbGOAL.Text];
    if goal_id = '' then
      goal_id:= '0';
    floor_id:= f_lst_floor.Values[cbFLOOR.Text];
    if floor_id = '' then
      floor_id:= '0';
    fn:= 'prs~'+goal_id+'~'+floor_id+'~'+IntToStr(f_ticket)+'~'+IntToStr(f_buro_id)+'.ini';
//    Ini:=TiniFile.Create(turn_dir+'\'+fn);
    Ini:=TiniFile.Create(app_dir+fn);
    try
      Ini.WriteDateTime('Person','dtcreat',dt);
      Ini.WriteString('Person','intime',FormatDateTime('hh:nn',dt));
      Ini.WriteString('Person','doc',cbDoc.Text);
      Ini.WriteString('Person','docser',edDOCSER.Text);
      Ini.WriteString('Person','docnum',edDOCNUM.Text);
      Ini.WriteString('Person','fname',edFNAME.Text);
      Ini.WriteString('Person','lname',edLNAME.Text);
      Ini.WriteString('Person','sname',edSNAME.Text);
      Ini.WriteString('Person','sex',edSEX.Text);
      if (edBDATE.Value <> null) then
        Ini.WriteDate  ('Person','bdate',edBDATE.Value);
      Ini.WriteString('Person','bplase',edBPLACE.Text);
      Ini.WriteString('Person','whdoc',mmWhDOC.Lines.Text);
      if (edDTDOC.Value <> null) then
        Ini.WriteDate  ('Person','dtdoc',edDTDOC.Value);
      Ini.WriteString('Person','coddoc',edCODEDOC.Text);
      Ini.WriteString('Person','mail',edMAIL.Text);
      Ini.WriteString('Person','room',cbROOM.Text);
      Ini.WriteString('Person','ticket',IntToStr(f_ticket));
      Ini.WriteString('Person','old',edOLD.Text);
      Ini.WriteString('Person','goal',cbGOAL.Text);
      Ini.WriteString('Person','goal_id',goal_id);
      Ini.WriteString('Person','floor',cbFLOOR.Text);
      Ini.WriteString('Person','floor_id',floor_id);
      Ini.WriteString('Person','turn_time',edTime.Text);
      Ini.WriteString('Person','turn_org',mmOrg.Lines.Text);

      Ini.WriteString('Buro','buro_id',IntToStr(f_buro_id));
      Ini.WriteString('Buro','buro_nm',f_buro_nm);
      Ini.WriteString('Buro','user',f_user);

      if not MoveFileEx(PChar(app_dir+fn),PChar(turn_dir+'\'+fn),MOVEFILE_COPY_ALLOWED) then
      begin
        stStatus.Caption:=  'Ошибка копирования ini файла посетителя в очередь ! '+IntToStr(GetLastError());
        stStatus.Color:= clFuchsia;
        Application.ProcessMessages;
        SaveErr(stStatus.Caption);
        abort;
      end;

      Result:= True;
    finally
      Ini.Free;
    end;
  end;
end;

function TMain.CrtXML(dt: TDateTime): boolean;
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
      fXML.Add('    <EVAID>'+sxml(f_eva_id)+'</EVAID>');
      fXML.Add('    <NUM>'+sxml(set_barcode(f_ticket,3))+'</NUM>');
      fXML.Add('    <LNAME>'+sxml(edLNAME.Text)+'</LNAME>');
      fXML.Add('    <FNAME>'+sxml(edFNAME.Text)+'</FNAME>');
      fXML.Add('    <SNAME>'+sxml(edSNAME.Text)+'</SNAME>');
      fXML.Add('    <BDATE>'+sxml(edBDATE.Text)+'</BDATE>');
      fXML.Add('    <GOAL>'+sxml(cbGOAL.Text)+'</GOAL>');
      fXML.Add('    <GOALID>'+sxml(f_lst_goal.Values[cbGOAL.Text])+'</GOALID>');
      fXML.Add('    <DOC>'+sxml(cbDOC.Text)+'</DOC>');
      fXML.Add('    <DOCID>'+sxml(f_lst_docs.Values[cbDOC.Text])+'</DOCID>');
      fXML.Add('    <DOCSER>'+sxml(edDOCSER.Text)+'</DOCSER>');
      fXML.Add('    <DOCNUM>'+sxml(edDOCNUM.Text)+'</DOCNUM>');
      fXML.Add('    <SEX>'+sxml(edSEX.Text)+'</SEX>');
      fXML.Add('    <BPLACE>'+sxml(edBPLACE.Text)+'</BPLACE>');
      fXML.Add('    <WhDOC>'+sxml(mmWhDOC.Lines.Text)+'</WhDOC>');
      fXML.Add('    <DTDOC>'+sxml(edDTDOC.Text)+'</DTDOC>');
      fXML.Add('    <CODEDOC>'+sxml(edCODEDOC.Text)+'</CODEDOC>');
      fXML.Add('    <MAIL>'+sxml(edMAIL.Text)+'</MAIL>');
      fXML.Add('    <OLD>'+sxml(edOLD.Text)+'</OLD>');
      fXML.Add('    <ROOM>'+sxml(cbROOM.Text)+'</ROOM>');
      fXML.Add('    <TIME>'+sxml(edTime.Text)+'</TIME>');
      fXML.Add('    <ORG>'+sxml(mmOrg.Lines.Text)+'</ORG>');
    finally
      fXML.Add('  </Person>');
    end;
  end;
begin
  Result:= False;
  if (CreateGUID(MyGUID) = 0) then
  begin
    s:= FormatDateTime('yyyy_mm_dd-', date)+set_barcode(f_ticket,3);
    fXML:= TStringList.Create;
    try
      XmlHeader;
      try
        XmlBoby
      finally
        XmlFooter;
      end;
      fXML.SaveToFile(FEVA+'\'+s+'.xml');
      Result:= True;
    finally
      fXML.Free;
    end;
  end;
end;

procedure TMain.grdEvaDblClick(Sender: TObject);
begin
  if not f_view and not dsReg.DataSet.IsEmpty then
    insert_eva;
end;

procedure TMain.grdPrevDblClick(Sender: TObject);
begin
  if not f_view and not mtPrev.IsEmpty then
    insert_prev;
end;

procedure TMain.grdTurnDblClick(Sender: TObject);
begin
  turn_show_pers(mtSRC.AsString);
end;

procedure TMain.insert_eva;
var
  s: string;
  i: integer;
begin
  f_eva_id:= dsReg.DataSet.FieldByName('GUID').AsString;
  if can_fio_rewrite then
  begin
    edLNAME.Text:=  AnsiUpperCase(trim(dsReg.DataSet.FieldByName('LNAME').AsString));
    edFNAME.Text:=  AnsiUpperCase(trim(dsReg.DataSet.FieldByName('FNAME').AsString));
    edSNAME.Text:=  AnsiUpperCase(trim(dsReg.DataSet.FieldByName('SNAME').AsString));
  end;
  edTime.Text:= FormatDateTime('hh:nn', dsReg.DataSet.FieldByName('DT_MSE').AsDateTime);
  mmOrg.Lines.Text:= dsReg.DataSet.FieldByName('ORG').AsString;
  cbROOM.Text:=  dsReg.DataSet.FieldByName('ROOM').AsString;
  pcPGS.ActivePage:= tsPerson;

  s:= trim(cbROOM.Text);
  if (f_floor_num > 0) and (Length(s) >= f_floor_num) and (StrToIntDef(s[f_floor_num],-1) <> -1) then
    for i := 0 to f_lst_floor.Count - 1 do
      if f_lst_floor.Values[f_lst_floor.Names[i]] = s[f_floor_num] then
      begin
        cbFLOOR.ItemIndex:= i;
        break;
      end;

  if cbGoal.CanFocus then
    cbGoal.SetFocus;
  if cbGoal.Items.Count > 0 then
    cbGoal.ItemIndex:= 0;
end;

procedure TMain.insert_prev;
var
  s: string;
  i: integer;
begin
  if can_fio_rewrite then
  begin
    edLNAME.Text:=  AnsiUpperCase(trim(mtPrevLNAME.AsString));
    edFNAME.Text:=  AnsiUpperCase(trim(mtPrevFNAME.AsString));
    edSNAME.Text:=  AnsiUpperCase(trim(mtPrevSNAME.AsString));
  end;
  edTime.Text:= FormatDateTime('hh:nn', mtPrevDT.AsDateTime);
  cbROOM.Text:=  mtPrevROOM.AsString;
  mmOrg.Lines.Text:= mtPrevORG.AsString;
  cbGOAL.Text:=  AnsiUpperCase(trim(mtPrevGOAL.AsString));
  edMAIL.Text:=  AnsiLowerCase(trim(mtPrevMAIL.AsString));
  pcPGS.ActivePage:= tsPerson;

  s:= trim(cbROOM.Text);
  if (f_floor_num > 0) and (Length(s) >= f_floor_num) and (StrToIntDef(s[f_floor_num],-1) <> -1) then
    for i := 0 to f_lst_floor.Count - 1 do
      if f_lst_floor.Values[f_lst_floor.Names[i]] = s[f_floor_num] then
      begin
        cbFLOOR.ItemIndex:= i;
        break;
      end;
end;

procedure TMain.tsListShow(Sender: TObject);
begin
  if not f_view and (edEvaDT.Value <> date) then
  begin
    edEvaDT.Value:= date;
    GetConLst;
  end;
end;

procedure TMain.tsPersonShow(Sender: TObject);
begin
  if edLNAME.CanFocus then
    edLNAME.SetFocus;
end;

procedure TMain.tsPrevShow(Sender: TObject);
var
  i: Integer;
begin
  if not f_view {and (edPrevDT.Value <> date)} then
  begin
    edPrevDT.Value:= date;
    for i := 0 to grdPrev.Columns.Count - 1 do
      if grdPrev.Columns[i].FieldName = 'LNAME' then
        grdPrev.Columns[i].Title.SortMarker:= smUpEh
      else
        grdPrev.Columns[i].Title.SortMarker:= smNoneEh;
    prev_refresh;
  end;
end;

procedure TMain.prev_refresh;
var
  dir, mask: string;
  lst: TStringList;
begin
  lst:= TStringList.Create;
  try
    if not DirectoryExists(FPDIR) then
    begin
      mvbTryConnectPath(FPDIR);          // Активировать сетевой диск
      sleep(1000);
      if not DirectoryExists(FPDIR) then
      begin
        stStatus.Caption:=  'Нет подключения к предварительной записи !';
        // Status.Color:= clFuchsia;
        SaveErr(stStatus.Caption);
        Application.ProcessMessages;
        exit;
      end;
    end;

    dir:= FPDIR+'\'+FormatDateTime('yyyy-mm-dd', edPrevDT.Value);
    mask:= Format('*.%s',[FPINI]);
    GetAllFiles(dir, mask, lst);
    prev_write(lst);
  finally
    lst.Free;
  end;
end;

procedure TMain.prev_write(lst: TStringList);
  function ExtOwn(str: String): string;
  var ss: string;
  begin
    ss:= ExtractFileName(str);
    Result:= LeftStr(ss, pos('~', ss) - 1);
  end;
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
        mtPrevOWN.AsString:=    ExtOwn(lst[i]);
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

procedure TMain.tsTurnShow(Sender: TObject);
var
  i: integer;
begin
  if not f_view then
  begin
    edTurnDT.Value:= date;
    for i := 0 to grdTurn.Columns.Count - 1 do
      if grdTurn.Columns[i].FieldName = 'NUM' then
        grdTurn.Columns[i].Title.SortMarker:= smUpEh
      else
        grdTurn.Columns[i].Title.SortMarker:= smNoneEh;
    turn_refresh;
  end;
end;

procedure TMain.turn_show_pers(f_nm: string);
var
  Ini: Tinifile;
  c_dir: string;
begin
  if not FileExists(f_nm) then
  begin
    stStatus.Caption:= Format('Файл не найден... %s',[f_nm]);
    Application.ProcessMessages;
    SaveErr(stStatus.Caption);
  end
  else
  begin
    c_dir:= ExtractFilePath(f_nm);
    Ini:=TiniFile.Create(f_nm);
    try
      cbDOC.Text:= Ini.ReadString('Person','doc','');
      edDOCSER.Text:= Ini.ReadString('Person','docser','');
      edDOCNUM.Text:= Ini.ReadString('Person','docnum','');
      edFNAME.Text:= Ini.ReadString('Person','fname','');
      edLNAME.Text:= Ini.ReadString('Person','lname','');
      edSNAME.Text:= Ini.ReadString('Person','sname','');
      edSEX.Text:= Ini.ReadString('Person','sex','');
      edBDATE.Value:= Ini.ReadDate('Person','bdate',0);
      if edBDATE.Value = 0 then
        edBDATE.Value:= null;
      edBPLACE.Text:= Ini.ReadString('Person','bplase','');
      mmWhDOC.Text:= Ini.ReadString('Person','whdoc','');
      edDTDOC.Value:= Ini.ReadDate('Person','dtdoc',0);
      if edDTDOC.Value = 0 then
        edDTDOC.Value:= null;
      edCODEDOC.Text:= Ini.ReadString('Person','coddoc','');
      edMAIL.Text:= Ini.ReadString('Person','mail','');
      cbROOM.Text:= Ini.ReadString('Person','room','');
      cbFLOOR.Text:= Ini.ReadString('Person','floor','');
      f_view_num:= StrToIntDef(Ini.ReadString('Person','ticket',''), 0);
      edOLD.Text:= Ini.ReadString('Person','old','');
      cbGOAL.Text:= Ini.ReadString('Person','goal','');
      mmORG.Text:= Ini.ReadString('Person','evaorg','');
      f_view_dt:= Ini.ReadDateTime('Person','dtcreat',date);
      edTime.Text:= Ini.ReadString('Person','evatime','');
      btnFind.Caption:= Format('№%s, Регистрация: %s',
      [RightStr('000'+Ini.ReadString('Person','ticket',''), 3),
       FormatDateTime('dd.mm.yyyy hh:mm', f_view_dt)]);
      if FileExists(c_dir+FIMG) then
      begin
        imgPerson.Picture.LoadFromFile(c_dir+FIMG);
        imgPerson.Show;
      end
      else
      begin
        imgPerson.Picture.LoadFromFile(app_dir+'About.jpg');
        imgPerson.Hide;
      end;
    finally
      Ini.Free;
      f_view:= True;
      // btnPrint.Enabled:= not f_view;
      pnlPerson.Enabled := not f_view;
      pcPGS.ActivePage:= tsPerson;
      Application.ProcessMessages;
    end;
  end;
end;

procedure TMain.turn_refresh;
var
  dir: string;
  lst: TStringList;
begin
  lst:= TStringList.Create;
  try
    dir:= FDIR+'\'+FormatDateTime('yyyy-mm-dd', edTurnDT.Value);
    GetAllFiles(dir, FINI, lst, True);
    turn_write(lst);
  finally
    lst.Free;
  end;
end;

procedure TMain.turn_write(lst: TStringList);
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
        mtNUM.AsString:=   set_barcode(
          StrToIntDef(Ini.ReadString('Person','ticket',''),0),3);
        mtINTIME.AsString:= Ini.ReadString('Person','intime','');
        mtTIME.AsString:=   Ini.ReadString('Person','evatime','');
        mtLNAME.AsString:=  Ini.ReadString('Person','lname','');
        mtFNMAE.AsString:=  Ini.ReadString('Person','fname','');
        mtSNAME.AsString:=  Ini.ReadString('Person','sname','');
        mtBDATE.AsString:=  Ini.ReadString('Person','bdate','');
        mtROOM.AsString:=   Ini.ReadString('Person','room','');
        mtGOAL.AsString:=   Ini.ReadString('Person','goal','');
        mtORG.AsString:=    Ini.ReadString('Person','evaorg','');
        mtSRC.AsString:=    lst[i];
        mt.Post;
      finally
        Ini.Free;
      end;
    end;
  finally
    grdTurn.DefaultApplySorting;
    mt.Last;
    mt.EnableControls;
  end;
end;

procedure TMain.GetAllFiles(Path, Mask: string; Lb: TStringList; All: boolean=False);
var
  sRec: TSearchRec;
  isFound: boolean;
begin
  if All then
    isFound := FindFirst( Path + '\*.*', faAnyFile, sRec ) = 0
  else
    isFound := FindFirst( Path + '\' + Mask, faAnyFile, sRec ) = 0;
  while isFound do
  begin
    if (sRec.Name <> '.') and (sRec.Name <> '..') then
    begin
      if (sRec.Attr and faDirectory) = faDirectory then
      begin
        if All then
          GetAllFiles(Path + '\' + sRec.Name, Mask, Lb, All);
      end
      else
        if not All then
          Lb.Add(Path + '\' + sRec.Name)
        else if (Mask = sRec.Name) or CheckMask(Mask, sRec.Name) then
          Lb.Add(Path + '\' + sRec.Name);
    end;
    Application.ProcessMessages;
    isFound:= FindNext(sRec) = 0;
  end;
  FindClose(sRec);
end;

function TMain.CheckMask(Mask, Name: string): boolean;

  function FindMask(sub, str: string): boolean;
  var
    i, j: Integer;
  begin
    Result:= False;
    j:= Length(sub);
    if (j > 0) and (j <= Length(str)) then
    begin
      for i := 1 to j do
      begin
        if (sub[i] <> '?') and (sub[i] <> str[i]) then
          break;
      end;
      Result:= i = j + 1;
    end;
  end;

  function FindMaskAll(sub, str: string): integer;
  var
    s: string;
    i, j, k: Integer;
  begin
    Result:= 0;
    j:= Length(sub);
    k:= Length(str)-j+1;
    if (k > 0) then
      for i := 1 to k do
      begin
        s:= copy(str,i,j);
        if FindMask(sub,s) then
        begin
          Result:= i;
          break;
        end;
      end;
  end;

var
  sub, str: string;
begin
  Result:= False;
  str:= AnsiUpperCase(trim(Name));
  sub:= AnsiUpperCase(trim(Mask));

  if (sub = '') or (trim(StringReplace(StringReplace(sub,'*','',[rfReplaceAll]),'?','',[rfReplaceAll])) = '') then
    Result:= True
  else
    if AnsiPos('?',sub) = 0 then
    begin
      if ((sub[1]<>'*') and (AnsiPos(sub, str)=1)) or
         ((sub[1]= '*') and (AnsiPos(StringReplace(sub,'*','',[]), str)>0)) then
        Result:= True;
    end
    else
      if ((sub[1]<>'*') and FindMask(sub, str)) or
         ((sub[1]= '*') and (FindMaskAll(StringReplace(sub,'*','',[]), str)>0)) then
        Result:= True;
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
  CON = 'Provider=SQLOLEDB.1;Password=%s;Persist Security Info=True;User ID=%s;Initial Catalog=%s;Data Source=%s';
var
  us, ps, ct, ds, dn, lg, tp: string;
begin
  lg:= '';

  tp := Trim(f_eva_tp);          // тип БД ms-MsSql, pg-PostGreSql
  us := Trim(f_eva_login);       // user
  ps := Trim(f_eva_password);    // password
  ct := Trim(f_eva_bd);          // имя БД ЕАВИИАС МСЭ
  ds := Trim(f_eva_ip);          // адрес MS SQL
  dn := Trim(f_eva_port);        // порт MS SQL

  if tp = 'ms' then
  begin
    if (ds <> '') and (dn <> '') then
      ds:= ds + ', ' + dn;

    if ds <> '' then
    begin
      try
        if not MSBase.Connected then
        begin
          MSBase.ConnectionString:= Format(CON,[ps,us,ct,ds]);
          MSBase.Open;     // Тест
        end;
        qReg.Close;
        qReg.Parameters.ParamByName('DT').Value:= edEvaDT.Value;
        qReg.Open;
      except
        on E: Exception do
        begin
          stStatus.Caption:= 'Ошибка подключения к ЕАВИИАС ( '+E.Message +' )';
          SaveErr(stStatus.Caption);
        end;
      end;
        Application.ProcessMessages;
    end;
  end
  else if tp = 'pg' then
  begin
    pgBase.HostName:= ds;
    pgBase.Port:= StrToIntDef(dn, 0);
    pgBase.Database:= ct;
    pgBase.User:= us;
    pgBase.Password:= ps;
    pgBase.Protocol:= 'postgresql-9';
    pgBase.LibraryLocation:= 'libpq.dll';
    try
      if not pgBase.Connected then
        pgBase.Connect;
      pgQry.Close;
      pgQry.ParamByName('DT').Value:= edEvaDT.Value;
      pgQry.Open;
    except
      on E: Exception do
      begin
        stStatus.Caption:= 'Ошибка подключения к ЕАВИИАС ( '+E.Message +' )';
        SaveErr(stStatus.Caption);
      end;
    end;
      Application.ProcessMessages;
  end;
end;

function TMain.get_ticket(dt: TDateTime): integer;
var
  i, j, k: integer;
  fnl, dnl: TStringList;
  fbk: string;
begin
  Result:= -1;
  prs_dir:= '';
  cur_dir := FDIR +'\'+FormatDateTime('yyyy-mm-dd', dt);
  fbk:= '\block';

  for i := 1 to 3 do
  begin
    if (not DirectoryExists(FDIR)) and (not CreateDir(FDIR)) then
    begin
      mvbTryConnectPath(FDIR);          // Активировать сетевой диск
      sleep(1000);
    end
    else
      break;
  end;

  if (not DirectoryExists(FDIR)) and (not CreateDir(FDIR)) then
  begin
    stStatus.Caption:=  'Нет подключения к хранилищу !';
    stStatus.Color:= clFuchsia;
    SaveErr(stStatus.Caption);
    Application.ProcessMessages;
    exit;
  end;

  if (not DirectoryExists(cur_dir)) and (not CreateDir(cur_dir)) then
  begin
    stStatus.Caption:=  'Нет возможности начать регистрацию на сегодня !';
    stStatus.Color:= clFuchsia;
    SaveErr(stStatus.Caption);
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
    stStatus.Caption:=  'Регистрация на сегодня заблокирована !';
    stStatus.Color:= clFuchsia;
    SaveErr(stStatus.Caption);
    Application.ProcessMessages;
    exit;
  end;

  if (not DirectoryExists(cur_dir+fbk)) and (not CreateDir(cur_dir+fbk)) then
  begin
    stStatus.Caption:=  'Нет возможности заблокировать папку !';
    stStatus.Color:= clFuchsia;
    SaveErr(stStatus.Caption);
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
      stStatus.Caption:=  'Нет возможности сохранить регистрацию посетителя !';
      stStatus.Color:= clFuchsia;
      Application.ProcessMessages;
      SaveErr(stStatus.Caption);
    end;
    if DirectoryExists(cur_dir+fbk) then
      RmDir(cur_dir+fbk);
    Application.ProcessMessages;
    if DirectoryExists(cur_dir+fbk) then
    begin
      stStatus.Caption:=  'Нет возможности снять блокировку папки !';
      stStatus.Color:= clFuchsia;
      Application.ProcessMessages;
      SaveErr(stStatus.Caption);
      Result:= 0;
    end;
  end;
end;

function TMain.mvbTryConnectPath(const APath: string): Boolean;
var ADrive, UNCPath: string;
    rc: TNetResource;
    ResultFlag, Size: DWORD;
begin
 ADrive := ExtractFileDrive(APath);

 Size := 0;
 WNetGetConnection(PChar(ADrive), nil, Size);
 SetLength(UNCPath, Size);
 WNetGetConnection(PChar(ADrive), PChar(UNCPath), Size);
 SetLength(UNCPath, Size - 1);

 Size := 0;
 ZeroMemory(@rc, sizeof(rc));
 rc.dwType := RESOURCETYPE_DISK;
 rc.lpLocalName := PChar(ADrive);
 rc.lpRemoteName := PChar(UNCPath);
 rc.lpProvider := nil;
 Result := WNetUseConnection(0, rc, nil, nil, 0, nil, Size, ResultFlag) = NO_ERROR;
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

procedure TMain.SaveErr(err: string = '');
var
  dt, s: string;
  lst: TStringList;
begin
  if err <> '' then
  begin
    s:= app_dir+FERR;
    lst:= TStringList.Create;
    if FileExists(s) then
      lst.LoadFromFile(s);
    try
      DateTimeToString(dt,'yyyy-mm-dd hh:nn:ss ',now);
      lst.Add(dt+err);
      lst.SaveToFile(s);
    finally
      lst.Free;
    end;
  end;
end;

procedure TMain.ExportDataSet_CSV(DS: TDataSet; Descr: string; Rep: string = '');
  function fmt_csv(ss: string): string;
  begin
    Result:= ';"' + StringReplace(ss,'"','''',[rfReplaceAll]) + '"';
  end;
var
  i: Integer;
  s: String;
  lst: TStringList;
begin
  if not Assigned(DS) then exit;
  if DS.RecordCount = 0 then exit;

  lst:= TStringList.Create;
  try
    if Rep <> '' then
      lst.Add(fmt_csv(Rep));
    s:= fmt_csv('П/Н');
    for i := 0 to DS.FieldCount - 1 do
      if DS.Fields[i].Visible then
        s:= s + fmt_csv(DS.Fields[i].DisplayLabel);
      lst.Add(s);

    DS.First;
    while not DS.Eof do
    begin
      s:= fmt_csv(IntToStr(DS.RecNo));
      for i := 0 to DS.FieldCount - 1 do
        if DS.Fields[i].Visible then
          s:= s + fmt_csv(DS.Fields[i].AsString);
      lst.Add(s);
      DS.Next;
    end;

    if FileExists(Descr) then
      DeleteFile(Descr);

    lst.SaveToFile(Descr);
  finally
    lst.Free;
  end;
end;

end.

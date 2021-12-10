unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, Vcl.ComCtrls, GridsEh,
  DBGridEh, Vcl.ExtCtrls, Data.DB, MemDB, ZAbstractRODataset, ZDataset,
  ZAbstractConnection, ZConnection, Data.Win.ADODB, SpeechLib_TLB, Vcl.OleServer;

type
  TMain = class(TForm)
    grdTurn: TDBGridEh;
    mt: TMemTable;
    ds: TDataSource;
    mtLNAME: TStringField;
    mtFNMAE: TStringField;
    mtSNAME: TStringField;
    mtROOM: TStringField;
    mtNUM: TStringField;
    mtGOAL: TStringField;
    Timer: TTimer;
    mtORG: TStringField;
    mtTIME: TStringField;
    mtINTIME: TStringField;
    pnlTurnAll: TPanel;
    mtCALL: TStringField;
    MSBase: TADOConnection;
    qReg: TADOQuery;
    pgBase: TZConnection;
    pgQry: TZReadOnlyQuery;
    pnlTurnL: TPanel;
    pnlTurnM: TPanel;
    pnlTurnR: TPanel;
    qRegNAME: TStringField;
    qRegT_ALL: TIntegerField;
    qRegT_NUM: TStringField;
    qRegDT_IN: TDateTimeField;
    qRegROOM: TStringField;
    SpVoice: TSpVoice;
    mtTYPE: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerTimer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure mtAfterScroll(DataSet: TDataSet);
    procedure pnlTurnClick(Sender: TObject);
    procedure grdTurnDrawColumnCell(Sender: TObject; var Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure grdTurnColumnsGetCellParams(Sender: TObject; EditMode: Boolean;
      Params: TColCellParamsEh);
  private
    f_dir,
    f_text_1,      // Фраза 1
    f_text_2,      // Фраза 2
    f_max_new,     // последний обработанный талон в последней итерации
    f_max_day,     // последний обработанный талон за день
    f_cdt,         // текущая дата
    f_eva_tp,      // ms-MsSql, pg-PostGreSql
    f_eva_ip,
    f_eva_bd,
    f_eva_port,
    f_eva_login,
    f_eva_password,
    f_cod_exit,
    f_cod: string; // код выхода из приложения
    f_no_sleep_F15,
    f_no_sleep_mouse: boolean;
    f_lst_tablo,            // список табло для вызова
    f_lst_key: TStringList; // список целей для отображения
    f_hour_end,    // конец рабочего дня
    f_refresh,     // интервал обновления в секундах
    f_font_cset,   // Шрифт (0-Tahoma (по умолчанию), 1-Times New Roman, 2-Arial, 3-Courier New)
    f_font_style,  // Стиль шрифта (0-обычный (по умолчанию), 1-полужирный, 2-наклонный, 3-наклонный полужирный)
    f_font_size,   // Размер шрифта (от 8 до 36, по умолчанию 26)
    f_row_height,  // Высота строки (от 20 до 150,по умолчанию 0)
    f_c_color,     // Установленная цветовая схема. 0-светлая, 1-темная, -1-ч/б скринсейвер
    f_color,       // Цветовая схема. 0-светлая, 1-темная
    f_call,        // Посылать сигнал на кабинетное табло, 0-не посылать
    f_speech,      // Использовать число голосов, 0-молчать, 1-один голос, 2-два голоса
    f_item_1,      // Номер голоса 1
    f_rate_1,      // Скорость голоса 1
    f_volume_1,    // Громкость голоса 1
    f_item_2,      // Номер голоса 2
    f_rate_2,      // Скорость голоса 2
    f_volume_2: integer; // Громкость голоса 2
    SOTokens: ISpeechObjectTokens;
    f_col: array [0..9] of string; // Колонки табло = Видимость(0 или 1),Порядок(от 0 до 9),Ширина(0-по умолчанию, от 1 до max)
    { Private declarations }
    procedure turn_refresh;// Перечитать очередь
    procedure turn_write(lst: TStringList);  // Записать очередь
    //procedure SaveDir;     // Сохраняем пути в реестр
    //procedure LoadDir;     // Считываем пути из реестра
    procedure GetAllFiles(Path: string; Lb: TStringList; All: boolean=False);
    procedure read_ini;
    procedure init_tablo;
    procedure init_col;
    procedure init_font;
    procedure init_color(tp: integer);
    function GetConLst: TDataSet;   // Вызов в кабинет из ЕАВИИАС
    function mvbTryConnectPath(const APath: string): Boolean; // Активация сетевого диска
    function new_call(qry: TDataSet; a_lst, n_lst: TStringList): boolean;
    procedure call_tablo(a_lst: TStringList);
    procedure spech_list(n_lst: TStringList);
    procedure spech_text(num, room: string);
    procedure pause(sec: word);  // p - пауза в секукндах
  public
    { Public declarations }
  end;

var
  Main: TMain;

const
{$IFDEF DEBUG}
  FDIR = 'W:\buro';   // отладке
{$ELSE}
  FDIR = 'Z:\buro';   // релиз
{$ENDIF}
  FINI = 'data.ini';
  RINI = 'room-q.ini';
  REXE = 'room-q.exe';

implementation

uses System.Win.Registry, System.IniFiles, DateUtils, StrUtils, ShellApi;

{$R *.dfm}
{
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
}
procedure TMain.TimerTimer(Sender: TObject);
begin
  // Timer.Enabled:= False;
  turn_refresh;

  f_cod:= '';

  if Main.WindowState <> wsMaximized then
    Main.WindowState:= wsMaximized;

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

procedure TMain.turn_refresh;
var
  s: string;
  lst: TStringList;
  dt: TDateTime;
begin
  pnlTurnR.Caption:= '-';
  lst:= TStringList.Create;
  try
    if not DirectoryExists(FDIR) then
    begin
      //s:= 'Папка источника ' + FDIR + ' не существует...';
      //Application.MessageBox(PChar(s), PChar('Внимание'));
      mvbTryConnectPath(FDIR);
      pnlTurnR.Caption:= 'SRC';
      exit;
    end;
//    s:= '2017-12-15';
    dt:= now;
    pnlTurnM.Caption:= FormatDateTime('dd mmm yyyy, ddd hh:nn ', dt);
    s:= FormatDateTime('yyyy-mm-dd', dt);
    if f_cdt <> s then
    begin
      // новый день
      f_cdt:= s;
      f_max_day:= '';
      mt.Close;
      mt.Open;
    end;
    f_max_new:= f_max_day;
    GetAllFiles(FDIR+'\'+f_cdt, lst, True);
    f_max_day:= f_max_new;
    grdTurn.Visible:= ((mt.RecordCount > 0) or (lst.Count > 0)) and (HourOf(now) < f_hour_end);
    if grdTurn.Visible then
    begin
      init_color(f_color);
      pnlTurnAll.Align:= alBottom;
      turn_write(lst);
    end
    else
    begin
      init_color(-1);
      pnlTurnL.Caption:= '-';
      pnlTurnR.Caption:= '-';
      if pnlTurnAll.Align = alBottom then
        pnlTurnAll.Align:= alTop
      else
        pnlTurnAll.Align:= alBottom;
    end;
    Application.ProcessMessages;
  finally
    lst.Free;
  end;
end;

procedure TMain.turn_write(lst: TStringList);
  function set_code(s_num: string; tp: integer): string;
  var dt_num: string;
  begin
    if tp = 0 then
    begin
      dt_num:= IntToStr(DayOfTheYear(date));
      Result:= RightStr('000'+dt_num, 3)+RightStr('000'+s_num, 3);
    end
    else if tp = 1 then
      Result:= RightStr('000'+s_num, 3)
  end;

var
  i, j: integer;
  Ini: Tinifile;
  s: string;
  find: boolean;
  all_lst, new_lst: TStringList;
begin
  mt.DisableControls;
  try
    for i := 0 to lst.Count - 1 do
    begin
      Ini:=TiniFile.Create(lst[i]);
      try
        find:= (f_lst_key.Count=0) or ((f_lst_key.Count=1) and (f_lst_key[0]='ALL'));
        if not find then   // фильтруем по целям
          for j := 0 to f_lst_key.Count - 1 do
          begin
            // s:= Ini.ReadString('Person','goal_id','');
            s:= Ini.ReadString('Person','goal','');
            if f_lst_key[j] = s then
            begin
              find:= True;
              break;
            end;
          end;
        if find then
        begin
          mt.Append;
          mtNUM.AsString:=   set_code(Ini.ReadString('Person','ticket',''), 1);
          mtLNAME.AsString:= Ini.ReadString('Person','lname','');
          mtFNMAE.AsString:= Ini.ReadString('Person','fname','');
          mtSNAME.AsString:= Ini.ReadString('Person','sname','');
          mtROOM.AsString:=  Ini.ReadString('Person','room','');
          mtTIME.AsString:=  Ini.ReadString('Person','evatime','');
          mtINTIME.AsString:=Ini.ReadString('Person','intime','');
          mtORG.AsString:=   Ini.ReadString('Person','evaorg','');
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
        end;
      finally
        Ini.Free;
      end;
    end;
  finally
    mt.Last;
    mt.EnableControls;
    Application.ProcessMessages;
  end;

  all_lst:= TStringList.Create;
  new_lst:= TStringList.Create;
  try
    new_call(GetConLst, all_lst, new_lst);
    if (f_call = 1) then
      call_tablo(all_lst);
    if (f_speech in [1,2]) and (new_lst.Count > 0) then
      spech_list(new_lst);
  finally
    all_lst.Free;
    new_lst.Free;
  end;

end;

function TMain.new_call(qry: TDataSet; a_lst, n_lst: TStringList): boolean;
var
  cur_rn: integer;
  old_num, cur_num, cur_room: string;
begin
  Result:=(qry<>nil) and (qry.RecordCount>0);
  mt.DisableControls;
  try
    old_num :='';
    cur_num :='';
    cur_room:='';
    a_lst.Clear;
    n_lst.Clear;
    if (qry<>nil) and (qry.RecordCount>0) and (mt.Active) and (mt.RecordCount>0) then
    begin
      qry.First;
      while not qry.Eof do
      begin
        cur_num:= trim(qry.FieldByName('T_NUM').AsString);
        cur_room:= trim(qry.FieldByName('ROOM').AsString);
        a_lst.Add(cur_room + '=' + cur_num);
        if (old_num <> cur_num) and mt.Locate('NUM', cur_num, []) then
        begin
          old_num:= cur_num;
          if ((mtCALL.AsString <> cur_room) or
             ((mtCALL.AsString = cur_room) and (mtTYPE.AsInteger = 2))) then
          begin
            cur_rn:= mt.RecNo;
            mt.Edit;
            mtTYPE.AsInteger:= 1;
            mtCALL.AsString:= cur_room;
            mt.Post;
            n_lst.Add(cur_num + '=' + cur_room);
            mt.First;
            while not mt.Eof do
            begin
              if (mt.RecNo <> cur_rn) and (mtCALL.AsString = cur_room) then
              begin
                mt.Edit;
                mtTYPE.AsInteger:= 2;
                mt.Post;
              end;
              mt.Next;
            end;
          end;
        end;
{
        if (old_num <> cur_num) and
            mt.Locate('NUM', cur_num, []) and
          ((mtCALL.AsString <> cur_room) or
          ((mtCALL.AsString = cur_room) and (mtTYPE.AsInteger = 2))) then
        begin
          old_num:= cur_num;
          cur_rn:= mt.RecNo;
          mt.Edit;
          mtTYPE.AsInteger:= 1;
          mtCALL.AsString:= cur_room;
          mt.Post;
          n_lst.Add(cur_num + '=' + cur_room);
          mt.First;
          while not mt.Eof do
          begin
            if (mt.RecNo <> cur_rn) and (mtCALL.AsString = cur_room) then
            begin
              mt.Edit;
              mtTYPE.AsInteger:= 2;
              mt.Post;
            end;
            mt.Next;
          end;
        end;
}
        qry.Next;
      end;
    end;
  finally
    mt.Last;
    mt.EnableControls;
    Application.ProcessMessages;
  end;
end;

procedure TMain.call_tablo(a_lst: TStringList);
var
  i, j: integer;
  num, room: string;
begin
  for i := 0 to f_lst_tablo.Count - 1 do
  begin
    num:= '---';
    room:= trim(f_lst_tablo.Values[f_lst_tablo.Names[i]]);
    room:= trim(copy(room,1,pos(':',room)-1));
    j:= a_lst.IndexOfName(room);
    if j >= 0 then
      num:= a_lst.Values[a_lst.Names[j]];
    ShellExecute(handle, 'open', PChar(f_dir+REXE), PChar(room + ' ' + num), nil, SW_HIDE);
  end;
end;

procedure TMain.spech_list(n_lst: TStringList);
var i: integer;
begin
  for i := 0 to n_lst.Count - 1 do
  begin
    spech_text(n_lst.Names[i],n_lst.Values[n_lst.Names[i]]);
  end;
end;

procedure TMain.spech_text(num, room: string);
var sp_text: string;
begin
  num:=  IntToStr(StrToIntDef(num , 0));
  if (num <> '0') and (f_speech in [1,2]) then
  begin
    if (f_text_1 <> '') and (f_item_1 >= 0) and (SOTokens.Count > f_item_1) then
    begin
      SpVoice.Voice := SOTokens.Item(f_item_1);
      SpVoice.Rate:=  f_rate_1;
      SpVoice.Volume:= f_volume_1;
      Beep;
      pause(1);
      sp_text:= StringReplace(StringReplace(f_text_1,'%n',num,[]),'%k',room,[]);
      SpVoice.Speak(sp_text, SVSFDefault {SVSFlagsAsync});
    end;
    if (f_speech = 2) and (f_text_2 <> '') and (f_item_1 >= 0) and (SOTokens.Count > f_item_2) then
    begin
      SpVoice.Voice := SOTokens.Item(f_item_2);
      SpVoice.Rate:=  f_rate_2;
      SpVoice.Volume:= f_volume_2;
      Beep;
      pause(1);
      sp_text:= StringReplace(StringReplace(f_text_2,'%n',num,[]),'%k',room,[]);
      SpVoice.Speak(sp_text, SVSFDefault {SVSFlagsAsync});
    end;
  end;
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // SaveDir;
  f_lst_key.Free;
  f_lst_tablo.Free;
end;

procedure TMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:= false;
  if Application.MessageBox('Завершить работу?', 'Внимание', MB_OKCANCEL) <> IDOK then Exit;
  CanClose:= true;
end;

procedure TMain.FormCreate(Sender: TObject);
begin
  f_dir := ExtractFilePath(Application.ExeName);
  //Ensure all events fire
  SpVoice.EventInterests := SVEAllEvents;
  SOTokens := SpVoice.GetVoices('', '');
{
  for i := 0 to SOTokens.Count - 1 do
  begin
    //For each voice, store the descriptor in the TStrings list
    cbVoices.Items.Add(SOTokens.Item(i).GetDescription(0));
    //Increment descriptor reference count to ensure it's not destroyed
  end;
  if cbVoices.Items.Count > 0 then
  begin
    cbVoices.ItemIndex := 0; //Select 1st voice
    cbVoices.OnChange(cbVoices); //& ensure OnChange triggers
  end;
}
end;

procedure TMain.FormShow(Sender: TObject);
begin
  // LoadDir;
  f_c_color:= 999;
  read_ini;
  Timer.Enabled:= True;
end;
{
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
}
procedure TMain.mtAfterScroll(DataSet: TDataSet);
begin
  if DataSet.RecordCount > 0 then
    pnlTurnL.Caption:= IntToStr(DataSet.RecordCount)
  else
    pnlTurnL.Caption:= '-';
end;

procedure TMain.pnlTurnClick(Sender: TObject);
begin
  f_cod:= f_cod + Chr(Ord('0') + TPanel(Sender).Tag);
  if f_cod = f_cod_exit then
    Close;
end;

procedure TMain.read_ini;
var
  s: string;
  Ini: Tmeminifile;
begin
  f_lst_tablo:= TStringList.Create;
  if FileExists(f_dir + REXE) and FileExists(f_dir + RINI) then
  begin
    Ini:= Tmeminifile.Create(f_dir + RINI);
    try
      Ini.ReadSectionValues('tablo', f_lst_tablo);
    finally
      Ini.Free;
    end;
  end;

  s:= ChangeFileExt(Application.ExeName, '.ini');
  if FileExists(s) then
  begin
    Ini:= Tmeminifile.Create(s); //, TEncoding.Unicode);
    try
      f_lst_key:= TStringList.Create;
      f_lst_key.Text:= AnsiUpperCase(
        StringReplace(trim(Ini.ReadString('Goal','key','')), ',', #13#10, [rfReplaceAll])
        );

      grdTurn.Columns.ColumnByFieldName('GOAL').Visible:= (f_lst_key.Count=0) or
        ((f_lst_key.Count=1) and (f_lst_key[0]='ALL'));

      f_eva_tp        := Ini.ReadString ('EVA','eva_tp','');
      f_eva_ip        := Ini.ReadString ('EVA','eva_ip','');
      f_eva_bd        := Ini.ReadString ('EVA','eva_bd','');
      f_eva_port      := Ini.ReadString ('EVA','eva_port','');
      f_eva_login     := Ini.ReadString ('EVA','eva_login','');
      f_eva_password  := Ini.ReadString ('EVA','eva_password','');

      f_font_cset     := Ini.ReadInteger('Tablo','font_cset',0);
      f_font_style    := Ini.ReadInteger('Tablo','font_style',0);
      f_font_size     := Ini.ReadInteger('Tablo','font_size',26);
      f_row_height    := Ini.ReadInteger('Tablo','row_height',0);
      f_color         := Ini.ReadInteger('Tablo','color',0);

      f_col[0]        := Ini.ReadString ('Tablo','col_0','');
      f_col[1]        := Ini.ReadString ('Tablo','col_1','');
      f_col[2]        := Ini.ReadString ('Tablo','col_2','');
      f_col[3]        := Ini.ReadString ('Tablo','col_3','');
      f_col[4]        := Ini.ReadString ('Tablo','col_4','');
      f_col[5]        := Ini.ReadString ('Tablo','col_5','');
      f_col[6]        := Ini.ReadString ('Tablo','col_6','');
      f_col[7]        := Ini.ReadString ('Tablo','col_7','');
      f_col[8]        := Ini.ReadString ('Tablo','col_8','');
      f_col[9]        := Ini.ReadString ('Tablo','col_9','');

      f_no_sleep_F15  := Ini.ReadInteger('Sys','no_sleep_f15',0) = 1;
      f_no_sleep_mouse:= Ini.ReadInteger('Sys','no_sleep_mouse',0) = 1;
      f_refresh       := Ini.ReadInteger('Sys','refresh',15);
      f_hour_end      := Ini.ReadInteger('Sys','hour_end',17);
      f_cod_exit      := Ini.ReadString ('Sys','cod_exit','01');
      f_call          := Ini.ReadInteger('Sys','call',0);
      f_speech        := Ini.ReadInteger('Sys','speech',0);

      f_text_1        := Ini.ReadString ('Speech','text_1','');
      f_item_1        := Ini.ReadInteger('Speech','item_1',0);
      f_rate_1        := Ini.ReadInteger('Speech','rate_1',0);
      f_volume_1      := Ini.ReadInteger('Speech','volume_1',100);

      f_text_2        := Ini.ReadString ('Speech','text_2','');
      f_item_2        := Ini.ReadInteger('Speech','item_2',0);
      f_rate_2        := Ini.ReadInteger('Speech','rate_2',0);
      f_volume_2      := Ini.ReadInteger('Speech','volume_2',100);

      if (f_call > 0) and (f_lst_tablo.Count = 0) then
        f_call:= 0;

      init_tablo;
      Timer.Interval:= f_refresh * 1000;
    finally
      Ini.Free;
    end;
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
        if (str = sub) and (Path > f_max_day) then
        begin
          Lb.Add(Path + '\' + sRec.Name);
          if Path > f_max_new then
            f_max_new:= Path;
        end;
      end;
    end;
    Application.ProcessMessages;
    isFound:= FindNext(sRec) = 0;
  end;
  FindClose(sRec);
end;

procedure TMain.init_tablo;
begin
  init_font;
  init_col;
  init_color(f_color);
end;

procedure TMain.init_font;
var i: integer;
begin
{
  f_font_cset     := Ini.ReadInteger('Sys','font',0);
  f_font_style    := Ini.ReadInteger('Sys','font',0);
  f_font_size     := Ini.ReadInteger('Sys','font',26);
  f_row_height    := Ini.ReadInteger('Sys','font',0);
}
  // Шрифт (0-Tahoma (по умолчанию), 1-Times New Roman, 2-Arial, 3-Courier New)
 case f_font_cset of
    1: begin
         Main.Font.Charset:= RUSSIAN_CHARSET;
         Main.Font.Name:= 'Times New Roman';
         grdTurn.Font.Charset:= RUSSIAN_CHARSET;
         grdTurn.Font.Name:= 'Times New Roman';
         grdTurn.TitleFont.Charset:= RUSSIAN_CHARSET;
         grdTurn.TitleFont.Name:= 'Times New Roman';
       end;
    2: begin
         Main.Font.Charset:= RUSSIAN_CHARSET;
         Main.Font.Name:= 'Arial';
         grdTurn.Font.Charset:= RUSSIAN_CHARSET;
         grdTurn.Font.Name:= 'Arial';
         grdTurn.TitleFont.Charset:= RUSSIAN_CHARSET;
         grdTurn.TitleFont.Name:= 'Arial';
       end;
    3: begin
         Main.Font.Charset:= RUSSIAN_CHARSET;
         Main.Font.Name:= 'Courier New';
         grdTurn.Font.Charset:= RUSSIAN_CHARSET;
         grdTurn.Font.Name:= 'Courier New';
         grdTurn.TitleFont.Charset:= RUSSIAN_CHARSET;
         grdTurn.TitleFont.Name:= 'Courier New';
       end;
    else
    begin
      Main.Font.Charset:= DEFAULT_CHARSET;
      Main.Font.Name:= 'Tahoma';
      grdTurn.Font.Charset:= DEFAULT_CHARSET;
      grdTurn.Font.Name:= 'Tahoma';
      grdTurn.TitleFont.Charset:= DEFAULT_CHARSET;
      grdTurn.TitleFont.Name:= 'Tahoma';
    end;
  end;

  // Стиль шрифта (0-обычный (по умолчанию), 1-полужирный, 2-наклонный, 3-наклонный полужирный)
  case f_font_style of
    1: grdTurn.Font.Style:= [fsBold];
    2: grdTurn.Font.Style:= [fsItalic];
    3: grdTurn.Font.Style:= [fsBold,fsItalic];
    else
    begin
      grdTurn.Font.Style:= [];
    end;
  end;

  // Размер шрифта (от 8 до 72, по умолчанию 26)
  if f_font_size < 8 then
    f_font_size:= 8;
  if f_font_size > 72 then
    f_font_size:= 72;
  Main.Font.Size:= f_font_size;
  grdTurn.Font.Size:= f_font_size;
  grdTurn.TitleFont.Size:= f_font_size;
  for i := 0 to grdTurn.Columns.Count - 1 do
    grdTurn.Columns[i].Width:= grdTurn.Columns[i].Width*f_font_size div 26;
  pnlTurnAll.Height:= trunc(pnlTurnAll.Height*sqrt(f_font_size/26));

  // Высота строки (от 20 до 150, по умолчанию 0)
  if f_row_height <> 0 then
  begin
    if f_row_height < 20 then
      f_row_height:= 20;
    if f_row_height > 150 then
      f_row_height:= 150;
  end;
  grdTurn.RowHeight:= f_row_height;
end;

procedure TMain.init_col;
var
  lst, c_ord: TStringList;
  i, j, k: integer;
begin
  lst:= TStringList.Create;
  c_ord:= TStringList.Create;
  c_ord.Sorted:=True;
  try
    grdTurn.AutoFitColWidths:= False;
    for i := 0 to grdTurn.Columns.Count - 1 do
    begin
      grdTurn.Columns[i].AutoFitColWidth:= False;
      mt.FieldByName(grdTurn.Columns[i].FieldName).Visible:= False;
      if i < Length(f_col)  then
      begin
        lst.Text:= StringReplace(f_col[i],',',#13#10,[rfReplaceAll]);
        // видимость колонки
        mt.FieldByName(grdTurn.Columns[i].FieldName).Visible:= StrToIntDef(trim(lst[0]),1) = 1;
        if mt.FieldByName(grdTurn.Columns[i].FieldName).Visible then
        begin
          // запоминаем порядок колонок
          k:= StrToIntDef(trim(lst[1]),i);
          c_ord.Add(Format('%d=%d',[k,grdTurn.Columns[i].Tag]));
          // ширина колонки
          k:= 0;
          if trim(lst[2]) = 'max' then
          begin
            if not grdTurn.AutoFitColWidths then
              grdTurn.AutoFitColWidths:= True;
            grdTurn.Columns[i].AutoFitColWidth:= True;
          end
          else
            k:= StrToIntDef(trim(lst[2]),0);
          if k > 0 then
            grdTurn.Columns[i].Width:= k;
        end;
      end;
    end;
    // выставляем порядок колонок
    for i := 0 to c_ord.Count - 1 do
    begin
      k:= StrToInt(c_ord.ValueFromIndex[i]);
      for j := 0 to grdTurn.Columns.Count - 1 do
        if grdTurn.Columns[j].Tag = k then
          grdTurn.Columns[j].Index:= i;
    end;
  finally
    lst.Free;
    c_ord.Free;
  end;
end;

procedure TMain.init_color(tp: integer);
begin
  if f_c_color <> tp then
  begin
    if tp = -1 then
    begin
      Main.Color:= clBlack;
      Main.Font.Color:= clWhite;
    end
    else
    if tp = 0 then
    begin
      Main.Color:= clBtnFace;
      Main.Font.Color:= clBlack;
      grdTurn.Font.Color:= clBlack;
      grdTurn.EvenRowColor:= clBtnFace;
      grdTurn.OddRowColor := clWhite;
    end
    else
    if tp = 1 then
    begin
      Main.Color:= clNavy;
      Main.Font.Color:= clYellow;
      grdTurn.Font.Color:= clYellow;
      grdTurn.EvenRowColor:= clBlue;
      grdTurn.OddRowColor := clNavy;
    end;
    Main.Refresh;
    Application.ProcessMessages;

    f_c_color:= tp;
  end;
end;

function TMain.GetConLst: TDataSet;
const
  CON = 'Provider=SQLOLEDB.1;Password=%s;Persist Security Info=True;User ID=%s;Initial Catalog=%s;Data Source=%s';
var
  us, ps, ct, ds, dn, lg, tp: string;
begin
  Result:= nil;
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
        qReg.Open;
        Result:= qReg;
      except
        on E: Exception do
        begin
          pnlTurnR.Caption:= 'MS';
          //SaveErr(E.Message);
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
      pgQry.Open;
      Result:= pgQry;
    except
      on E: Exception do
      begin
        pnlTurnR.Caption:= 'PG';
        //SaveErr(E.Message);
      end;
    end;
      Application.ProcessMessages;
  end;
end;

procedure TMain.grdTurnColumnsGetCellParams(Sender: TObject; EditMode: Boolean;
  Params: TColCellParamsEh);
begin
  Params.Text := ' ' + Params.Text;
end;

procedure TMain.grdTurnDrawColumnCell(Sender: TObject; var Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if Column.FieldName = 'CALL' then
    if mtTYPE.AsInteger = 1 then
      TDbGridEh(Sender).Canvas.Font.Color:= clRed
    else
      TDbGridEh(Sender).Canvas.Font.Color:= clActiveCaption;
  TDbGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
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

procedure TMain.pause(sec: word);  // p - пауза в секукндах
var
  i, pt: Integer;
begin
  pt:= sec * 100;
  for i := 1 to pt do
  begin
    Application.ProcessMessages;
    sleep(10);
  end;
end;

end.

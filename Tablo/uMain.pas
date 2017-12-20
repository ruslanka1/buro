unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, Vcl.ComCtrls, GridsEh,
  DBGridEh, Vcl.ExtCtrls, Data.DB, MemDB;

type
  TMain = class(TForm)
    pnlTurn: TPanel;
    grdTurn: TDBGridEh;
    sbTurn: TStatusBar;
    mt: TMemTable;
    ds: TDataSource;
    mtLNAME: TStringField;
    mtFNMAE: TStringField;
    mtSNAME: TStringField;
    mtROOM: TStringField;
    mtNUM: TStringField;
    mtGOAL: TStringField;
    Timer: TTimer;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mtAfterScroll(DataSet: TDataSet);
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
    procedure turn_refresh;// Перечитать очередь
    procedure turn_write(lst: TStringList);  // Записать очередь
    procedure SaveDir;     // Сохраняем пути в реестр
    procedure LoadDir;     // Считываем пути из реестра
    procedure GetAllFiles(Path: string; Lb: TStringList; All: boolean=False);
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

uses System.Win.Registry, System.IniFiles;

{$R *.dfm}

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

procedure TMain.TimerTimer(Sender: TObject);
begin
  // Timer.Enabled:= False;
  turn_refresh;
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
      s:= 'Папка источника ' + FDIR + ' не существует...';
      Application.MessageBox(PChar(s), PChar('Внимание'));
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

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveDir;
end;

procedure TMain.FormShow(Sender: TObject);
begin
  LoadDir;
  Timer.Enabled:= True;
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

procedure TMain.mtAfterScroll(DataSet: TDataSet);
begin
  sbTurn.Panels[0].Text:= Format('%d : %d', [DataSet.RecNo, DataSet.RecordCount]);
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

end.

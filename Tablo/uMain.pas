unit uMain;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

{$IFDEF MSWINDOWS}
uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Controls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Graphics, Vcl.Forms, Vcl.Dialogs,
  DBGridEhGrouping, GridsEh,
  DBGridEh,
  Data.DB, MemDB;
{$ENDIF}
{$IFDEF UNIX}
uses
  SysUtils, Variants, Classes,
  Controls, ComCtrls, ExtCtrls,
  Graphics, Forms, Dialogs,
//  DBGridEhGrouping, GridsEh,
//  DBGridEh,
  DBGrids,
  MemDS,
  DB
//  , MemDB
  ;
{$ENDIF}

type

  { TMain }

  TMain = class(TForm)
    grData: TDBGrid;
    pnlTurn: TPanel;
    sbTurn: TStatusBar;
    {$IFDEF MSWINDOWS}
    grdTurn: TDBGridEh;
    mt: TMemTable;
    {$ENDIF}
    {$IFDEF UNIX}
    grdTurn: TDBGrid;
    mt: TMemDataset;
    {$ENDIF}
    ds: TDataSource;
    mtLNAME: TStringField;
    mtFNAME: TStringField;
    mtSNAME: TStringField;
    mtROOM: TStringField;
    mtNUM: TStringField;
    mtGOAL: TStringField;
    Timer: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mtAfterOpen(DataSet: TDataSet);
    procedure mtAfterScroll(DataSet: TDataSet);
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
    procedure turn_refresh;// Перечитать очередь
    procedure turn_write(lst: TStringList);  // Записать очередь
    procedure collectInifileNames(Path: string; Lb: TStringList; All: boolean=False);
  public
    { Public declarations }
  end;

var
  Main: TMain;

const
  {$IFDEF MSWINDOWS}
  FDIR = 'Z:\buro';
  {$ENDIF}
  {$IFDEF UNIX}
  FDIR = './buro';
  {$ENDIF}
  FINI = 'data.ini';
  FIMG = 'data.jpg';

implementation

uses
{$IFDEF MSWINDOWS}
  System.Win.Registry, System.IniFiles;
{$ENDIF}
{$IFDEF UNIX}
//  System.Win.Registry,
  IniFiles
{$ENDIF}
  , uConfig
  ;

{$IFnDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}

procedure TMain.FormCreate(Sender: TObject);
begin
  config.Main := Self;
  config.Load
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  Timer.Enabled := False;
  config.Save;

  //DEBUG:
  //mt.SaveToFile (config.AppName + '.mds');
  //

  Action := caFree
end;

procedure TMain.mtAfterOpen(DataSet: TDataSet);
begin
  //HACK: field related variable are all nil after DataSet.Open, so:
  if mtNUM = nil then
  begin
    mtNUM   := DataSet.FieldByName ('mtNUM'  ) as TStringField;
    mtLNAME := DataSet.FieldByName ('mtLNAME') as TStringField;
    mtFNAME := DataSet.FieldByName ('mtFNAME') as TStringField;
    mtSNAME := DataSet.FieldByName ('mtSNAME') as TStringField;
    mtROOM  := DataSet.FieldByName ('mtROOM' ) as TStringField;
    mtGOAL  := DataSet.FieldByName ('mtGOAL' ) as TStringField;
  end
end;

procedure TMain.FormShow(Sender: TObject);
begin
  Timer.Interval := config.Interval * 1000;
  Timer.Enabled  := True;
end;

procedure TMain.TimerTimer(Sender: TObject);
begin
  Timer.Enabled := False;

  sbTurn.Panels[0].Text := FormatDateTime ('  hh:nn:ss', Now());
  Application.ProcessMessages;

  turn_refresh;

  Timer.Enabled := True
end;

procedure TMain.turn_refresh;
var
  path: String;
  s   : String;
  allFiles : TStringList;
begin
  mt.Clear (False);

  path := config.Storage + '\' + FormatDateTime ('yyyy-mm-dd', Date ()) ;
  path := SetDirSeparators (path);
  if not DirectoryExists (path) then
  begin
//    s := 'Папка источника ' + path + ' не существует...';
    s := '(?) Нет папки ' + path + ' ...';
    {
    Application.MessageBox ( PChar(s), PChar('Внимание') );
    }

    if sbTurn.Panels.Count < 1 then
    begin
      sbTurn.SimplePanel := False;
      sbTurn.Panels.Add;
      sbTurn.Panels.Add;
    end;
    sbTurn.Panels[1].Text := s;

//    sbTurn.SimpleText := FormatDateTime ('  hh:nn:ss  |  ', Now()) + s;

    Application.ProcessMessages;


//    ShowMessage ( Format ('mt record count: %d', [mt.RecordCount]) );

    if mt.RecordCount = 0 then begin
      mt.AppendRecord (['(0)']);
      mt.AppendRecord (['(0)']);
      mt.AppendRecord (['(0)']);
      Exit
    end
    ;

    mt.First;
    mt.Next;

    mt.Edit;
    {
     mt.FieldByName('mtNUM').AsInteger := -777;
     mt.FieldByName('mtLNAME').AsString := s;
    }
    mtNUM.AsInteger  := -777;
    // mtNUM.AsString   := Format ('%d', [-1]);
    mtLNAME.AsString := s;
    mt.Post;

    Exit
  end;

  allFiles := TStringList.Create;
  try
    collectInifileNames (path, allFiles, True);
    turn_write (allFiles);

  finally
    allFiles.Free
  end
end;

type
  AString = array of String;

function Explode_0 (separator: String; s: String): AString;
var
  a: AString;
  t: String;
  k, kk: Integer;
begin
  kk := 1;
  k  := Pos (separator, s);
  while k > 0 do
  begin
    t := Copy (s, kk   , k - kk);
    s := Copy (s, k + 1, Length (s));
    SetLength (a, Length (a) + 1);
    a[High(a)] := t;
    k := Pos (separator, s);
  end;

  Result := a
end;

function Explode (separator: String; s: String): AString;
var
  t: String;
  k, kk: Integer;
begin
  kk := 1;
  k  := Pos (separator, s);
  while k > 0 do
  begin
    t := Copy (s, kk   , k - kk);
    s := Copy (s, k + 1, Length (s));
    SetLength (Result, Length (Result) + 1);
    Result[High(Result)] := t;
    k := Pos (separator, s);
  end;
end;

function getTicketId_0 (path: String): String;
var
  st : TStringList;
begin
  st := TStringList.Create;
  try
    st.Text := StringReplace (path, '\', #13#10, [rfReplaceAll]);
    Result  := st[st.Count - 2];

  finally
    st.Free
  end
end;

function getTicketId (path: String): String;
var
  id    : String;
  parts : AString;
begin
  id     := ExtractFilePath (path);
  parts  := Explode ('/', id);
  Result := parts [High(parts)];
end;

procedure TMain.turn_write(lst: TStringList);
var
  i  : Integer;
  Ini: Tinifile;
  id : String;
  T  : Integer;
begin
  T  := lst.Count;

  if T = 0 then
  begin
    sbTurn.Panels[1].Text := 'Очередь пуста';
    Exit
  end;

  try
    mt.DisableControls;

    {
     mt.Close;
     mt.Open;
    }

    for i := 0 to T - 1 do
    begin
      id  := getTicketId (lst[i]);
      Ini := TiniFile.Create (lst[i]);
      try
        mt.Append;
        mtNUM.AsString   := id ;
        mtLNAME.AsString := Ini.ReadString ('Person', 'lname', '');
        mtFNAME.AsString := Ini.ReadString ('Person', 'fname', '');
        mtSNAME.AsString := Ini.ReadString ('Person', 'sname', '');
        mtROOM.AsString  := Ini.ReadString ('Person', 'room' , '');
        mtGOAL.AsString  := Ini.ReadString ('Person', 'goal' , '');
        mt.Post;
{
        Ini.ReadString ('Person', 'docser', '');
        Ini.ReadString ('Person', 'docnum', '');
        Ini.ReadString ('Person', 'fname' , '');
        Ini.ReadString ('Person', 'lname' , '');
        Ini.ReadString ('Person', 'sname' , '');
        Ini.ReadString ('Person', 'sex'   , '');
        Ini.ReadDate   ('Person', 'bdate' , date);
        Ini.ReadString ('Person', 'bplase', '');
        Ini.ReadString ('Person', 'whdoc' , '');
        Ini.ReadDate   ('Person', 'dtdoc' , date);
        Ini.ReadString ('Person', 'coddoc', '');
        Ini.ReadString ('Person', 'mail'  , '');
        Ini.ReadString ('Person', 'room'  , '');
        Ini.ReadString ('Person', 'ticket', '');
        Ini.ReadString ('Person', 'old'   , '');
        Ini.ReadString ('Person', 'goal'  , '');
}

        mt.EnableControls;

        sbTurn.Panels[1].Text := Format ('Всего в очереди: %d', [T]);

      finally
    //    st.Free;
        Ini.Free
      end
    end

  finally
  end
end;

procedure TMain.mtAfterScroll(DataSet: TDataSet);
begin
  sbTurn.Panels[0].Text:= Format('%d : %d', [DataSet.RecNo, DataSet.RecordCount]);
end;

procedure TMain.collectInifileNames(Path: string; Lb: TStringList; All: Boolean = False);
var
  sub, str: string;
  dir    : TSearchRec;
  ok      : Boolean;

  function Mask(Path: String): String;
  begin
    {$IFDEF MSWINDOWS}
    Mask := Path + '*.*';
    {$ENDIF}
    {$IFDEF UNIX}
    Mask := Path + '*';
    {$ENDIF}
  end;

begin
  Path := SetDirSeparators ( Path + '\' );

  ok := FindFirst ( Mask (Path), faAnyFile, dir ) = 0;
  while ok do
  begin
    if (dir.Name = '.') or (dir.Name = '..') then
    begin
      ok := FindNext (dir) = 0;
      continue
    end;

    if (dir.Attr and faDirectory) = faDirectory then
    begin
      if All then
        collectInifileNames ( Path + dir.Name, Lb, All );

      ok := FindNext (dir) = 0;
      continue
    end;

    str := AnsiUpperCase (trim (dir.Name));
    sub := AnsiUpperCase (FINI);
    if str = sub then
      Lb.Add (Path + dir.Name);

    Application.ProcessMessages;

    ok := FindNext (dir) = 0
  end;

  FindClose (dir);
end;

end.

unit uConfig;
//
// Application configuration object.
//
// ShVV 2017-12-21
//

{$mode delphi}

interface

uses
  Classes, Forms
//  , FileUtil
  ;

type

  { Tconfig }

  Tconfig = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
    IniFileName : String;

  public
    { public declarations }

    Main    : TForm;

    AppName : String;
    HomeDir : String;
    IniDir  : String;

    Interval: Integer;

    Storage : String; // path to visit storage

    function Load (): Boolean;
    function Save (): Boolean;
  end;

var
  config: Tconfig;

implementation

uses
  SysUtils
{$IFDEF MSWINDOWS}
  , System.Win.Registry
{$ENDIF}
{$IFDEF UNIX}
  , Inifiles
{$ENDIF}
  ;

{$R *.lfm}

function IfThen (ok: Boolean; ifTrue, ifFalse: TWindowState): TWindowState;
begin
  if (ok)
  then  Result := ifTrue
  else  Result := ifFalse
end;

{ Tconfig }

const
  Core       = 'CoreSettings';
  MyPosition = 'MainWindow';

procedure Tconfig.DataModuleCreate(Sender: TObject);
var
  ExeName  : String;
  CoreName : String;
  path     : String;
  name     : String;
begin
  Main    := nil;

  ExeName := Application.ExeName;
  AppName := ChangeFileExt (ExeName, '');

  {$IFDEF MSWINDOWS}
//  HomeDir := GetEnvironmentVariable ('HOMEDRIVE')
//           + GetEnvironmentVariable ('HOMEPATH');
  HomeDir := GetEnvironmentVariable ('USERPROFILE');
  Storage := HomeDir + '/buro/';
  {$ENDIF}
  {$IFDEF UNIX}
  HomeDir := GetEnvironmentVariable ('HOME');
  Storage := HomeDir + '/.local/buro/';
  {$ENDIF}

  IniFileName := '';

  CoreName    := AppName + '.ini';

  {$IFDEF MSWINDOWS}
  path := GetEnvironmentVariable ('APPDATA') + '\' + AppName + '\';
  {$ENDIF}
  {$IFDEF UNIX}
  path := HomeDir + '/.config/' + AppName + '/';
  {$ENDIF}
  name := path + CoreName;
  if FileExists (name) then
     IniFileName := name;

  if not (IniFileName = '') then
     Exit;

  {$IFDEF MSWINDOWS}
  path := HomeDir;
  {$ENDIF}
  {$IFDEF UNIX}
  path := HomeDir;
  {$ENDIF}
  name := path + CoreName;
  if FileExists (name) then
     IniFileName := name;

  if not (IniFileName = '') then
     Exit;

  name := CoreName;
  if FileExists (name) then
    IniFileName := name;

  Interval:= 15;
end;

{$IFDEF MSWINDOWS}
function Tconfig.Load(): Boolean;
var
  Reg   : TRegIniFile;
  isMax : Boolean;
begin
  Result := False;
  // Считываем пути из реестра
  Reg:= TRegIniFile.Create('Software');
  try
    Reg.OpenKey(ExtractFileName(ParamStr(0)), true);
    isMax :=  1 = Reg.ReadInteger (Name, 'Max', 0);
    Main.WindowState := IfThen ( isMax, wsMaximized, wsNormal );
    Main.Left:=    Reg.ReadInteger(Name, 'Left',   Main.Left);
    Main.Top:=     Reg.ReadInteger(Name, 'Top',    Main.Top);
    Main.Height:=  Reg.ReadInteger(Name, 'Height', Main.Height);
    Main.Width:=   Reg.ReadInteger(Name, 'Width',  Main.Width);

    Interval   :=  Reg.ReadInteger(Name, 'Interval',  15 );

    Storage    :=  Reg.ReadString (Name, 'Path',    Storage );

    Result := True;

  finally
    Reg.Free;
  end;
end;

function Tconfig.Save(): Boolean;
var Reg: TRegIniFile;
begin
  Result := False;
  // Сохраняем пути в реестр
  Reg := TRegIniFile.Create ('Software');
  try
    Reg.OpenKey ( ExtractFileName (ParamStr (0)), true );
    Reg.WriteInteger (Name, 'Max',    Ord (Main.WindowState = wsMaximized));
    Reg.WriteInteger (Name, 'Left',   Main.Left);
    Reg.WriteInteger (Name, 'Top',    Main.Top);
    Reg.WriteInteger (Name, 'Height', Main.Height);
    Reg.WriteInteger (Name, 'Width',  Main.Width);

    Reg.WriteInteger (Name, 'Interval',  Interval);

    Reg.WriteString  (Name, 'Path'    ,  Storage);

    Result := True;

  finally
    Reg.Free;
  end;
end;
{$ENDIF}

{$IFDEF UNIX}
function Tconfig.Load(): Boolean;
var
  isMax : Boolean;
begin
  Result := False;

  if IniFileName = '' then
     Exit;

  // Считываем пути
  with TInifile.Create (IniFileName) do
  try
//    MyIni.ReadString  ('Person' , 'FirstName'    , '');
//    MyIni.ReadBool    ('Desktop', 'TileWallpaper', True);
//    MyIni.ReadInteger ('Intl'   , 'iCountry'     , 1);

    isMax :=  1 = ReadInteger (MyPosition, 'Max', 0);
    Main.WindowState := IfThen ( isMax, wsMaximized, wsNormal );
    Main.Left  := ReadInteger (MyPosition, 'Left',   Main.Left  );
    Main.Top   := ReadInteger (MyPosition, 'Top',    Main.Top   );
    Main.Height:= ReadInteger (MyPosition, 'Height', Main.Height);
    Main.Width := ReadInteger (MyPosition, 'Width',  Main.Width );

    Interval   := ReadInteger ('Timer', 'Interval',  15 );

    Storage    := ReadString  ('Storage', 'Path',    Storage );

    Result := True;

  finally

  end;
end;

function Tconfig.Save(): Boolean;
begin
  Result := False;

  if IniFileName = '' then
     IniFileName := AppName + '.ini';

  // Сохраняем пути
  with TInifile.Create (IniFileName) do
  try
//    MyIni.WriteString (Core, 'IniDir', IniDir);

    WriteInteger (MyPosition, 'Max',    Ord (Main.WindowState = wsMaximized));
    WriteInteger (MyPosition, 'Left',   Main.Left  );
    WriteInteger (MyPosition, 'Top',    Main.Top   );
    WriteInteger (MyPosition, 'Height', Main.Height);
    WriteInteger (MyPosition, 'Width',  Main.Width );

    WriteInteger ('Timer', 'Interval',  Interval );

    WriteString  ('Storage', 'Path',    Storage  );

    Result := True;

  finally
    Free
  end;
end;
{$ENDIF}

end.


unit uMain;

interface

{$IFDEF MSWINDOWS}
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, DBCtrlsEh,
  Vcl.ExtCtrls, Vcl.Imaging.jpeg;
{$ENDIF}
{$IFDEF UNIX}
uses
//  Winapi.Windows, Winapi.Messages,
  SysUtils, Variants, Classes,
  Graphics, Forms, Dialogs,
  Controls, StdCtrls, ExtCtrls
//  , Mask
//  , DBCtrlsEh,
  , DBCtrls, DBExtCtrls
//  jpeg
  ;
{$ENDIF}

type
  TMain = class(TForm)
    pnlTop: TPanel;
    btnScan: TButton;
//    edCode: TDBNumberEditEh;
    edCode: TDBEdit;
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
    edWhDOC: TEdit;
    edCODEDOC: TEdit;
    edMAIL: TEdit;
    edOLD: TEdit;
//    edBDATE: TDBDateTimeEditEh;
    edBDATE: TDBDateEdit;
//    edDTDOC: TDBDateTimeEditEh;
    edDTDOC: TDBDateEdit;
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
    procedure btnScanClick(Sender: TObject);
    procedure edCodeKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure run;
    procedure clear;
    function  get_barcode (s_num: string): string;
    procedure SaveDir;     // Сохраняем пути в реестр
    procedure LoadDir;     // Считываем пути из реестра
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

{$IFDEF MSWINDOWS}
uses
  System.IniFiles, System.Win.Registry, System.StrUtils, System.DateUtils;
{$ENDIF}
{$IFDEF UNIX}
uses
  IniFiles,
//  System.Win.Registry,
  StrUtils, DateUtils;
{$ENDIF}

{$R *.dfm}

procedure TMain.btnScanClick(Sender: TObject);
begin
  clear;
  edCode.Text := '';
  edCode.SetFocus;
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

procedure TMain.FormShow(Sender: TObject);
begin
  LoadDir;
  edCode.Text:='';
  edCode.SetFocus;
end;

procedure TMain.run;
var
  s, c_dir, s_ticket: string;
  Ini: Tinifile;
  //dt: TDateTime;
begin
  clear;
  if not DirectoryExists(FDIR) then
  begin
    stStatus.Caption:=  'Нет подключения к хранилищу !';
    stStatus.Color:= clFuchsia;
    Application.ProcessMessages;
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
    exit;
  end;

  Ini:=TiniFile.Create(c_dir+'\'+FINI);
  try
    edDOCSER.Text  := Ini.ReadString ('Person','docser','');
    edDOCNUM.Text  := Ini.ReadString ('Person','docnum','');
    edFNAME.Text   := Ini.ReadString ('Person','fname','');
    edLNAME.Text   := Ini.ReadString ('Person','lname','');
    edSNAME.Text   := Ini.ReadString ('Person','sname','');
    edSEX.Text     := Ini.ReadString ('Person','sex','');
//    edBDATE.Value  := Ini.ReadDate   ('Person','bdate',date);
    edBDATE.Date   := Ini.ReadDate   ('Person','bdate',date);
    edBPLACE.Text  := Ini.ReadString ('Person','bplase','');
    edWhDOC.Text   := Ini.ReadString ('Person','whdoc','');
//    edDTDOC.Value  := Ini.ReadDate   ('Person','dtdoc',date);
    edDTDOC.Date   := Ini.ReadDate   ('Person','dtdoc',date);
    edCODEDOC.Text := Ini.ReadString ('Person','coddoc','');
    edMAIL.Text    := Ini.ReadString ('Person','mail','');
    edROOM.Text    := Ini.ReadString ('Person','room','');
    edTicket.Text  := Ini.ReadString ('Person','ticket','');
    edOLD.Text     := Ini.ReadString ('Person','old','');
    edGOAL.Text    := Ini.ReadString ('Person','goal','');
    imgPerson.Picture.LoadFromFile   (c_dir+'\'+FIMG);
    imgPerson.Show;

  finally
    Ini.Free;
    stStatus.Caption:=  'Посетитель с талоном ' + s + ' зарегистрирован!';
    stStatus.Color:= clLime;
    Application.ProcessMessages;
    sleep(3000);
    edCode.Text:= '';
  end;
end;

procedure TMain.SaveDir;
var Reg: TRegIniFile;
begin
  // Сохраняем пути в реестр
  Reg:= TRegIniFile.Create('Software');
  try
    Reg.OpenKey (ExtractFileName (ParamStr (0)), true);
    Reg.WriteInteger (Name, 'Max',    Ord (Main.WindowState = wsMaximized));
    Reg.WriteInteger (Name, 'Left',   Main.Left  );
    Reg.WriteInteger (Name, 'Top',    Main.Top   );
    Reg.WriteInteger (Name, 'Height', Main.Height);
    Reg.WriteInteger (Name, 'Width',  Main.Width );
//    Reg.WriteString (Name, 'Flt',    edFlt.Value);
//    Reg.WriteString (Name, 'Src',    edSrc.Value);
//    Reg.WriteString (Name, 'Cpy',    edCpy.Value);
  finally
    Reg.Free
  end
end;

procedure TMain.LoadDir;
var
  Reg: TRegIniFile;
  w_max: integer;
begin
  // Считываем пути из реестра
  Reg:= TRegIniFile.Create ('Software');
  try
    Reg.OpenKey (ExtractFileName (ParamStr (0)), true);
    w_max       :=  Reg.ReadInteger (Name, 'Max',    0);
    if w_max = 1 then
      Main.WindowState := wsMaximized
    else
      Main.WindowState := wsNormal;
    Main.Left   :=  Reg.ReadInteger (Name, 'Left',   Main.Left  );
    Main.Top    :=  Reg.ReadInteger (Name, 'Top',    Main.Top   );
    Main.Height :=  Reg.ReadInteger (Name, 'Height', Main.Height);
    Main.Width  :=  Reg.ReadInteger (Name, 'Width',  Main.Width );
  finally
    Reg.Free
  end
end;

procedure TMain.clear;
begin
  stStatus.Caption := '';
  stStatus.Color   := clBtnFace;

  edDOCSER.Text    := '';
  edDOCNUM.Text    := '';
  edLNAME.Text     := '';
  edFNAME.Text     := '';
  edSNAME.Text     := '';
  edSEX.Text       := '';
  edBDATE.Text     := '';
  edBPLACE.Text    := '';
  edWhDOC.Text     := '';
  edDTDOC.Text     := '';
  edCODEDOC.Text   := '';
  edMAIL.Text      := '';
  edOLD.Text       := '';
  edROOM.Text      := '';
  edTicket.Text    := '';

  imgPerson.Hide;
end;

function TMain.get_barcode(s_num: string): string;
begin
  Result := StringReplace (s_num, '*', '', [rfReplaceAll]);
  //IntToStr(StrToIntDef(StringReplace(s_num, '*', '',[rfReplaceAll]), 0));
end;

end.

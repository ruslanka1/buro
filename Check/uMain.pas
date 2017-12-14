unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, DBCtrlsEh,
  Vcl.ExtCtrls;

type
  TMain = class(TForm)
    pnlTop: TPanel;
    btnScan: TButton;
    edCode: TDBNumberEditEh;
    pnlDetails: TPanel;
    stStatus: TStaticText;
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
    edBDATE: TDBDateTimeEditEh;
    edDTDOC: TDBDateTimeEditEh;
    lblROOM: TLabel;
    edROOM: TEdit;
    lblTicket: TLabel;
    edTicket: TEdit;
    procedure btnScanClick(Sender: TObject);
    procedure edCodeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure run;
  public
    { Public declarations }
  end;

var
  Main: TMain;

const
  FDIR = 'Z:\buro';
  FINI = 'data.ini';

implementation

uses System.IniFiles;

{$R *.dfm}

procedure TMain.btnScanClick(Sender: TObject);
begin
  stStatus.Caption:= '';
  edCode.Text:='';
  edCode.SetFocus;
end;

procedure TMain.edCodeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    run;
end;

procedure TMain.run;
var
  s, c_dir, s_ticket: string;
  Ini: Tinifile;
begin
  if not DirectoryExists(FDIR) then
  begin
    s:= 'Папка ' + FDIR + ' не существует...';
    Application.MessageBox(PChar(s), PChar('Внимание'));
    exit;
  end;

  c_dir:= FDIR+'\'+FormatDateTime('yyyy-mm-dd', now);
  if not DirectoryExists(c_dir) then
  begin
    s:= 'Папка для копий ' + c_dir + ' не существует...';
    Application.MessageBox(PChar(s), PChar('Внимание'));
    exit;
  end;

  s_ticket:='1';
  c_dir:= c_dir+'\'+s_ticket;
  if not DirectoryExists(c_dir) then
  begin
    s:= 'Папку для талона ' + c_dir + ' не существует...';
    Application.MessageBox(PChar(s), PChar('Внимание'));
    exit;
  end;

  c_dir:= c_dir+'\'+FINI;
  Ini:=TiniFile.Create(c_dir);
  edFNAME.Text:= Ini.ReadString('Person','fname','');
  edLNAME.Text:= Ini.ReadString('Person','lname','');
  edSNAME.Text:= Ini.ReadString('Person','sname','');
  edSEX.Text:= Ini.ReadString('Person','sex','');
  edBDATE.Value:= Ini.ReadDate('Person','bdate',date);
  edBPLACE.Text:= Ini.ReadString('Person','bplase','');
  edWhDOC.Text:= Ini.ReadString('Person','whdoc','');
  edDTDOC.Value:= Ini.ReadDate('Person','dtdoc',date);
  edCODEDOC.Text:= Ini.ReadString('Person','coddoc','');
  edMAIL.Text:= Ini.ReadString('Person','mail','');
  edROOM.Text:= Ini.ReadString('Person','room','');
  edTicket.Text:= Ini.ReadString('Person','ticket','');
  edOLD.Text:= Ini.ReadString('Person','old','');
  Ini.Free;
end;

end.

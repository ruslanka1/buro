unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin;

type
  TDemoForm = class(TForm)
    seAddr: TSpinEdit;
    mmLog: TMemo;
    edAddr: TEdit;
    gbBright: TGroupBox;
    seBright: TSpinEdit;
    btnBright: TButton;
    gbText: TGroupBox;
    lblDispNo: TLabel;
    seDispNo: TSpinEdit;
    cbOpt: TCheckBox;
    lblFont: TLabel;
    seFont: TSpinEdit;
    lblAlign: TLabel;
    cbAlign: TComboBox;
    lblSpeed: TLabel;
    seSpeed: TSpinEdit;
    lblText: TLabel;
    edText: TEdit;
    btnText: TButton;
    gbTestMode: TGroupBox;
    seTestMode: TSpinEdit;
    btnTestMode: TButton;
    cbTestMode: TCheckBox;
    gbCycled: TGroupBox;
    btnCycled: TButton;
    cbCycled: TCheckBox;
    lblColor: TLabel;
    seColor: TSpinEdit;
    gbAddr: TGroupBox;
    lblEffect: TLabel;
    seEffect: TSpinEdit;
    lblIterat: TLabel;
    seIterat: TSpinEdit;
    lblInterval: TLabel;
    seInterval: TSpinEdit;
    procedure btnCycledClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure btnBrightClick(Sender: TObject);
    procedure btnTextClick(Sender: TObject);
    procedure btnTestModeClick(Sender: TObject);
    procedure cbCycledClick(Sender: TObject);
  private
    Cycled:boolean;
    PackCount, ErrCount:dword;

    procedure AddPortData;
    procedure AddSendPortData;
    procedure ShowPortData;
    procedure ShowSendPortData;
    { Private declarations }
  public
    { Public declarations }
  function CheckOpenPort:boolean;
  end;

var
  DemoForm: TDemoForm;

implementation

uses DevTransp, GlbDecls, IniUnit, CommlibNew;

{$R *.dfm}

{ TTestForm }

function TDemoForm.CheckOpenPort: boolean;
begin
  DestAddr:=seAddr.Value;
  WorkPortName:=StringToPortName(edAddr.Text);
  Result:=OpenPort;
  if not Result then
    ErrMess('Ошибка открытия порта');
end;

procedure TDemoForm.btnCycledClick(Sender: TObject);
var ok, cycl:boolean;
    s:string;
begin
  if not CheckOpenPort then
    Exit;
  PackCount:=0;
  ErrCount:=0;
  cycl:=Cycled;
  if cycl then btnCycled.Enabled:=false;
  repeat
  ok:=CheckConnect=ecOK;
  if Cycled then begin
                 if (PackCount<dword(MaxInt)) then inc(PackCount);
                 if not ok  and (ErrCount<dword(MaxInt)) then inc(ErrCount);
                 s:='Пакетов: '+IntToStr(PackCount)+#13#10+
                    'Ошибок: '+IntToStr(ErrCount)+#13#10;
                 mmLog.Text:=s;
                 Application.ProcessMessages
                 end;
  until not Cycled;
  if not cycl then
    ShowPortData;
  btnCycled.Enabled:=true;
  btnCycled.SetFocus;
end;

procedure TDemoForm.AddPortData;
var s:string;
begin
  s:='Отправлено: '+WorkPort.LastSendHex+#13#10;
  s:=s+'Получено:     '+WorkPort.LastRecHex+#13#10;
  mmLog.Text:=mmLog.Text+s;
end;

procedure TDemoForm.AddSendPortData;
var s: string;
begin
  s:='Отправлено: '+WorkPort.LastSendHex+#13#10;
  mmLog.Text:=mmLog.Text+s;
end;

procedure TDemoForm.ShowPortData;
begin
  mmLog.Text:='';
  AddPortData;
end;

procedure TDemoForm.ShowSendPortData;
begin
  mmLog.Text:='';
  AddSendPortData;
end;


procedure TDemoForm.FormCreate(Sender: TObject);
begin
  ReadIniFile(Ini);
end;

procedure TDemoForm.FormDestroy(Sender: TObject);
begin
  WriteIniFile(Ini);
end;

procedure TDemoForm.FormShow(Sender: TObject);
begin
  edAddr.Text:=StringToPortName(Ini.IpPort);
  seAddr.Value:=Ini.Id;
end;

procedure TDemoForm.FormHide(Sender: TObject);
begin
  Ini.Id:=seAddr.Value;
  Ini.IpPort:=StringToPortName(edAddr.Text);
end;

var aaa:dword;

procedure TDemoForm.btnBrightClick(Sender: TObject);
begin
  if not CheckOpenPort then
    Exit;
  aaa:=ctrlSetBright(seBright.Value);
  ShowPortData;
end;

procedure TDemoForm.btnTextClick(Sender: TObject);
var
  P: TOutTextParams;
  s: ansistring;
begin
//text out
  if not CheckOpenPort then
    Exit;
  FillChar(P, sizeof(P), 0);
  P.DispNo:= seDispNo.Value;
  P.Font:= seFont.Value;
  P.Align:= cbAlign.ItemIndex;
  if cbOpt.Checked then
    P.Opt:= P.Opt or $80
  else
    P.Opt:= $1;
  P.Speed:= seSpeed.Value;
  P.Color:= seColor.Value;
  P.Effect:= seEffect.Value;
  P.Iterat:= seIterat.Value;
  P.Interval:= seInterval.Value;
  s:=edText.Text;
  aaa:=ctrlOutText(@P, s);
  ShowPortData;
end;

//0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras
//0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras
//0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras
procedure TDemoForm.btnTestModeClick(Sender: TObject);
begin
  if not CheckOpenPort then
    Exit;
  aaa:=ctrlSetTestMode(seTestMode.Value, cbTestMode.Checked);
  ShowPortData;
end;

procedure TDemoForm.cbCycledClick(Sender: TObject);
begin
  Cycled:=cbCycled.Checked;
end;

end.

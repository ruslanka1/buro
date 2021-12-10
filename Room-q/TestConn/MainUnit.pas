unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin;

type
  TDemoForm = class(TForm)
    SpinEdit1: TSpinEdit;
    Label2: TLabel;
    SpinEdit2: TSpinEdit;
    Memo1: TMemo;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit1: TEdit;
    Button2: TButton;
    Button3: TButton;
    GroupBox1: TGroupBox;
    SpinEdit3: TSpinEdit;
    Button4: TButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    SpinEdit4: TSpinEdit;
    CheckBox1: TCheckBox;
    Label3: TLabel;
    SpinEdit5: TSpinEdit;
    Label4: TLabel;
    ComboBox1: TComboBox;
    Label5: TLabel;
    SpinEdit6: TSpinEdit;
    Label6: TLabel;
    Edit2: TEdit;
    Button5: TButton;
    GroupBox3: TGroupBox;
    SpinEdit7: TSpinEdit;
    Button6: TButton;
    CheckBox2: TCheckBox;
    GroupBox4: TGroupBox;
    Button1: TButton;
    CheckBox3: TCheckBox;
    Label7: TLabel;
    SpinEdit8: TSpinEdit;
    SpinEdit9: TSpinEdit;
    Button7: TButton;
    procedure Button1Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure SpinEdit4Change(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
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
  procedure CheckVis;
  end;

var
  DemoForm: TDemoForm;

implementation

uses DevTransp, GlbDecls, IniUnit, CommlibNew;

{$R *.dfm}

{ TTestForm }

function TDemoForm.CheckOpenPort: boolean;
begin
DestAddr:=SpinEdit2.Value;
if RadioButton1.Checked then WorkPortName:='COM'+IntToStr(SpinEdit1.Value)
                        else WorkPortName:=StringToPortName(Edit1.Text);
Result:=OpenPort;
if not Result then ErrMess('Ошибка открытия порта');
end;

procedure TDemoForm.Button1Click(Sender: TObject);
var ok, cycl:boolean;
    s:string;
begin
if not CheckOpenPort then Exit;
PackCount:=0;
ErrCount:=0;
cycl:=Cycled;
if cycl then Button1.Visible:=false;
repeat
ok:=CheckConnect=ecOK;
if Cycled then begin
               if (PackCount<dword(MaxInt)) then inc(PackCount);
               if not ok  and (ErrCount<dword(MaxInt)) then inc(ErrCount);
               s:='Пакетов: '+IntToStr(PackCount)+#13#10+
                  'Ошибок: '+IntToStr(ErrCount)+#13#10;
               Memo1.Text:=s;   
               Application.ProcessMessages
               end;
until not Cycled;
if not cycl then ShowPortData;
Button1.Visible:=true;
Button1.SetFocus;
end;

procedure TDemoForm.SpinEdit1Change(Sender: TObject);
begin
ClosePort;
end;

procedure TDemoForm.AddPortData;
var s:string;
begin
s:='Отправлено: '+WorkPort.LastSendHex+#13#10;
s:=s+'Получено:     '+WorkPort.LastRecHex+#13#10;
Memo1.Text:=Memo1.Text+s;
end;

procedure TDemoForm.AddSendPortData;
var s:string;
begin
s:='Отправлено: '+WorkPort.LastSendHex+#13#10;
Memo1.Text:=Memo1.Text+s;
end;

procedure TDemoForm.ShowPortData;
begin
 Memo1.Text:='';
 AddPortData;
end;

procedure TDemoForm.ShowSendPortData;
begin
 Memo1.Text:='';
 AddSendPortData;
end;


procedure TDemoForm.RadioButton1Click(Sender: TObject);
begin
ClosePort;
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
Left:=Ini.Position.Left;
Top:=Ini.Position.Top;
RadioButton1.Checked:=Ini.Options=0;
RadioButton2.Checked:=Ini.Options<>0;
SpinEdit1.Value:=Ini.PortNum;
Edit1.Text:=StringToPortName(Ini.IpPort);
SpinEdit2.Value:=Ini.Id;
CheckVis;
end;

procedure TDemoForm.FormHide(Sender: TObject);
begin
Ini.Position:=BoundsRect;
if RadioButton2.Checked then Ini.Options:=1
                        else Ini.Options:=0;
Ini.PortNum:=SpinEdit1.Value;
Ini.Id:=SpinEdit2.Value;
Ini.IpPort:=StringToPortName(Edit1.Text);
end;

var aaa:dword;

procedure TDemoForm.Button4Click(Sender: TObject);
begin
if not CheckOpenPort then Exit;
aaa:=ctrlSetBright(SpinEdit3.Value);
ShowPortData;
end;

procedure TDemoForm.Button2Click(Sender: TObject);
var ST:TSystemTime;
begin
if not CheckOpenPort then Exit;
GetLocalTime(ST);
aaa:=ctrlSetTime(ST);
ShowPortData;
end;

procedure TDemoForm.Button3Click(Sender: TObject);
var ST:TSystemTime;
begin
if not CheckOpenPort then Exit;
aaa:=ctrlGetTime(ST);
ShowPortData;
end;

procedure TDemoForm.SpinEdit4Change(Sender: TObject);
begin
CheckVis;
end;

procedure TDemoForm.CheckVis;
var n:integer;
begin
n:=SpinEdit4.Value;
CheckBox1.Visible:=(n=2) or (n=4) or (n=0);
Label4.Visible:=(n=5) or (n=0);
Label5.Visible:=(n=5) or (n=0);
ComboBox1.Visible:=(n=5) or (n=0);
SpinEdit6.Visible:=(n=5) or (n=0);
end;

procedure TDemoForm.Button5Click(Sender: TObject);
var P:TOutTextParams;
    s:string;
begin
//text out
if not CheckOpenPort then Exit;
FillChar(P, sizeof(P), 0);
P.DispNo:=SpinEdit4.Value;
P.Font:=SpinEdit5.Value;
P.Color:=SpinEdit8.Value;
if CheckBox1.Visible and CheckBox1.Checked then P.Opt:=P.Opt or $80;
if ComboBox1.Visible then P.Align:=ComboBox1.ItemIndex;
if SpinEdit6.Visible then P.Speed:=SpinEdit6.Value;
s:='   '+Edit2.Text;
aaa:=ctrlOutText(@P, s);
ShowPortData;
end;

//0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras
//0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras
//0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$$%&0qweras
procedure TDemoForm.Button6Click(Sender: TObject);
begin
if not CheckOpenPort then Exit;
aaa:=ctrlSetTestMode(SpinEdit7.Value, CheckBox2.Checked);
ShowPortData;
end;

procedure TDemoForm.CheckBox3Click(Sender: TObject);
begin
Cycled:=CheckBox3.Checked;
end;

procedure TDemoForm.Button7Click(Sender: TObject);
begin
if not CheckOpenPort then Exit;
ctrlSetTestMode2(SpinEdit9.Value);
end;

end.

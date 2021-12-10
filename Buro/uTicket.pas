unit uTicket;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdMessage, IdAttachment, IdAttachmentFile,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP,
  Vcl.ComCtrls;

type
  TTicket = class(TForm)
    lblDate: TLabel;
    lblNumber: TLabel;
    lblBarcode: TLabel;
    lblRoom: TLabel;
    btnPrint: TButton;
    btnSend: TButton;
    btnPrintSend: TButton;
    mmOrg: TMemo;
    IdSMTP: TIdSMTP;
    IdMes: TIdMessage;
    IdSSL: TIdSSLIOHandlerSocketOpenSSL;
    lblInTimeNM: TLabel;
    lblNum: TLabel;
    pcPGS: TPageControl;
    tsTicket: TTabSheet;
    tsAgree: TTabSheet;
    btnPrintAgree: TButton;
    mmAgree: TMemo;
    lblGoal: TLabel;
    procedure btnPrintClick(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure btnPrintSendClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPrintAgreeClick(Sender: TObject);
  private
    { Private declarations }
    procedure scr_sh;
    procedure send;
    function SendMes(mail: String; var Err: string): Boolean;
  public
    { Public declarations }
    fdir,
    femail,
    fnum,
    fvisitor,
    foperator: string;
    fview: boolean;
  end;

var
  Ticket: TTicket;

implementation

{$R *.dfm}

procedure TTicket.btnPrintAgreeClick(Sender: TObject);
var s: string;
begin
  s:= mmAgree.Text;
  mmAgree.Text:= StringReplace(mmAgree.Text,'%visitor%',fvisitor,[]);
  mmAgree.Text:= StringReplace(mmAgree.Text,'%operator%',foperator,[]);
  mmAgree.Text:= StringReplace(mmAgree.Text,'%data%',lblDate.Caption,[]);
  mmAgree.Text:= StringReplace(mmAgree.Text,'%num%',fnum,[]);
  pcPGS.ActivePage:= tsAgree;
  try
    Application.ProcessMessages;
    //sleep(10000);
    print;
    if not fview then
      btnPrintClick(Sender);
  finally
    pcPGS.ActivePage:= tsTicket;
    mmAgree.Text:= s;
  end;
end;

procedure TTicket.btnPrintClick(Sender: TObject);
//var ht: integer;
begin
  btnPrint.Hide;
  btnPrintAgree.Hide;
  btnSend.Hide;
  btnPrintSend.Hide;
  lblNum.Show;
//  ht:= mmOrg.Height;
  try
    // Org.Height:= btnPrint.Top - mmOrg.Top + btnPrint.Height;
    Application.ProcessMessages;
    print;
  finally
//    mmOrg.Height:= ht;
    btnPrint.Show;
    btnPrintAgree.Show;
    btnSend.Show;
    btnPrintSend.Show;
    lblNum.Hide;
//    Hide;
  end;
end;

procedure TTicket.btnPrintSendClick(Sender: TObject);
//var ht: integer;
begin
  btnPrint.Hide;
  btnPrintAgree.Hide;
  btnSend.Hide;
  btnPrintSend.Hide;
  // ht:= mmOrg.Height;
  try
    // mmOrg.Height:= btnPrint.Top - mmOrg.Top + btnPrint.Height;
    Application.ProcessMessages;
    send;
    print;
  finally
    // mmOrg.Height:= ht;
    btnPrint.Show;
    btnPrintAgree.Show;
    btnSend.Show;
    btnPrintSend.Show;
//    Hide;
  end;
end;

procedure TTicket.btnSendClick(Sender: TObject);
//var ht: integer;
begin
  btnPrint.Hide;
  btnPrintAgree.Hide;
  btnSend.Hide;
  btnPrintSend.Hide;
  // ht:= mmOrg.Height;
  try
    // mmOrg.Height:= btnPrint.Top - mmOrg.Top + btnPrint.Height;
    Application.ProcessMessages;
    send;
  finally
    // mmOrg.Height:= ht;
    btnPrint.Show;
    btnPrintAgree.Show;
    btnSend.Show;
    btnPrintSend.Show;
//    Hide;
  end;
end;

procedure TTicket.FormShow(Sender: TObject);
var mail: boolean;
begin
  pcPGS.ActivePage:= tsTicket;
  btnPrint.Show;
  btnPrintAgree.Show;
  btnSend.Show;
  btnPrintSend.Show;

  mail:= not(femail = '') and (pos('@', femail) > 0);
  btnPrint.Enabled     := True;
  btnPrintAgree.Enabled:= True;
  btnSend.Enabled      := mail;
  btnPrintSend.Enabled := mail;
end;

procedure TTicket.scr_sh;
var
  BMP: TBitmap;
begin
  if not DirectoryExists(fdir) then
  begin
    Application.MessageBox('��� ����������� � ��������� !','��������!');
    Application.ProcessMessages;
    exit;
  end;

//  fg:=GetForegroundWindow;
//  GetWindowRect(fg, r1);          // �������� ������ ��������� ���� � r1
  BMP:= TBitmap.Create;
  BMP.Width := ClientWidth;          // ��������� �������
  BMP.Height := ClientHeight;

  BitBlt(BMP.Canvas.Handle, 0, 0, BMP.Width, BMP.Height, GetDC(Handle), 0, 0, SRCCOPY);

  BMP.SaveToFile(fdir+'\ticket.bmp'); // ��������� �� ����
  BMP.Free;
end;

procedure TTicket.send;
var Err: string;
begin
  scr_sh;
  SendMes(femail, Err);
  if Err <> '��' then
    Application.MessageBox(PChar(Err),'��������!');
end;

function TTicket.SendMes(mail: String; var Err: string): Boolean;

var att: TidAttachment;
begin
  Err:= '��';
  Result:= false;
  if (pos('@', mail) > 0) then
  begin
{
   // ��� mail.ru
    IdSmtp.Host:= 'smtp.mail.ru';
    IdSmtp.Port := 465;
    IdSmtp.Username := 'fbmse.eva';
    IdSmtp.Password := ';tktpzrf';
    IdSmtp.UseTLS := utUseExplicitTLS;
    IdMes.From.Address :='fbmse.eva@mail.ru';
   // --- ��� mail.ru
}
    // ��� fbmse.ru
    IdSmtp.Host:= '172.16.254.232';
    IdSmtp.Port := 25;
    IdSmtp.Username := 'robot@fbmse.ru';
    IdSmtp.Password := ';tktpzrf';
    IdMes.From.Address :='robot@fbmse.ru';
    // --- ��� fbmse.ru

    IdSmtp.HeloName := 'TICKET'; // ������������ ��� ���������.
    IdSmtp.ConnectTimeout := 30000;
    IdSmtp.ReadTimeout := 30000;

    IdMes.From.Name :='��������� ���';
    IdMes.Subject := '����� ��� �������';
    IdMes.ContentType:='multipart/mixed; charset=windows-1251'; // ��� �������� � ���������
    IdMes.ContentTransferEncoding:='8bit';
    try
      IdSmtp.Connect;
      if IdSmtp.Connected then
      begin
        //Application.MessageBox(PChar('������������'),PChar('��������'));
        IdMes.Body.Clear;
        IdMes.Body.Add('����� ��� ������� �� ��������');
        IdMes.Body.Add('');
        IdMes.Body.Add('--');
        IdMes.Body.Add('� ���������,');
        IdMes.Body.Add('��������� ���');
        IdMes.Recipients.EMailAddresses := mail;
        //IdMes.Recipients.EMailAddresses := 'kadrileev_rr@fbmse.ru,ruslan_lili@mail.ru';
        IdMes.Date:= now;
        att:=TIdAttachmentFile.Create(IdMes.MessageParts, fdir+'\ticket.bmp');
        try
          IdSmtp.Send(idMes);
        except
          IdSmtp.Disconnect();
          att.Free;
          Err:= '������ ��������';
          Result:= false;
          exit;
        end;
        IdSmtp.Disconnect();
        att.Free;
        Result:= True;
      end;
    except
      Err:= '������ �����������';
      Result:= false;
      exit;
    end;
  end;
end;

end.

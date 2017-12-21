unit uTicket;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdMessage, IdAttachment, IdAttachmentFile,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP;

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
    lblTime: TLabel;
    procedure btnPrintClick(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure btnPrintSendClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure scr_sh;
    procedure send;
    function SendMes(mail: String; var Err: string): Boolean;
  public
    { Public declarations }
    fdir,
    femail: string;
  end;

var
  Ticket: TTicket;

implementation

{$R *.dfm}

procedure TTicket.btnPrintClick(Sender: TObject);
var ht: integer;
begin
  btnPrint.Hide;
  btnSend.Hide;
  btnPrintSend.Hide;
  ht:= mmOrg.Height;
  try
    mmOrg.Height:= btnPrint.Top - mmOrg.Top + btnPrint.Height;
    Application.ProcessMessages;
    print;
  finally
    mmOrg.Height:= ht;
    btnPrint.Show;
    btnSend.Show;
    btnPrintSend.Show;
//    Hide;
  end;
end;

procedure TTicket.btnPrintSendClick(Sender: TObject);
var ht: integer;
begin
  btnPrint.Hide;
  btnSend.Hide;
  btnPrintSend.Hide;
  ht:= mmOrg.Height;
  try
    mmOrg.Height:= btnPrint.Top - mmOrg.Top + btnPrint.Height;
    Application.ProcessMessages;
    send;
    print;
  finally
    mmOrg.Height:= ht;
    btnPrint.Show;
    btnSend.Show;
    btnPrintSend.Show;
//    Hide;
  end;
end;

procedure TTicket.btnSendClick(Sender: TObject);
var ht: integer;
begin
  btnPrint.Hide;
  btnSend.Hide;
  btnPrintSend.Hide;
  ht:= mmOrg.Height;
  try
    mmOrg.Height:= btnPrint.Top - mmOrg.Top + btnPrint.Height;
    Application.ProcessMessages;
    send;
  finally
    mmOrg.Height:= ht;
    btnPrint.Show;
    btnSend.Show;
    btnPrintSend.Show;
//    Hide;
  end;
end;

procedure TTicket.FormShow(Sender: TObject);
var mail: boolean;
begin
  btnPrint.Show;
  btnSend.Show;
  btnPrintSend.Show;

  mail:= not(femail = '') and (pos('@', femail) > 0);
  btnPrint.Enabled    := True;
  btnSend.Enabled     := mail;
  btnPrintSend.Enabled:= mail;
end;

procedure TTicket.scr_sh;
var
  BMP: TBitmap;
begin
  if not DirectoryExists(fdir) then
  begin
    Application.MessageBox('Нет подключения к хранилищу !','ВНИМАНИЕ!');
    Application.ProcessMessages;
    exit;
  end;

//  fg:=GetForegroundWindow;
//  GetWindowRect(fg, r1);          // Получили размер активного окна в r1
  BMP:= TBitmap.Create;
  BMP.Width := ClientWidth;          // указываем размеры
  BMP.Height := ClientHeight;

  BitBlt(BMP.Canvas.Handle, 0, 0, BMP.Width, BMP.Height, GetDC(Handle), 0, 0, SRCCOPY);

  BMP.SaveToFile(fdir+'\ticket.bmp'); // сохраняем на диск
  BMP.Free;
end;

procedure TTicket.send;
var Err: string;
begin
  scr_sh;
  SendMes(femail, Err);
  if Err <> 'Ок' then
    Application.MessageBox(PChar(Err),'ВНИМАНИЕ!');
end;

function TTicket.SendMes(mail: String; var Err: string): Boolean;

var att: TidAttachment;
begin
  Err:= 'Ок';
  Result:= false;
  if (pos('@', mail) > 0) then
  begin
{
   // для mail.ru
    IdSmtp.Host:= 'smtp.mail.ru';
    IdSmtp.Port := 465;
    IdSmtp.Username := 'fbmse.eva';
    IdSmtp.Password := ';tktpzrf';
    IdSmtp.UseTLS := utUseExplicitTLS;
    IdMes.From.Address :='fbmse.eva@mail.ru';
   // --- для mail.ru
}
    // для fbmse.ru
    IdSmtp.Host:= '172.16.254.232';
    IdSmtp.Port := 25;
    IdSmtp.Username := 'robot@fbmse.ru';
    IdSmtp.Password := ';tktpzrf';
    IdMes.From.Address :='robot@fbmse.ru';
    // --- для fbmse.ru

    IdSmtp.HeloName := 'TICKET'; // Произвольное имя латиницей.
    IdSmtp.ConnectTimeout := 30000;
    IdSmtp.ReadTimeout := 30000;

    IdMes.From.Name :='Проходная МСЭ';
    IdMes.Subject := 'Талон для прохода';
    IdMes.ContentType:='multipart/mixed; charset=windows-1251'; // тип контента и кодировка
    IdMes.ContentTransferEncoding:='8bit';
    try
      IdSmtp.Connect;
      if IdSmtp.Connected then
      begin
        //Application.MessageBox(PChar('Подключились'),PChar('Внимание'));
        IdMes.Body.Clear;
        IdMes.Body.Add('Талон для прохода во вложении');
        IdMes.Body.Add('');
        IdMes.Body.Add('--');
        IdMes.Body.Add('С уважением,');
        IdMes.Body.Add('Проходная МСЭ');
        IdMes.Recipients.EMailAddresses := mail;
        //IdMes.Recipients.EMailAddresses := 'kadrileev_rr@fbmse.ru,ruslan_lili@mail.ru';
        IdMes.Date:= now;
        att:=TIdAttachmentFile.Create(IdMes.MessageParts, fdir+'\ticket.bmp');
        try
          IdSmtp.Send(idMes);
        except
          IdSmtp.Disconnect();
          att.Free;
          Err:= 'Ошибка отправки';
          Result:= false;
          exit;
        end;
        IdSmtp.Disconnect();
        att.Free;
        Result:= True;
      end;
    except
      Err:= 'Ошибка подключения';
      Result:= false;
      exit;
    end;
  end;
end;

end.

unit uTicket;

interface

{$IFDEF MSWINDOWS}
uses
  Winapi.Windows, Winapi.Messages, 
  System.SysUtils, System.Variants, System.Classes, 
  Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;
{$ELSE}
uses
  SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls;
{$ENDIF}

type
  TTicket = class(TForm)
    lblTitle: TLabel;
    lblDate: TLabel;
    lblNumber: TLabel;
    lblBarcode: TLabel;
    lblRoom: TLabel;
    btnPrint: TButton;
    btnSend: TButton;
    btnPrintSend: TButton;
    mmOrg: TMemo;
    {$IFDEF INDY}
    IdSMTP: TIdSMTP;
    IdMes: TIdMessage;
    IdSSL: TIdSSLIOHandlerSocketOpenSSL;
    {$ENDIF}
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
{$IFDEF MSWINDOWS}
    print;
{$ELSE}
    //FIXME: print this form here
{$ENDIF}
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
    {$IFDEF MSWINDOWS}
        print;
    {$ELSE}
        //FIXME: print this form here
    {$ENDIF}
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
    Application.MessageBox('Íåò ïîäêëþ÷åíèÿ ê õðàíèëèùó !','ÂÍÈÌÀÍÈÅ!');
    Application.ProcessMessages;
    exit;
  end;
  
//  fg:=GetForegroundWindow;
//  GetWindowRect(fg, r1);          // Ïîëó÷èëè ðàçìåð àêòèâíîãî îêíà â r1
  BMP:= TBitmap.Create;
  BMP.Width := ClientWidth;          // óêàçûâàåì ðàçìåðû
  BMP.Height := ClientHeight;

  {$IFDEF MSWINDOWS}
  BitBlt (BMP.Canvas.Handle, 0, 0, BMP.Width, BMP.Height, GetDC(Handle), 0, 0, SRCCOPY);
  {$ELSE}
  //FIXME: make a copy of the image here:
  // BitBlt (BMP.Canvas.Handle, 0, 0, BMP.Width, BMP.Height, GetDC(Handle), 0, 0, SRCCOPY);
  {$ENDIF}

  BMP.SaveToFile(fdir+'\ticket.bmp'); // ñîõðàíÿåì íà äèñê
  BMP.Free;
end;

procedure TTicket.send;
var Err: string;
begin
  scr_sh;
  SendMes(femail, Err);
  if Err <> 'Îê' then
    Application.MessageBox(PChar(Err),'ÂÍÈÌÀÍÈÅ!');
end;

{$IFDEF MSWINDOWS}
function TTicket.SendMes(mail: String; var Err: string): Boolean;

var att: TidAttachment;
begin
  Err:= 'Îê';
  Result:= false;
  if (pos('@', mail) > 0) then
  begin
{
   // äëÿ mail.ru
    IdSmtp.Host:= 'smtp.mail.ru';
    IdSmtp.Port := 465;
    IdSmtp.Username := 'fbmse.eva';
    IdSmtp.Password := ';tktpzrf';
    IdSmtp.UseTLS := utUseExplicitTLS;
    IdMes.From.Address :='fbmse.eva@mail.ru';
   // --- äëÿ mail.ru
}
    // äëÿ fbmse.ru
    IdSmtp.Host:= '172.16.254.232';
    IdSmtp.Port := 25;
    IdSmtp.Username := 'robot@fbmse.ru';
    IdSmtp.Password := ';tktpzrf';
    IdMes.From.Address :='robot@fbmse.ru';
    // --- äëÿ fbmse.ru

    IdSmtp.HeloName := 'TICKET'; // Ïðîèçâîëüíîå èìÿ ëàòèíèöåé.
    IdSmtp.ConnectTimeout := 30000;
    IdSmtp.ReadTimeout := 30000;

    IdMes.From.Name :='Ïðîõîäíàÿ ÌÑÝ';
    IdMes.Subject := 'Òàëîí äëÿ ïðîõîäà';
    IdMes.ContentType:='multipart/mixed; charset=windows-1251'; // òèï êîíòåíòà è êîäèðîâêà
    IdMes.ContentTransferEncoding:='8bit';
    try
      IdSmtp.Connect;
      if IdSmtp.Connected then
      begin
        //Application.MessageBox(PChar('Ïîäêëþ÷èëèñü'),PChar('Âíèìàíèå'));
        IdMes.Body.Clear;
        IdMes.Body.Add('Òàëîí äëÿ ïðîõîäà âî âëîæåíèè');
        IdMes.Body.Add('');
        IdMes.Body.Add('--');
        IdMes.Body.Add('Ñ óâàæåíèåì,');
        IdMes.Body.Add('Ïðîõîäíàÿ ÌÑÝ');
        IdMes.Recipients.EMailAddresses := mail;
        //IdMes.Recipients.EMailAddresses := 'kadrileev_rr@fbmse.ru,ruslan_lili@mail.ru';
        IdMes.Date:= now;
        att:=TIdAttachmentFile.Create(IdMes.MessageParts, fdir+'\ticket.bmp');
        try
          IdSmtp.Send(idMes);
        except
          IdSmtp.Disconnect();
          att.Free;
          Err:= 'Îøèáêà îòïðàâêè';
          Result:= false;
          exit;
        end;
        IdSmtp.Disconnect();
        att.Free;
        Result:= True;
      end;
    except
      Err:= 'Îøèáêà ïîäêëþ÷åíèÿ';
      Result:= false;
      exit;
    end;
  end;
end;
{$ENDIF}

{$IFDEF UNIX}
function TTicket.SendMes(mail: String; var Err: string): Boolean;
begin
  //FIXME: send mail with the ticket here
end;
{$ENDIF}

end.

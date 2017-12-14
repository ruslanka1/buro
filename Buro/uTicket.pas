unit uTicket;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TTicket = class(TForm)
    lblTitle: TLabel;
    lblDate: TLabel;
    lblNumber: TLabel;
    lblBarcode: TLabel;
    lblRoom: TLabel;
    btnPrint: TButton;
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ticket: TTicket;

implementation

{$R *.dfm}

procedure TTicket.btnPrintClick(Sender: TObject);
begin
  btnPrint.Hide;
  try
    print;
  finally
    btnPrint.Show;
//    Hide;
  end;
end;

end.

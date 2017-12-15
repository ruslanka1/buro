program buro;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Main},
  uTicket in 'uTicket.pas' {Ticket};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TTicket, Ticket);
  Application.Run;
end.

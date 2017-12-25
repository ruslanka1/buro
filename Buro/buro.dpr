program buro;

uses
{$IFDEF MSWINDOWS}
  Vcl.Forms,
{$ELSE}
  Forms, Interfaces,
{$ENDIF}
  uMain in 'uMain.pas' {Main},
  uTicket in 'uTicket.pas' {Ticket};

{$R *.res}

begin
  Application.Initialize;
  {$IFDEF MSWINDOWS}
  Application.MainFormOnTaskbar := True;
  {$ELSE}
  //FIXME: add the App icon to system tray
  {$ENDIF}
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TTicket, Ticket);
  Application.Run;
end.

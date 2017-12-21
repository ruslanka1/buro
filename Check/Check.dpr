program Check;

uses
{$IFDEF MSWINDOWS}
  Vcl.Forms,
{$ENDIF}
{$IFDEF UNIX}
  Forms, Interfaces,
{$ENDIF}
  uMain in 'uMain.pas' {Main};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain, Main);
  Application.Run;
end.

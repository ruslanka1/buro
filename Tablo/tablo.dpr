program tablo;

uses
  {$IFDEF MSWINDOWS}
  Vcl.Forms,
  {$ENDIF}
  {$IFDEF UNIX}
  Forms, Interfaces,
  {$ENDIF}
  uMain in 'uMain.pas' {Main},
  uConfig in 'uConfig.pas' {config}
  ;

{$R *.res}

begin
  Application.Initialize;
  {$IFDEF MSWINDOWS}
  Application.MainFormOnTaskbar := True;
  {$ENDIF}
  Application.CreateForm(TConfig, config);
  Application.CreateForm(TMain, Main);
  Application.Run;
end.

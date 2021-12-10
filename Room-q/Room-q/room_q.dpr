program room_q;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {DemoForm},
  GlbDecls in 'GlbDecls.pas',
  CRCUnit in 'CRCUnit.pas',
  ConnTypes in 'ConnTypes.pas',
  CommlibNew in 'CommlibNew.pas',
  DevTransp in 'DevTransp.pas',
  IniUnit in 'IniUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDemoForm, DemoForm);
  Application.Run;
end.

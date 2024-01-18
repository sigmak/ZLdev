program ZLdev_del;

uses
  Forms,
  MainForm in 'MainForm.pas' {FMainForm},
  utype in 'utype.pas',
  Uconst in 'Uconst.pas',
  utils in 'utils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFMainForm, FMainForm);
  Application.Run;
end.

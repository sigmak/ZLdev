program ZLdev_del;

uses
  Forms,
  MainForm in 'MainForm.pas' {FMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFMainForm, FMainForm);
  Application.Run;
end.

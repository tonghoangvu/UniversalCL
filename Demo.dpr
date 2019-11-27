program Demo;

uses
  Vcl.Forms,
  Form.Demo in 'DemoForms\Form.Demo.pas' {formDemo},
  Form.LoginDialog in 'DemoForms\Form.LoginDialog.pas' {formLoginDialog},
  Form.ImageBackground in 'DemoForms\Form.ImageBackground.pas' {formImageBackground},
  DataModule.Main in 'DemoForms\DataModule.Main.pas' {dmMain: TDataModule};

{$R *.res}

begin
  {$IFDEF DEBUG}
    ReportMemoryLeaksOnShutdown := true;
  {$ENDIF}

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TformDemo, formDemo);
  Application.CreateForm(TformLoginDialog, formLoginDialog);
  Application.CreateForm(TformImageBackground, formImageBackground);
  Application.Run;
end.

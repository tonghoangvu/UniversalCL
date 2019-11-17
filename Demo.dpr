program Demo;

uses
  Vcl.Forms,
  Form.Demo in 'DemoForms\Form.Demo.pas' {formDemo},
  Form.LoginDialog in 'DemoForms\Form.LoginDialog.pas' {formLoginDialog},
  Form.ImageBackground in 'DemoForms\Form.ImageBackground.pas' {formImageBackground};

{$R *.res}

begin
  {$IFDEF DEBUG}
    ReportMemoryLeaksOnShutdown := true;
  {$ENDIF}

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformDemo, formDemo);
  Application.CreateForm(TformLoginDialog, formLoginDialog);
  Application.CreateForm(TformImageBackground, formImageBackground);
  Application.Run;
end.

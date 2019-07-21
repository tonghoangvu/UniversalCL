program Demo;

uses
  Vcl.Forms,
  Form.Demo in 'DemoForms\Form.Demo.pas' {formDemo};

{$R *.res}

begin
  {$IFDEF DEBUG}
    ReportMemoryLeaksOnShutdown := true;
  {$ENDIF}

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformDemo, formDemo);
  Application.Run;
end.

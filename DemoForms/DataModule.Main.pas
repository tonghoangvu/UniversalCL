unit DataModule.Main;

interface

uses
  UCL.TUThemeManager, UCL.Classes, UCL.Utils,
  UCL.TUCheckBox,
  System.SysUtils, System.Classes;

type
  TdmMain = class(TDataModule)
    AppTheme: TUThemeManager;
    procedure AppThemeUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMain: TdmMain;

implementation

uses
  Form.Demo, Form.LoginDialog, Form.ImageBackground;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmMain.AppThemeUpdate(Sender: TObject);
begin
  if formDemo <> nil then
    begin
      formDemo.panelSelectAccentColor.CustomBackColor := AppTheme.AccentColor;
      formDemo.panelSelectAccentColor.CustomTextColor :=
        GetTextColorFromBackground(AppTheme.AccentColor);

      if AppTheme.ColorOnBorder then
        formDemo.checkColorBorder.State := cbsChecked
      else
        formDemo.checkColorBorder.State := cbsUnchecked;
    end;
end;

end.

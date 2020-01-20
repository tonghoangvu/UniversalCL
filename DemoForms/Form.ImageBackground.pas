unit Form.ImageBackground;

interface

uses
  UCL.Classes, UCL.TUThemeManager, UCL.TUBorderlessForm, UCL.Utils,

  UCL.TUQuickButton, UCL.TUCaptionBar, UCL.TUTitleBar, UCL.TUSlider,
  UCL.TUButton, UCL.TUCheckBox, UCL.TURadioButton, UCL.TUSeparator,
  UCL.TUProgressBar, StdCtrls, UCL.TUText, UCL.TUEdit,
  UCL.TUSymbolButton, UCL.TUItemButton, UCL.TUPanel, UCL.TUShadow,

  SysUtils, Variants, Classes,
  Windows, Messages,
  Graphics, Controls, Forms, Dialogs, ExtCtrls, jpeg;

type
  TformImageBackground = class(TUBorderlessForm)
    imgBackground: TImage;
    titlebarMain: TUTitleBar;
    sliderMain: TUSlider;
    buttonOk: TUButton;
    radioSystemTheme: TURadioButton;
    radioLightTheme: TURadioButton;
    progressMain: TUProgressBar;
    radioDarkTheme: TURadioButton;
    buttonSide: TUSymbolButton;
    panelBottom: TUPanel;
    editEmail: TUEdit;
    buttonCancel: TUButton;
    shadowMenu: TUShadow;
    entryChooseTheme: TUText;
    buttonAppQuit: TUQuickButton;
    buttonAppMinimized: TUQuickButton;
    procedure FormCreate(Sender: TObject);
    procedure radioSystemThemeClick(Sender: TObject);
    procedure radioLightThemeClick(Sender: TObject);
    procedure radioDarkThemeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formImageBackground: TformImageBackground;

implementation

uses
  DataModule.Main;

{$R *.dfm}

procedure TformImageBackground.FormCreate(Sender: TObject);
begin
//  EnableBlur(Handle, 3);

  ThemeManager := dmMain.AppTheme;
end;

procedure TformImageBackground.radioSystemThemeClick(Sender: TObject);
begin
  ThemeManager.UseSystemTheme := true;
  ThemeManager.Reload;
end;

procedure TformImageBackground.radioLightThemeClick(Sender: TObject);
begin
  ThemeManager.CustomTheme := utLight;
  ThemeManager.UseSystemTheme := false;
  ThemeManager.Reload;
end;

procedure TformImageBackground.radioDarkThemeClick(Sender: TObject);
begin
  ThemeManager.CustomTheme := utDark;
  ThemeManager.UseSystemTheme := false;
  ThemeManager.Reload;
end;

end.

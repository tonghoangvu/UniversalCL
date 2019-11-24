unit Form.ImageBackground;

interface

uses
  UCL.Classes, UCL.TUThemeManager, UCL.TUForm, UCL.Utils,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  UCL.TUQuickButton, UCL.TUCaptionBar, UCL.TUTitleBar, UCL.TUSlider,
  UCL.TUButton, UCL.TUCheckBox, UCL.TURadioButton, UCL.TUSeparator,
  UCL.TUProgressBar, Vcl.StdCtrls, UCL.TUText, UCL.TUEdit,
  UCL.TUSymbolButton, UCL.TUItemButton, UCL.TUPanel, UCL.TUShadow;

type
  TformImageBackground = class(TUForm)
    imgBackground: TImage;
    AppTheme: TUThemeManager;
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
    buttonWinClose: TUQuickButton;
    buttonWinMin: TUQuickButton;
    buttonCancel: TUButton;
    shadowMenu: TUShadow;
    entryChooseTheme: TUText;
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

{$R *.dfm}

procedure TformImageBackground.FormCreate(Sender: TObject);
begin
//  EnableBlur(Handle, 3);

  ThemeManager := AppTheme;
end;

procedure TformImageBackground.radioSystemThemeClick(Sender: TObject);
begin
  AppTheme.UseSystemTheme := true;
  AppTheme.Reload;
end;

procedure TformImageBackground.radioLightThemeClick(Sender: TObject);
begin
  AppTheme.CustomTheme := utLight;
  AppTheme.UseSystemTheme := false;
  AppTheme.Reload;
end;

procedure TformImageBackground.radioDarkThemeClick(Sender: TObject);
begin
  AppTheme.CustomTheme := utDark;
  AppTheme.UseSystemTheme := false;
  AppTheme.Reload;
end;

end.

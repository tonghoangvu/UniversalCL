unit Form.ImageBackground;

interface

uses
  UCL.Classes, UCL.TUThemeManager, UCL.TUForm, UCL.Utils,

  UCL.TUQuickButton, UCL.TUCaptionBar, UCL.TUTitleBar, UCL.TUSlider,
  UCL.TUButton, UCL.TUCheckBox, UCL.TURadioButton, UCL.TUSeparator,
  UCL.TUProgressBar, Vcl.StdCtrls, UCL.TUText, UCL.TUEdit,
  UCL.TUSymbolButton, UCL.TUItemButton, UCL.TUPanel, UCL.TUShadow,

  System.SysUtils, System.Variants, System.Classes,
  Winapi.Windows, Winapi.Messages,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg;

type
  TformImageBackground = class(TUForm)
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

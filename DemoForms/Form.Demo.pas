unit Form.Demo;

interface

uses
  //  UCL units
  UCL.TUThemeManager,
  UCL.Utils, UCL.Classes, UCL.SystemSettings, UCL.IntAnimation, UCL.IntAnimation.Helpers,
  UCL.TUForm, UCL.TUScrollBox, UCL.TUCheckBox, UCL.TUProgressBar, UCL.TUHyperLink,
  UCL.TUPanel, UCL.TUSymbolButton, UCL.TUButton, UCL.TUText, UCL.TUCaptionBar, UCL.TURadioButton,
  UCL.TUSlider, UCL.TUSeparator, UCL.TUEdit, UCL.TUItemButton, UCL.TUQuickButton,
  UCL.TUPopupMenu,

  //  Winapi units
  Winapi.Windows, Winapi.Messages,

  //  System units
  System.SysUtils, System.Variants, System.Classes, System.Types, System.ImageList,

  //  VCL units
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.Buttons, Vcl.ImgList, Vcl.Imaging.pngimage;

type
  TformDemo = class(TUForm)
    AppTheme: TUThemeManager;
    drawerNavigation: TUPanel;
    buttonOpenMenu: TUSymbolButton;
    buttonMenuSettings: TUSymbolButton;
    buttonMenuProfile: TUSymbolButton;
    buttonMenuSave: TUSymbolButton;
    buttonMenuOpen: TUSymbolButton;
    buttonMenuRate: TUSymbolButton;
    captionbarNewStyle: TUCaptionBar;
    dialogSelectColor: TColorDialog;
    panelRibbon: TUScrollBox;
    buttonGoBack: TUSymbolButton;
    separator1: TUSeparator;
    buttonGoHome: TUSymbolButton;
    buttonNewDoc: TUSymbolButton;
    buttonOpenDoc: TUSymbolButton;
    buttonPrintDoc: TUSymbolButton;
    buttonSaveDoc: TUSymbolButton;
    separator2: TUSeparator;
    linkConnected: TUHyperLink;
    linkCustomColor: TUHyperLink;
    linkDisabled: TUHyperLink;
    buttonNoFocus: TUButton;
    buttonCanFocus: TUButton;
    buttonCustomColor: TUButton;
    buttonReloadSettings: TUSymbolButton;
    buttonHighlight: TUButton;
    buttonDisabled: TUButton;
    buttonToggle: TUButton;
    radioA1: TURadioButton;
    radioA2: TURadioButton;
    radioA3: TURadioButton;
    radioB1: TURadioButton;
    radioB2: TURadioButton;
    check2State: TUCheckBox;
    check3State: TUCheckBox;
    itembuttonImage: TUItemButton;
    itembuttonFontIcon: TUItemButton;
    symbolButtonOpenDisabled: TUSymbolButton;
    symbolbuttonSaveHorz: TUSymbolButton;
    symbolbuttonSaveVert: TUSymbolButton;
    progressVert: TUProgressBar;
    buttonRandomProgress: TUButton;
    progressCustomColor: TUProgressBar;
    progressConnected: TUProgressBar;
    textDescription: TUText;
    textNormal: TUText;
    textEntry: TUText;
    textHeading: TUText;
    textTitle: TUText;
    buttonRunning: TButton;
    buttonAniStart: TButton;
    buttonAniInverse: TButton;
    buttonWithImage: TUButton;
    sliderHorz: TUSlider;
    sliderDisabled: TUSlider;
    sliderVert: TUSlider;
    buttonAppBack: TUQuickButton;
    buttonAppQuit: TUQuickButton;
    buttonAppMaximized: TUQuickButton;
    buttonAppMinimized: TUQuickButton;
    comboAppDPI: TComboBox;
    boxSmoothScrolling: TUScrollBox;
    headingSettings: TUText;
    entryAppTheme: TUText;
    radioDefaultTheme: TURadioButton;
    radioLightTheme: TURadioButton;
    radioDarkTheme: TURadioButton;
    panelSelectAccentColor: TUPanel;
    checkColorBorder: TUCheckBox;
    entryUserProfile: TUText;
    imgAvatar: TImage;
    checkAutoSync: TUCheckBox;
    checkKeepEmailPrivate: TUCheckBox;
    checkSendEmail: TUCheckBox;
    buttonDeleteAccount: TUButton;
    entryAccountType: TUText;
    radioFreeAccount: TURadioButton;
    radioProAccount: TURadioButton;
    radioDevAccount: TURadioButton;
    desAccountHint: TUText;
    buttonUpgradeAccount: TUButton;
    entryStorage: TUText;
    desStorageHint: TUText;
    progressStorageUsed: TUProgressBar;
    headingAbout: TUText;
    buttonCheckUpdate: TUButton;
    desAppVersion: TUText;
    desFlashVersion: TUText;
    desChromiumVersion: TUText;
    linkEmbarcadero: TUHyperLink;
    USeparator1: TUSeparator;
    popupVert: TUPopupMenu;
    popupHorz: TUPopupMenu;
    editAccountName: TUEdit;
    comboAppBorderStyle: TComboBox;
    checkTransparency: TUCheckBox;
    procedure buttonReloadSettingsClick(Sender: TObject);
    procedure buttonAniStartClick(Sender: TObject);
    procedure buttonRandomProgressClick(Sender: TObject);
    procedure buttonAniInverseClick(Sender: TObject);
    procedure buttonOpenMenuClick(Sender: TObject);
    procedure radioDefaultThemeClick(Sender: TObject);
    procedure radioLightThemeClick(Sender: TObject);
    procedure radioDarkThemeClick(Sender: TObject);
    procedure panelSelectAccentColorClick(Sender: TObject);
    procedure buttonMenuSettingsClick(Sender: TObject);
    procedure sliderHorzChange(Sender: TObject);
    procedure popupHorzItemClick(Sender: TObject; Index: Integer);
    procedure AppThemeUpdate(Sender: TObject);
    procedure comboAppDPIChange(Sender: TObject);
    procedure itembuttonImageClick(Sender: TObject);
    procedure buttonPrintDocClick(Sender: TObject);
    procedure comboAppBorderStyleChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure checkTransparencyClick(Sender: TObject);

  private

  public

  end;

var
  formDemo: TformDemo;

implementation

uses
  Form.LoginDialog;

{$R *.dfm}

{ MAIN FORM }

procedure TformDemo.itembuttonImageClick(Sender: TObject);
var
  ObjName: string;
begin
  case itembuttonImage.ObjectSelected of
    iokNone:
      ObjName := 'Background';
    iokCheckBox:
      ObjName := 'Checkbox';
    iokLeftIcon:
      ObjName := 'Left icon';
    iokText:
      ObjName := 'Text';
    iokDetail:
      ObjName := 'Detail';
    iokRightIcon:
      ObjName := 'Right icon';
  end;

  itembuttonImage.Detail := ObjName;
end;

{ ANIMATION BUTTON }

procedure TformDemo.buttonAniStartClick(Sender: TObject);
var
  AniLength: Integer;
begin
  AniLength := 210;
  AniLength := Round(AniLength * PPI / 96); //  Scale animation length
  buttonRunning.AnimationFromCurrent(apLeft, +AniLength, 25, 250, akOut, afkQuartic,
    procedure begin buttonRunning.SetFocus end);
end;

procedure TformDemo.buttonAniInverseClick(Sender: TObject);
var
  AniLength: Integer;
begin
  AniLength := 210;
  AniLength := Round(AniLength * PPI / 96); //  Scale animation length
  buttonRunning.AnimationFromCurrent(apLeft, -AniLength, 25, 250, akOut, afkQuartic,
    procedure begin buttonRunning.SetFocus end);
end;

procedure TformDemo.buttonMenuSettingsClick(Sender: TObject);
var
  DPI: Single;
  AniDelta: Integer;
begin
  DPI := Self.PPI / 96;

  boxSmoothScrolling.DisableAlign;
  boxSmoothScrolling.SetOldScrollBarVisible(false);

  if boxSmoothScrolling.Width = 0 then
    AniDelta := Round(DPI * 250)
  else
    AniDelta := - boxSmoothScrolling.Width;

  boxSmoothScrolling.AnimationFromCurrent(apWidth, AniDelta, 20, 200, akOut, afkQuartic,
    procedure begin boxSmoothScrolling.EnableAlign end);
end;

procedure TformDemo.buttonOpenMenuClick(Sender: TObject);
var
  DPI: Single;
  AniWidth: Integer;
begin
  DPI := PPI / 96;
  AniWidth := Round((225 - 45 ) * DPI);
  if drawerNavigation.Width <> Round(45 * DPI) then
    AniWidth := - AniWidth;

  drawerNavigation.AnimationFromCurrent(apWidth, AniWidth, 20, 200, akOut, afkQuartic, nil);
end;

procedure TformDemo.buttonPrintDocClick(Sender: TObject);
begin
  formLoginDialog.ShowModal;
end;

{ THEME }

procedure TformDemo.AppThemeUpdate(Sender: TObject);
begin
  //  Active color changed
  panelSelectAccentColor.CustomBackColor := AppTheme.AccentColor;

  //  Color on border setting changed
  if AppTheme.ColorOnBorder = true then
    checkColorBorder.State := cbsChecked
  else
    checkColorBorder.State := cbsUnchecked;
end;

procedure TformDemo.buttonReloadSettingsClick(Sender: TObject);
begin
  AppTheme.ReloadAutoSettings;
end;

procedure TformDemo.checkTransparencyClick(Sender: TObject);
begin
  GlassFrame.Enabled := checkTransparency.State = cbsChecked;
end;

procedure TformDemo.comboAppBorderStyleChange(Sender: TObject);
begin
  case comboAppBorderStyle.ItemIndex of
    0:  BorderStyle := bsDialog;
    1:  BorderStyle := bsSingle;
    2:  BorderStyle := bsSizeable;
    3:  BorderStyle := bsToolWindow;
    4:  BorderStyle := bsSizeToolWin;
  end;
end;

procedure TformDemo.comboAppDPIChange(Sender: TObject);
var
  NewPPI: Integer;
begin
  case comboAppDPI.ItemIndex of
    1: NewPPI := 120;
    2: NewPPI := 144;
    3: NewPPI := 168;
    else
      NewPPI := 96;
  end;

  Self.PPI := NewPPI;
  ScaleForPPI(NewPPI);
end;

procedure TformDemo.FormCreate(Sender: TObject);
begin
  //  EnableBlur(Handle, 3);

  ThemeManager := AppTheme;
  CaptionBar := captionbarNewStyle;

  //  PUT ALL CUSTOM THEME HERE
  //  Default system settings will automatic load at app startup
  //  Don't change directly TUThemeManager component with Custom Properties
  //  Such as CustomTheme, CustomAccentColor
  //  Put them here
  //  Example:
  //  AppTheme.CustomTheme := utDark;
end;

procedure TformDemo.panelSelectAccentColorClick(Sender: TObject);
var
  NewColor: TColor;
begin
  //  Open dialog
  if dialogSelectColor.Execute = true then
    begin
      NewColor := dialogSelectColor.Color;

      //  Change accent color
      AppTheme.CustomAccentColor := NewColor;
      panelSelectAccentColor.CustomBackColor := NewColor;
    end;
end;

{ POPUP MENU }

procedure TformDemo.popupHorzItemClick(Sender: TObject; Index: Integer);
begin
  Self.SetFocus;
  case Index of
    0:  ShowMessage('Cut');
    1:  ShowMessage('Copy');
    2:  ShowMessage('Paste');
  end;
end;

{ APP THEME SETTINGS }

procedure TformDemo.radioDefaultThemeClick(Sender: TObject);
begin
  AppTheme.UseSystemTheme := true;
end;

procedure TformDemo.radioLightThemeClick(Sender: TObject);
begin
  AppTheme.CustomTheme := utLight;
end;

procedure TformDemo.radioDarkThemeClick(Sender: TObject);
begin
  AppTheme.CustomTheme := utDark;
end;

{ CONTROLS }

procedure TformDemo.sliderHorzChange(Sender: TObject);
begin
  //  Change progress bar value
  progressConnected.Value := sliderHorz.Value;
end;

procedure TformDemo.buttonRandomProgressClick(Sender: TObject);
begin
  Randomize;
  progressCustomColor.GoToValue(Random(101));
  progressConnected.GoToValue(Random(101));
  progressVert.GoToValue(Random(101));
end;

end.

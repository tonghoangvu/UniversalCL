unit Form.Demo;

interface

uses
  //  UCL units
  UCL.Utils, UCL.Classes, UCL.SystemSettings, UCL.IntAnimation, UCL.IntAnimation.Helpers, UCL.TUThemeManager,
  UCL.TUForm, UCL.TUSwitch, UCL.TUScrollBox, UCL.TUCheckBox, UCL.TUProgressBar, UCL.TUHyperLink,
  UCL.TUPanel, UCL.TUSymbolButton, UCL.TUButton, UCL.TUText, UCL.TUCaptionBar, UCL.TURadioButton,
  UCL.TUSlider, UCL.TUSeparator, UCL.TUEdit, UCL.TUItemButton, UCL.TUQuickButton, UCL.TUBorder,
  UCL.TUPopupMenu,

  //  Winapi units
  Winapi.Windows, Winapi.Messages,

  //  System units
  System.SysUtils, System.Variants, System.Classes, System.Types, System.ImageList,

  //  VCL units
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.Buttons, Vcl.ImgList, Vcl.VirtualImageList,
  Vcl.BaseImageCollection, Vcl.ImageCollection, Vcl.Imaging.pngimage;

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
    imgcollectionMain: TImageCollection;
    imglistMain: TVirtualImageList;
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
    procedure FormCreate(Sender: TObject);
    procedure buttonReloadSettingsClick(Sender: TObject);
    procedure buttonAniStartClick(Sender: TObject);
    procedure buttonRandomProgressClick(Sender: TObject);
    procedure buttonAniInverseClick(Sender: TObject);
    procedure buttonOpenMenuClick(Sender: TObject);
    procedure radioDefaultThemeClick(Sender: TObject);
    procedure radioLightThemeClick(Sender: TObject);
    procedure radioDarkThemeClick(Sender: TObject);
    procedure panelSelectAccentColorClick(Sender: TObject);
    procedure buttonAppQuitClick(Sender: TObject);
    procedure buttonMenuSettingsClick(Sender: TObject);
    procedure buttonAppMaximizedClick(Sender: TObject);
    procedure buttonAppMinimizedClick(Sender: TObject);
    procedure sliderHorzChange(Sender: TObject);
    procedure popupHorzItemClick(Sender: TObject; Index: Integer);
    procedure AppThemeUpdate(Sender: TObject);
    procedure comboAppDPIChange(Sender: TObject);
    procedure itembuttonImageClick(Sender: TObject);
    procedure buttonPrintDocClick(Sender: TObject);
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

procedure TformDemo.FormCreate(Sender: TObject);
begin
  Self.ThemeManager := AppTheme;
end;

procedure TformDemo.itembuttonImageClick(Sender: TObject);
var
  MsgText: string;
begin
  case itembuttonImage.ObjectSelected of
    iokNone:
      MsgText := 'You clicked in background';
    iokCheckBox:
      MsgText := 'You clicked in checkbox';
    iokLeftIcon:
      MsgText := 'You clicked in left icon';
    iokText:
      MsgText := 'You clicked in text';
    iokDetail:
      MsgText := 'You clicked in detail';
    iokRightIcon:
      MsgText := 'You clicked in right icon';
  end;
  ShowMessage(MsgText);
end;

{ SYSBUTTON }

procedure TformDemo.buttonAppMaximizedClick(Sender: TObject);
begin
  if WindowState <> wsMaximized then
    WindowState := wsMaximized
  else
    WindowState := wsNormal;
end;

procedure TformDemo.buttonAppMinimizedClick(Sender: TObject);
begin
  WindowState := wsMinimized;
end;

procedure TformDemo.buttonAppQuitClick(Sender: TObject);
begin
  Self.Close;
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
  buttonAppBack.LightColor := AppTheme.AccentColor;
  buttonAppBack.DarkColor := AppTheme.AccentColor;

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

procedure TformDemo.panelSelectAccentColorClick(Sender: TObject);
var
  NewColor: TColor;
begin
  //  Open dialog
  if dialogSelectColor.Execute = true then
    begin
      NewColor := dialogSelectColor.Color;

      //  Change accent color
      AppTheme.AccentColor := NewColor;
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
  AppTheme.AutoTheme := true;
end;

procedure TformDemo.radioLightThemeClick(Sender: TObject);
begin
  AppTheme.Theme := utLight;
end;

procedure TformDemo.radioDarkThemeClick(Sender: TObject);
begin
  AppTheme.Theme := utDark;
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

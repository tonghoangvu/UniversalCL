unit Form.Demo;

interface

uses
  flatsb,
  UCL.Utils,
  UCL.Classes, UCL.SystemSettings, UCL.IntAnimation, UCL.TUThemeManager,
  UCL.TUForm, UCL.TUSwitch, UCL.TUScrollBox, UCL.TUCheckBox, UCL.TUProgressBar, UCL.TUHyperLink,
  UCL.TUPanel, UCL.TUSymbolButton, UCL.TUButton, UCL.TUText, UCL.TUCaptionBar, UCL.TURadioButton,
  UCL.TUPopupBox,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, System.Types, Vcl.WinXCtrls,
  Vcl.Imaging.pngimage, Vcl.WinXPanels, Vcl.Menus, UCL.TUPopupMenu, UCL.TUSeparator, UCL.TUEdit, Vcl.Buttons,
  Vcl.Samples.Gauges, UCL.TUItemButton;

type
  TFormDemo = class(TUForm)
    UThemeManager1: TUThemeManager;
    symbolbuttonSaveVert: TUSymbolButton;
    symbolbuttonSaveHorz: TUSymbolButton;
    buttonRunning: TButton;
    symbolButtonOpenDisabled: TUSymbolButton;
    captionbarOldStyle: TUCaptionBar;
    buttonNoFocus: TUButton;
    buttonDisabled: TUButton;
    textTitle: TUText;
    textHeading: TUText;
    textEntry: TUText;
    textNormal: TUText;
    textDescription: TUText;
    linkConnected: TUHyperLink;
    linkCustomColor: TUHyperLink;
    linkDisabled: TUHyperLink;
    buttonReloadSettings: TUSymbolButton;
    buttonAniStart: TButton;
    progressCustomColor: TUProgressBar;
    progressConnected: TUProgressBar;
    buttonRandomProgress: TUButton;
    buttonAniInverse: TButton;
    progressVert: TUProgressBar;
    buttonCanFocus: TUButton;
    buttonHighlight: TUButton;
    drawerNavigation: TUPanel;
    buttonOpenMenu: TUSymbolButton;
    buttonMenuSettings: TUSymbolButton;
    buttonMenuProfile: TUSymbolButton;
    buttonMenuSave: TUSymbolButton;
    buttonMenuOpen: TUSymbolButton;
    buttonMenuRate: TUSymbolButton;
    boxSmoothScrolling: TUScrollBox;
    buttonCustomColor: TUButton;
    check2State: TUCheckBox;
    check3State: TUCheckBox;
    captionbarNewStyle: TUCaptionBar;
    radioA1: TURadioButton;
    radioA2: TURadioButton;
    radioB1: TURadioButton;
    radioA3: TURadioButton;
    radioB2: TURadioButton;
    UText1: TUText;
    UText2: TUText;
    UCheckBox1: TUCheckBox;
    UCheckBox2: TUCheckBox;
    UButton1: TUButton;
    UText3: TUText;
    URadioButton1: TURadioButton;
    URadioButton2: TURadioButton;
    URadioButton3: TURadioButton;
    UText4: TUText;
    UText5: TUText;
    UText6: TUText;
    UProgressBar1: TUProgressBar;
    Image1: TImage;
    UText7: TUText;
    UText8: TUText;
    UText9: TUText;
    UText10: TUText;
    UButton2: TUButton;
    UHyperLink1: TUHyperLink;
    UButton3: TUButton;
    UCheckBox3: TUCheckBox;
    UText11: TUText;
    URadioButton4: TURadioButton;
    URadioButton5: TURadioButton;
    URadioButton6: TURadioButton;
    dialogSelectColor: TColorDialog;
    UPanel1: TUPanel;
    UText12: TUText;
    UCheckBox4: TUCheckBox;
    popupboxDemo: TUPopupBox;
    USymbolButton4: TUSymbolButton;
    USymbolButton5: TUSymbolButton;
    USymbolButton6: TUSymbolButton;
    popupDemo: TUPopupMenu;
    buttonClosePopup: TUSymbolButton;
    buttonToggle: TUButton;
    panelRibbon: TUScrollBox;
    buttonGoBack: TUSymbolButton;
    separator1: TUSeparator;
    buttonGoHome: TUSymbolButton;
    buttonNewDoc: TUSymbolButton;
    buttonOpenDoc: TUSymbolButton;
    buttonPrintDoc: TUSymbolButton;
    buttonSaveDoc: TUSymbolButton;
    separator2: TUSeparator;
    buttonAppBack: TUButton;
    buttonAppQuit: TUButton;
    editAccountName: TUEdit;
    UItemButton1: TUItemButton;
    procedure FormCreate(Sender: TObject);
    procedure buttonReloadSettingsClick(Sender: TObject);
    procedure buttonAniStartClick(Sender: TObject);
    procedure buttonRandomProgressClick(Sender: TObject);
    procedure buttonAniInverseClick(Sender: TObject);
    procedure buttonOpenMenuClick(Sender: TObject);
    procedure URadioButton4Click(Sender: TObject);
    procedure URadioButton5Click(Sender: TObject);
    procedure URadioButton6Click(Sender: TObject);
    procedure UPanel1Click(Sender: TObject);
    procedure UCheckBox4Click(Sender: TObject);
    procedure buttonClosePopupClick(Sender: TObject);
    procedure symbolbuttonSaveVertClick(Sender: TObject);
    procedure buttonAppQuitClick(Sender: TObject);
    procedure buttonMenuSettingsClick(Sender: TObject);
    procedure symbolbuttonSaveHorzClick(Sender: TObject);

  private

  public

  end;

var
  FormDemo: TFormDemo;

implementation

{$R *.dfm}

procedure TFormDemo.buttonAniStartClick(Sender: TObject);
var
  Ani: TIntAni;
begin
  Ani := TIntAni.Create(akOut, afkQuartic, buttonRunning.Left, buttonRunning.Left + 200, procedure (Value: Integer)
    begin
      buttonRunning.Left := Value;
    end, true);
  Ani.Start;
end;

procedure TFormDemo.buttonAniInverseClick(Sender: TObject);
var
  Ani: TIntAni;
begin
  Ani := TIntAni.Create(akOut, afkQuartic, buttonRunning.Left, buttonRunning.Left - 200, procedure (Value: Integer)
    begin
      buttonRunning.Left := Value;
    end, true);
  Ani.Start;
end;

procedure TFormDemo.FormCreate(Sender: TObject);
begin
  Self.ThemeManager := UThemeManager1;
end;

procedure TFormDemo.symbolbuttonSaveHorzClick(Sender: TObject);
begin
  ShowMessage(popupboxDemo.Width.ToString + sLineBreak + popupboxDemo.Height.ToString);
end;

procedure TFormDemo.symbolbuttonSaveVertClick(Sender: TObject);
begin
  ShowMessage('Your document was saved');
end;

procedure TFormDemo.buttonAppQuitClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormDemo.UCheckBox4Click(Sender: TObject);
begin
  if UCheckBox4.State = cbsChecked then
    UThemeManager1.ColorOnBorderKind := cobkTrue
  else
    UThemeManager1.ColorOnBorderKind := cobkFalse;
end;

procedure TFormDemo.UPanel1Click(Sender: TObject);
var
  NewColor: TColor;
begin
  if dialogSelectColor.Execute = true then
    begin
      NewColor := dialogSelectColor.Color;

      UThemeManager1.CustomColor := NewColor;
      UThemeManager1.UseAccentColor := false;

      UPanel1.CustomBackColor := NewColor;
    end;
end;

procedure TFormDemo.URadioButton4Click(Sender: TObject);
begin
  UThemeManager1.ThemeKind := tkAuto;
end;

procedure TFormDemo.URadioButton5Click(Sender: TObject);
begin
  UThemeManager1.ThemeKind := tkLight;
end;

procedure TFormDemo.URadioButton6Click(Sender: TObject);
begin
  UThemeManager1.ThemeKind := tkDark;
end;

procedure TFormDemo.buttonClosePopupClick(Sender: TObject);
begin
  Self.SetFocus;  //  Set focus to main form to close popup
end;

procedure TFormDemo.buttonMenuSettingsClick(Sender: TObject);
var
  NewWidth: Integer;
  Ani: TIntAni;
begin
  boxSmoothScrolling.HideScrollBar;

  if boxSmoothScrolling.Width <> 0 then
    NewWidth := 0 //  Go to 40 (close menu)
  else
    NewWidth := 250; //  Go to 220 (open menu)

  Ani := TIntAni.Create(akOut, afkQuartic, boxSmoothScrolling.Width, NewWidth,
    procedure (Value: Integer)
    begin
      boxSmoothScrolling.Width := Value;
    end, true);
  Ani.Step := 20;
  Ani.Duration := 200;

  Ani.Start;
end;

procedure TFormDemo.buttonRandomProgressClick(Sender: TObject);
begin
  Randomize;
  progressCustomColor.GoToValue(Random(101));
  progressConnected.GoToValue(Random(101));
  progressVert.GoToValue(Random(101));
end;

procedure TFormDemo.buttonOpenMenuClick(Sender: TObject);
var
  NewPos: Integer;
  Ani: TIntAni;
  DPI: Single;
begin
  DPI := Self.PixelsPerInch / 96;
  if drawerNavigation.Width <> Round(40 * DPI) then
    NewPos := Round(40 * DPI) // Go to 40 (close menu)
  else
    NewPos := Round(220 * DPI); // 220:40 and DPI change

  Ani := TIntAni.Create(akOut, afkQuartic, drawerNavigation.Width, NewPos,
    procedure (Value: Integer)
    begin
      drawerNavigation.Width := Value;
    end, true);
  Ani.Step := 20;
  Ani.Duration := 200;

  Ani.Start;
end;

procedure TFormDemo.buttonReloadSettingsClick(Sender: TObject);
begin
  UThemeManager1.ReloadAutoSettings;
end;

end.

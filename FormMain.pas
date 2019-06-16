unit FormMain;

interface

uses
  flatsb,
  UCL.Utils,
  UCL.Classes, UCL.SystemSettings, UCL.IntAnimation, UCL.TUThemeManager,
  UCL.TUForm, UCL.TUSwitch, UCL.TUScrollBox, UCL.TUCheckBox, UCL.TUProgressBar, UCL.TUHyperLink,
  UCL.TUPanel, UCL.TUSymbolButton, UCL.TUButton, UCL.TUText, UCL.TUCaptionBar, UCL.TURadioButton,
  UCL.TUPopupMenu,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, System.Types, Vcl.WinXCtrls,
  Vcl.Imaging.pngimage, Vcl.WinXPanels, Vcl.Menus;

type
  TMainForm = class(TUForm)
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
    panelConnected: TUPanel;
    buttonReloadSettings: TUSymbolButton;
    buttonAniStart: TButton;
    progressCustomColor: TUProgressBar;
    progressConnected: TUProgressBar;
    buttonRandomProgress: TUButton;
    buttonAniInverse: TButton;
    progressVert: TUProgressBar;
    buttonCanFocus1: TUButton;
    buttonCanFocus2: TUButton;
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
    ColorDialog1: TColorDialog;
    UPanel1: TUPanel;
    UText12: TUText;
    UCheckBox4: TUCheckBox;
    Panel1: TPanel;
    USymbolButton1: TUSymbolButton;
    USymbolButton2: TUSymbolButton;
    USymbolButton3: TUSymbolButton;
    UPopupMenu1: TUPopupMenu;
    USymbolButton5: TUSymbolButton;
    USymbolButton6: TUSymbolButton;
    USymbolButton4: TUSymbolButton;
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
    procedure panelConnectedMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure USymbolButton5Click(Sender: TObject);

  private

  public

  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.buttonAniStartClick(Sender: TObject);
var
  Ani: TIntAni;
begin
  Ani := TIntAni.Create(akOut, afkQuartic, buttonRunning.Left, buttonRunning.Left + 200, procedure (Value: Integer)
    begin
      buttonRunning.Left := Value;
    end, true);
  Ani.Start;
end;

procedure TMainForm.buttonAniInverseClick(Sender: TObject);
var
  Ani: TIntAni;
begin
  Ani := TIntAni.Create(akOut, afkQuartic, buttonRunning.Left, buttonRunning.Left - 200, procedure (Value: Integer)
    begin
      buttonRunning.Left := Value;
    end, true);
  Ani.Start;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Self.ThemeManager := UThemeManager1;
end;

procedure TMainForm.panelConnectedMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
    UPopupMenu1.Popup;
end;

procedure TMainForm.UCheckBox4Click(Sender: TObject);
begin
  if UCheckBox4.State = cbsChecked then
    UThemeManager1.ColorOnBorderKind := cobkTrue
  else
    UThemeManager1.ColorOnBorderKind := cobkFalse;
end;

procedure TMainForm.UPanel1Click(Sender: TObject);
var
  NewColor: TColor;
begin
  if ColorDialog1.Execute = true then
    begin
      NewColor := ColorDialog1.Color;

      UThemeManager1.CustomColor := NewColor;
      UThemeManager1.UseAccentColor := false;

      UPanel1.CustomBackColor := NewColor;
    end;
end;

procedure TMainForm.URadioButton4Click(Sender: TObject);
begin
  UThemeManager1.ThemeKind := tkAuto;
end;

procedure TMainForm.URadioButton5Click(Sender: TObject);
begin
  UThemeManager1.ThemeKind := tkLight;
end;

procedure TMainForm.URadioButton6Click(Sender: TObject);
begin
  UThemeManager1.ThemeKind := tkDark;
end;

procedure TMainForm.USymbolButton5Click(Sender: TObject);
begin
  self.SetFocus;
end;

procedure TMainForm.buttonRandomProgressClick(Sender: TObject);
begin
  Randomize;
  progressCustomColor.GoToValue(Random(101));
  progressConnected.GoToValue(Random(101));
  progressVert.GoToValue(Random(101));
end;

procedure TMainForm.buttonOpenMenuClick(Sender: TObject);
begin
  var a, b: Integer;
  if drawerNavigation.Width <> 40 then
    begin
      a := 250;
      b := 40;
    end
  else
    begin
      a := 40;
      b := 250;
    end;

  var Ani := TIntAni.Create(akOut, afkQuartic, a, b,
    procedure (Value: Integer)
    begin
      drawerNavigation.Width := Value;
    end, true);
  Ani.Step := 22;
  Ani.Duration := 220;
  Ani.Start;
end;

procedure TMainForm.buttonReloadSettingsClick(Sender: TObject);
begin
  UThemeManager1.ReloadAutoSettings;
end;

end.

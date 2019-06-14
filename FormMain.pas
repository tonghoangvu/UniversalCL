unit FormMain;

interface

uses
  UCL.Classes, UCL.SystemSettings, UCL.IntAnimation, UCL.TUThemeManager,
  UCL.TUForm, UCL.TUSwitch, UCL.TUScrollBox, UCL.TUCheckBox, UCL.TUProgressBar, UCL.TUHyperLink,
  UCL.TUPanel, UCL.TUSymbolButton, UCL.TUButton, UCL.TUText, UCL.TUCaptionBar, UCL.TURadioButton,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, System.Types, Vcl.WinXCtrls;

type
  TMainForm = class(TUForm)
    UThemeManager1: TUThemeManager;
    buttonFormBorderColor: TButton;
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
    panelDisconnected: TUPanel;
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
    switchChangeTheme: TUSwitch;
    switchCustomColor: TUSwitch;
    boxSmoothScrolling: TUScrollBox;
    buttonCustomColor: TUButton;
    check2State: TUCheckBox;
    check3State: TUCheckBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    captionbarNewStyle: TUCaptionBar;
    radioA1: TURadioButton;
    radioA2: TURadioButton;
    radioB1: TURadioButton;
    radioA3: TURadioButton;
    radioB2: TURadioButton;
    Edit1: TEdit;
    Memo1: TMemo;
    Panel1: TPanel;
    RadioButton1: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure buttonFormBorderColorClick(Sender: TObject);
    procedure buttonReloadSettingsClick(Sender: TObject);
    procedure buttonAniStartClick(Sender: TObject);
    procedure buttonRandomProgressClick(Sender: TObject);
    procedure buttonAniInverseClick(Sender: TObject);
    procedure buttonOpenMenuClick(Sender: TObject);
    procedure switchChangeThemeClick(Sender: TObject);
  private

  public

  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.buttonFormBorderColorClick(Sender: TObject);
begin
  if UThemeManager1.ColorOnBorderKind <> cobkTrue then
    UThemeManager1.ColorOnBorderKind := cobkTrue
  else
    UThemeManager1.ColorOnBorderKind := cobkFalse;
end;

procedure TMainForm.buttonAniStartClick(Sender: TObject);
var
  Ani: TIntAni;
begin
  Ani := TIntAni.Create(akOut, afkQuartic, buttonRunning.Left, buttonRunning.Left + 300, procedure (Value: Integer)
    begin
      buttonRunning.Left := Value;
    end, true);
  Ani.Start;
end;

procedure TMainForm.buttonAniInverseClick(Sender: TObject);
var
  Ani: TIntAni;
begin
  Ani := TIntAni.Create(akOut, afkQuartic, buttonRunning.Left, buttonRunning.Left - 300, procedure (Value: Integer)
    begin
      buttonRunning.Left := Value;
    end, true);
  Ani.Start;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Self.ThemeManager := UThemeManager1;
end;

procedure TMainForm.switchChangeThemeClick(Sender: TObject);
begin
  if UThemeManager1.Theme <> utLight then
    UThemeManager1.ThemeKind := tkLight
  else
    UThemeManager1.ThemeKind := tkDark;
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

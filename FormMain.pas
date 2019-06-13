unit FormMain;

interface

uses

  UCL.Classes, UCL.SystemSettings, UCL.IntAnimation, UCL.TUThemeManager,
  UCL.TUForm, UCL.TUSwitch, UCL.TUScrollBox, UCL.TUCheckBox, UCL.TUProgressBar, UCL.TUHyperLink,
  UCL.TUPanel, UCL.TUSymbolButton, UCL.TUButton, UCL.TUText, UCL.TUCaptionBar,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.WinXCtrls;

type
  TMainForm = class(TUForm)
    UThemeManager1: TUThemeManager;
    buttonFormBorderColor: TButton;
    captionbarNewStyle: TUCaptionBar;
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
    USymbolButton11: TUSymbolButton;
    USymbolButton12: TUSymbolButton;
    USymbolButton13: TUSymbolButton;
    USymbolButton14: TUSymbolButton;
    USymbolButton15: TUSymbolButton;
    USymbolButton29: TUSymbolButton;
    USymbolButton20: TUSymbolButton;
    USymbolButton30: TUSymbolButton;
    USymbolButton16: TUSymbolButton;
    USymbolButton17: TUSymbolButton;
    USymbolButton18: TUSymbolButton;
    USymbolButton19: TUSymbolButton;
    USymbolButton25: TUSymbolButton;
    USymbolButton26: TUSymbolButton;
    USymbolButton27: TUSymbolButton;
    USymbolButton28: TUSymbolButton;
    USymbolButton31: TUSymbolButton;
    USymbolButton32: TUSymbolButton;
    USymbolButton33: TUSymbolButton;
    USymbolButton34: TUSymbolButton;
    USymbolButton35: TUSymbolButton;
    USymbolButton36: TUSymbolButton;
    USymbolButton37: TUSymbolButton;
    USymbolButton38: TUSymbolButton;
    USymbolButton39: TUSymbolButton;
    USymbolButton40: TUSymbolButton;
    USymbolButton41: TUSymbolButton;
    USymbolButton42: TUSymbolButton;
    USymbolButton43: TUSymbolButton;
    USymbolButton44: TUSymbolButton;
    USymbolButton45: TUSymbolButton;
    USymbolButton46: TUSymbolButton;
    buttonCustomColor: TUButton;
    check2State: TUCheckBox;
    check3State: TUCheckBox;
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
  if ThemeManager.Theme <> utLight then
    ThemeManager.ThemeKind := tkLight
  else
    ThemeManager.ThemeKind := tkDark;
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

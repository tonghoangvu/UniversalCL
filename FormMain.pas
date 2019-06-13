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
    Button1: TButton;
    UCaptionBar1: TUCaptionBar;
    USymbolButton1: TUSymbolButton;
    USymbolButton2: TUSymbolButton;
    Button3: TButton;
    USymbolButton3: TUSymbolButton;
    UCaptionBar2: TUCaptionBar;
    UButton1: TUButton;
    UButton2: TUButton;
    UText1: TUText;
    UText2: TUText;
    UText3: TUText;
    UText4: TUText;
    UText5: TUText;
    UHyperLink1: TUHyperLink;
    UHyperLink2: TUHyperLink;
    UHyperLink3: TUHyperLink;
    UPanel2: TUPanel;
    UPanel3: TUPanel;
    USymbolButton4: TUSymbolButton;
    Button2: TButton;
    UCheckBox1: TUCheckBox;
    UCheckBox2: TUCheckBox;
    UProgressBar1: TUProgressBar;
    UProgressBar2: TUProgressBar;
    UButton3: TUButton;
    Button4: TButton;
    UProgressBar3: TUProgressBar;
    UButton4: TUButton;
    UButton5: TUButton;
    Panel2: TUPanel;
    USymbolButton10: TUSymbolButton;
    USymbolButton5: TUSymbolButton;
    USymbolButton6: TUSymbolButton;
    USymbolButton7: TUSymbolButton;
    USymbolButton8: TUSymbolButton;
    USymbolButton9: TUSymbolButton;
    ToggleSwitch1: TUSwitch;
    USwitch3: TUSwitch;
    UScrollBox1: TUScrollBox;
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
    UButton6: TUButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure USymbolButton4Click(Sender: TObject);
    procedure UCheckBox1Click(Sender: TObject);
    procedure UCheckBox2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure UButton3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure USymbolButton10Click(Sender: TObject);
    procedure ToggleSwitch1Click(Sender: TObject);
  private

  public

  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.Button1Click(Sender: TObject);
begin
  if UThemeManager1.ColorOnBorderKind <> cobkTrue then
    UThemeManager1.ColorOnBorderKind := cobkTrue
  else
    UThemeManager1.ColorOnBorderKind := cobkFalse;
end;

procedure TMainForm.Button2Click(Sender: TObject);
var
  Ani: TIntAni;
begin
  Ani := TIntAni.Create(akOut, afkQuartic, button3.Left, button3.Left + 300, procedure (Value: Integer)
    begin
      Button3.Left := Value;
    end, true);
  Ani.Start;
end;

procedure TMainForm.Button4Click(Sender: TObject);
var
  Ani: TIntAni;
begin
  Ani := TIntAni.Create(akOut, afkQuartic, button3.Left, button3.Left - 300, procedure (Value: Integer)
    begin
      Button3.Left := Value;
    end, true);
  Ani.Start;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Self.ThemeManager := UThemeManager1;


  Application.ShowHint := false;
//  HintWindowClass := TUTooltip;
  Application.ShowHint := true;
end;

procedure TMainForm.ToggleSwitch1Click(Sender: TObject);
begin
  if ThemeManager.Theme <> utLight then
    ThemeManager.ThemeKind := tkLight
  else
    ThemeManager.ThemeKind := tkDark;
end;

procedure TMainForm.UButton3Click(Sender: TObject);
begin
  Randomize;
  UProgressBar1.GoToValue(Random(101));
  UProgressBar2.GoToValue(Random(101));
  UProgressBar3.GoToValue(Random(101));
end;

procedure TMainForm.UCheckBox1Click(Sender: TObject);
begin
  case UCheckBox1.State of
    cbsChecked:
      UCheckBox1.State := cbsUnchecked;
    cbsUnchecked:
      UCheckBox1.State := cbsGrayed;
    cbsGrayed:
      UCheckBox1.State := cbsChecked;
  end;
end;

procedure TMainForm.UCheckBox2Click(Sender: TObject);
begin
  case UCheckBox2.State of
    cbsChecked:
      UCheckBox2.State := cbsUnchecked;
    cbsUnchecked:
      UCheckBox2.State := cbsChecked;
  end;
end;

procedure TMainForm.USymbolButton10Click(Sender: TObject);
begin
  var a, b: Integer;
  if Panel2.Width <> 40 then
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
      Panel2.Width := Value;
    end, true);
  Ani.Step := 22;
  Ani.Duration := 220;
  Ani.Start;
end;

procedure TMainForm.USymbolButton4Click(Sender: TObject);
begin
  UThemeManager1.ReloadAutoSettings;
end;

end.

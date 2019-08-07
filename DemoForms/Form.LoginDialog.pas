unit Form.LoginDialog;

interface

uses
  UCL.TUThemeManager,UCL.TUForm, UCL.TUScrollBox, UCL.Classes, UCL.Utils,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  UCL.TUCaptionBar, UCL.TUButton, Vcl.WinXCtrls, Vcl.StdCtrls, UCL.TUText,
  UCL.TUEdit, UCL.TUQuickButton, UCL.TUPanel, Vcl.Menus, UCL.TUPopupMenu,
  UCL.TUCheckBox, Vcl.Imaging.pngimage, Vcl.WinXPanels;

type
  TformLoginDialog = class(TUForm)
    boxMain: TUScrollBox;
    captionbarMain: TUCaptionBar;
    AppTheme: TUThemeManager;
    buttonOk: TUButton;
    buttonCancel: TUButton;
    titleSignin: TUText;
    headingSignin: TUText;
    entryPassword: TUText;
    entryEmail: TUText;
    buttonAppQuit: TUQuickButton;
    buttonAppMinimized: TUQuickButton;
    panelAction: TUPanel;
    UText1: TUText;
    panelMoreOptions: TUPanel;
    checkSendMeNews: TUCheckBox;
    checkKeepLogin: TUCheckBox;
    buttonAppTheme: TUQuickButton;
    imageSplash: TImage;
    timerSplashScreen: TTimer;
    editEmail: TUEdit;
    editPassword: TUEdit;
    popupEditAction: TUPopupMenu;
    entryDescription: TUText;
    editDescription: TUEdit;
    procedure buttonCancelClick(Sender: TObject);
    procedure buttonAppMinimizedClick(Sender: TObject);
    procedure buttonAppQuitClick(Sender: TObject);
    procedure UText1Click(Sender: TObject);
    procedure buttonAppThemeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure timerSplashScreenTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure buttonOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formLoginDialog: TformLoginDialog;

implementation

{$R *.dfm}

procedure TformLoginDialog.buttonAppMinimizedClick(Sender: TObject);
begin
  WindowState := wsMinimized;
end;

procedure TformLoginDialog.buttonAppQuitClick(Sender: TObject);
begin
  Close;
end;

procedure TformLoginDialog.buttonAppThemeClick(Sender: TObject);
begin
  if ThemeManager.Theme = utLight then
    ThemeManager.Theme := utDark
  else
    ThemeManager.Theme := utLight;
end;

procedure TformLoginDialog.FormCreate(Sender: TObject);
begin
  ThemeManager := AppTheme;
end;

procedure TformLoginDialog.FormShow(Sender: TObject);
begin
  timerSplashScreen.Enabled := true;
  boxMain.Visible := false;
  panelAction.Visible := false;
  imageSplash.Visible := true;

  //  Splash screen
  Self.Color := AppTheme.AccentColor;
  captionbarMain.CustomColor := AppTheme.AccentColor;
  captionbarMain.ThemeManager := nil; //  Disable ThemeManager to use custom color
end;

procedure TformLoginDialog.timerSplashScreenTimer(Sender: TObject);
begin
  //  Stop splash screen timer
  timerSplashScreen.Enabled := false;

  //  Hide splash image
  imageSplash.Visible := false;

  //  Show main controls
  boxMain.Visible := true;
  panelAction.Visible := true;

  //  Enable ThemeManager for caption bar
  captionbarMain.ThemeManager := AppTheme;
end;

procedure TformLoginDialog.buttonCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TformLoginDialog.buttonOkClick(Sender: TObject);
begin
  Close;
end;

procedure TformLoginDialog.UText1Click(Sender: TObject);
begin
  panelMoreOptions.Visible := not panelMoreOptions.Visible;
end;

end.

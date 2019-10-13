unit Form.LoginDialog;

interface

uses
  UCL.TUThemeManager, UCL.TUForm, UCL.TUScrollBox, UCL.Classes, UCL.Utils,
  UCL.TUText, UCL.TUEdit, UCL.TUQuickButton, UCL.TUPanel, UCL.TUPopupMenu,
  UCL.TUCheckBox, UCL.TUCaptionBar, UCL.TUButton,

  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.StdCtrls, Vcl.Imaging.pngimage;

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
    textShowMoreOptions: TUText;
    panelMoreOptions: TUPanel;
    checkSendMeNews: TUCheckBox;
    checkKeepLogin: TUCheckBox;
    buttonAppTheme: TUQuickButton;
    editEmail: TUEdit;
    editPassword: TUEdit;
    popupEditAction: TUPopupMenu;
    entryDescription: TUText;
    editDescription: TUEdit;
    procedure buttonCancelClick(Sender: TObject);
    procedure textShowMoreOptionsClick(Sender: TObject);
    procedure buttonAppThemeClick(Sender: TObject);
    procedure buttonOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure popupEditActionItemClick(Sender: TObject; Index: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formLoginDialog: TformLoginDialog;

implementation

{$R *.dfm}

procedure TformLoginDialog.buttonAppThemeClick(Sender: TObject);
begin
  if ThemeManager.Theme = utLight then
    ThemeManager.Theme := utDark
  else
    ThemeManager.Theme := utLight;
end;

procedure TformLoginDialog.buttonCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TformLoginDialog.buttonOkClick(Sender: TObject);
begin
  Close;
end;

procedure TformLoginDialog.FormShow(Sender: TObject);
begin
  //  Setup UForm properties
  ThemeManager := AppTheme;
  CaptionBar := captionbarMain;

  //  Splash screen
  SplashImage := GetCurrentDir + '\SplashScreen.png';
  SplashScreenDelay := 1000;
  StartSplashScreen;
end;

procedure TformLoginDialog.popupEditActionItemClick(Sender: TObject;
  Index: Integer);
var
  Edit: TCustomEdit;
begin
  Self.SetFocus;  //  Close popup
  if popupEditAction.PopupComponent is TCustomEdit then
    begin
      Edit := popupEditAction.PopupComponent as TCustomEdit;
      case Index of
        0:  //  Cut
          Edit.CutToClipboard;
        1:  //  Copy
          Edit.CopyToClipboard;
        2:  //  Paste
          Edit.PasteFromClipboard;
      end;
    end;
end;

procedure TformLoginDialog.textShowMoreOptionsClick(Sender: TObject);
begin
  panelMoreOptions.Visible := not panelMoreOptions.Visible;
end;

end.

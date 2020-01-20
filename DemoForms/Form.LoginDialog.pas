unit Form.LoginDialog;

interface

uses
  Classes, SysUtils, Windows, Messages, Forms, StdCtrls, PNGImage, Menus, ExtCtrls, Controls,

  UCL.TUThemeManager, UCL.TUBorderlessForm, UCL.Classes, UCL.Utils,
  UCL.TUText, UCL.TUEdit, UCL.TUQuickButton, UCL.TUPanel, UCL.TUPopupMenu,
  UCL.TUCheckBox, UCL.TUCaptionBar, UCL.TUButton, UCL.TUScrollBox;

type
  TformLoginDialog = class(TUBorderlessForm)
    boxMain: TUScrollBox;
    captionbarMain: TUCaptionBar;
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
    entryDescription: TUText;
    editDescription: TUEdit;
    popupEdit: TUPopupMenu;
    CutCtrlX1: TMenuItem;
    CopyCtrlC1: TMenuItem;
    PasteCtrlV1: TMenuItem;
    procedure buttonCancelClick(Sender: TObject);
    procedure textShowMoreOptionsClick(Sender: TObject);
    procedure buttonAppThemeClick(Sender: TObject);
    procedure buttonOkClick(Sender: TObject);
    procedure popupEditItemClick(Sender: TObject; Index: Integer);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formLoginDialog: TformLoginDialog;

implementation

uses
  DataModule.Main;

{$R *.dfm}

procedure TformLoginDialog.buttonAppThemeClick(Sender: TObject);
begin
  if ThemeManager.Theme = utLight then
    ThemeManager.CustomTheme := utDark
  else
    ThemeManager.CustomTheme := utLight;
  ThemeManager.UseSystemTheme := false;
  ThemeManager.Reload;
end;

procedure TformLoginDialog.buttonCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TformLoginDialog.buttonOkClick(Sender: TObject);
begin
  Close;
end;

procedure TformLoginDialog.FormCreate(Sender: TObject);
begin
//  EnableBlur(Handle, 3);

  ThemeManager := dmMain.AppTheme;
end;

procedure TformLoginDialog.popupEditItemClick(Sender: TObject; Index: Integer);
var
  Edit: TCustomEdit;
begin
  Self.SetFocus;  //  Close popup
  if popupEdit.PopupComponent is TCustomEdit then
    begin
      Edit := popupEdit.PopupComponent as TCustomEdit;
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

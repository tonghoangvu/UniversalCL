unit Form.ImageBackground;

interface

uses
  UCL.Classes, UCL.TUThemeManager, UCL.TUForm, UCL.Utils,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  UCL.TUQuickButton, UCL.TUCaptionBar, UCL.TUTitleBar, UCL.TUSlider,
  UCL.TUButton, UCL.TUCheckBox, UCL.TURadioButton, UCL.TUSeparator,
  UCL.TUProgressBar, Vcl.StdCtrls, UCL.TUText, UCL.TUEdit,
  UCL.TUSymbolButton, UCL.TUItemButton, UCL.TUPanel;

type
  TformImageBackground = class(TUForm)
    imgBackground: TImage;
    AppTheme: TUThemeManager;
    titlebarMain: TUTitleBar;
    USlider1: TUSlider;
    buttonOk: TUButton;
    URadioButton1: TURadioButton;
    URadioButton2: TURadioButton;
    UProgressBar1: TUProgressBar;
    USeparator1: TUSeparator;
    URadioButton3: TURadioButton;
    UCheckBox1: TUCheckBox;
    buttonSide: TUSymbolButton;
    panelBottom: TUPanel;
    UEdit1: TUEdit;
    buttonWinClose: TUQuickButton;
    buttonWinMax: TUQuickButton;
    buttonWinMin: TUQuickButton;
    UButton1: TUButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formImageBackground: TformImageBackground;

implementation

{$R *.dfm}

procedure TformImageBackground.FormCreate(Sender: TObject);
begin
//  EnableBlur(Handle, 3);

  ThemeManager := AppTheme;
end;

end.

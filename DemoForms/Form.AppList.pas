unit Form.AppList;

interface

uses
  UCL.TUForm, UCL.TUThemeManager, UCL.Utils,
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, UCL.TUSmoothBox, StdCtrls,
  UCL.TUItemButton, UCL.TUHyperLink, UCL.TUProgressBar, UCL.TUButton,
  UCL.TUEdit, pngimage, ExtCtrls, UCL.TUCheckBox, UCL.TUPanel,
  UCL.TURadioButton, UCL.TUText, UCL.TUSymbolButton, UCL.TUSeparator,
  UCL.TUCaptionBar, UCL.TUQuickButton;

type
  TformAppList = class(TUForm)
    boxHorizontal: TUSmoothBox;
    captionBar: TUCaptionBar;
    buttonWinClose: TUQuickButton;
    buttonWinMin: TUQuickButton;
    boxVertical: TUSmoothBox;
    UItemButton1: TUItemButton;
    UItemButton2: TUItemButton;
    UItemButton3: TUItemButton;
    UItemButton4: TUItemButton;
    UItemButton5: TUItemButton;
    UItemButton6: TUItemButton;
    UItemButton7: TUItemButton;
    UItemButton8: TUItemButton;
    UItemButton9: TUItemButton;
    UItemButton10: TUItemButton;
    UItemButton11: TUItemButton;
    UItemButton12: TUItemButton;
    UItemButton13: TUItemButton;
    UItemButton14: TUItemButton;
    UItemButton15: TUItemButton;
    UItemButton16: TUItemButton;
    UItemButton17: TUItemButton;
    UItemButton18: TUItemButton;
    UItemButton19: TUItemButton;
    UItemButton20: TUItemButton;
    UItemButton21: TUItemButton;
    UItemButton22: TUItemButton;
    UItemButton23: TUItemButton;
    UItemButton24: TUItemButton;
    UItemButton25: TUItemButton;
    UItemButton26: TUItemButton;
    UItemButton27: TUItemButton;
    UItemButton28: TUItemButton;
    UItemButton29: TUItemButton;
    UItemButton30: TUItemButton;
    USymbolButton1: TUSymbolButton;
    USymbolButton14: TUSymbolButton;
    USymbolButton15: TUSymbolButton;
    USymbolButton18: TUSymbolButton;
    USymbolButton2: TUSymbolButton;
    USymbolButton4: TUSymbolButton;
    USymbolButton3: TUSymbolButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formAppList: TformAppList;

implementation

{$R *.dfm}

uses DataModule.Main;

procedure TformAppList.FormCreate(Sender: TObject);
begin
//  EnableBlur(Handle, 3);

  ThemeManager := dmMain.AppTheme;
end;

end.

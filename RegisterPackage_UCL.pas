unit RegisterPackage_UCL;

interface

uses
  Classes;

procedure Register;

implementation

uses
  UCL.TUForm,
  UCL.TUThemeManager,
  UCL.TUButton,
  UCL.TUQuickButton,
  UCL.TUSymbolButton,
  UCL.TUItemButton,
  UCL.TUEdit,
  UCL.TUCheckBox,
  UCL.TURadioButton,
  UCL.TUText,
  UCL.TUHyperLink,
  UCL.TUPopupMenu,
  UCL.TUPanel,
  UCL.TUScrollBox,
  UCL.TUCaptionBar,
  UCL.TUTitleBar,
  UCL.TUProgressBar,
  UCL.TUSlider,
  UCL.TUShadow,
  UCL.TUSeparator;

procedure Register;
begin
  RegisterComponents('Universal CL', [
    //TUBorderlessForm,
    TUThemeManager,
    TUButton,
    TUQuickButton,
    TUSymbolButton,
    TUItemButton,
    TUEdit,
    TUCheckBox,
    TURadioButton,
    TUText,
    TUHyperLink,
    TUPopupMenu,
    TUPanel,
    TUScrollBox,
    TUCaptionBar,
    TUTitleBar,
    TUProgressBar,
    TUSlider,
    TUShadow,
    TUSeparator
    ]);
end;

end.

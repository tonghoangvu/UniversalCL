unit RegisterPackage_UCL;

interface

uses
  Classes;

procedure Register;

implementation

uses
  UCL.IntAnimation,
  UCL.TUThemeManager,
  UCL.TUForm,
  UCL.TUBorderlessForm,
  UCL.TUCaptionBar,
  UCL.TUSymbolButton,
  UCL.TUButton,
  UCL.TUText,
  UCL.TUHyperLink,
  UCL.TUPanel,
  UCL.TUCheckBox,
  UCL.TUProgressBar,
  UCL.TUScrollBox,
  UCL.TURadioButton,
  UCL.TUItemButton,
  UCL.TUSeparator,
  UCL.TUEdit,
  UCL.TUSlider,
  UCL.TUPopupMenu,
  UCL.TUQuickButton,
  UCL.TUTitleBar,
  UCL.TUShadow,
  UCL.TUSmoothBox;

procedure Register;
begin
  RegisterComponents('Universal CL', [
    //TUForm,
    //TUBorderlessForm,
    TUThemeManager,
    TUBUtton,
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
    TUSmoothBox,
    TUCaptionBar,
    TUTitleBar,
    TUProgressBar,
    TUSlider,
    TUShadow,
    TUSeparator
  ]);
end;

end.

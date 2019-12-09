unit RegisterPackage_UCL;

interface

uses
  System.Classes;

procedure Register;

implementation

uses
  UCL.IntAnimation,
  UCL.TUThemeManager,
  UCL.TUForm, UCL.TUCaptionBar,
  UCL.TUSymbolButton, UCL.TUButton, UCL.TUText, UCL.TUHyperLink, UCL.TUPanel,
  UCL.TUCheckBox, UCL.TUProgressBar, UCL.TUScrollBox, UCL.TURadioButton,
  UCL.TUItemButton, UCL.TUSeparator, UCL.TUEdit, UCL.TUSlider, UCL.TUPopupMenu,
  UCL.TUQuickButton, UCL.TUTitleBar, UCL.TUShadow, UCL.TUSmoothBox
  ;

procedure Register;
begin
  RegisterComponents('Universal CL', [
    TUThemeManager,
    //TUForm,
    TUCaptionBar, TUSymbolButton, TUButton, TUText, TUHyperLink, TUPanel,
    TUCheckBox, TUProgressBar, TUScrollBox, TURadioButton, TUItemButton,
    TUSeparator, TUEdit, TUSlider, TUPopupMenu, TUTitleBar, TUQuickButton,
    TUShadow, TUSmoothBox
    ]);
end;

end.

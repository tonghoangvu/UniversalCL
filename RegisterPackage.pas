unit RegisterPackage;

interface

uses
  System.Classes, DesignIntf;

procedure Register;

implementation

uses
  // Components
  UCL.IntAnimation,
  UCL.TUThemeManager,
  UCL.TUForm, UCL.TUCaptionBar,
  UCL.TUSymbolButton, UCL.TUButton, UCL.TUText, UCL.TUHyperLink, UCL.TUPanel,
  UCL.TUCheckBox, UCL.TUProgressBar, UCL.TUScrollBox, UCL.TURadioButton,
  UCL.TUItemButton, UCL.TUSeparator, UCL.TUEdit, UCL.TUSlider, UCL.TUPopupMenu,
  UCL.TUQuickButton,

  // Property editors
  UCL.IconEditor;

procedure Register;
begin
  RegisterPropertyEditor(TypeInfo(string), TUSymbolButton, 'SymbolChar', TSymbolCharProperty);
  RegisterPropertyEditor(TypeInfo(string), TUItemButton, 'LeftIcon', TSymbolCharProperty);
  RegisterPropertyEditor(TypeInfo(string), TUItemButton, 'RightIcon', TSymbolCharProperty);

  RegisterComponents('Universal CL', [
    TUThemeManager,
    //TUForm,
    TUCaptionBar, TUSymbolButton, TUButton, TUText, TUHyperLink, TUPanel,
    TUCheckBox, TUProgressBar, TUScrollBox, TURadioButton, TUItemButton,
    TUSeparator, TUEdit, TUSlider, TUQuickButton, TUPopupMenu
    ]);
end;

end.

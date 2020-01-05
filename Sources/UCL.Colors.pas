unit UCL.Colors;

interface

uses
  Graphics;

var
  SCROLLBOX_BACK_NIL, SCROLLBOX_BACK_LIGHT, SCROLLBOX_BACK_DARK: TColor;

implementation

initialization
  SCROLLBOX_BACK_NIL := $E6E6E6;
  SCROLLBOX_BACK_LIGHT := $E6E6E6;
  SCROLLBOX_BACK_DARK := $1F1F1F;

end.

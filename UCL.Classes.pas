{$M+}

unit UCL.Classes;

interface

uses
  VCL.Graphics;

type
  TUTheme = (utLight, utDark);

  TUOrientation = (oHorizontal, oVertical);

  TUButtonState = (bsNone, bsHover, bsPress, bsDisabled, bsFocused);

  TDefColor = array [TUTheme, TUButtonState] of TColor;

  TControlStateColors = class
    private
      FNone: TColor;
      FHover: TColor;
      FPress: TColor;
      FDisabled: TColor;
      FFocused: TColor;

    public
      constructor Create(aNone, aHover, aPress, aDisabled, aFocused: TColor);
      function GetStateColor(const State: TUButtonState): TColor;

    published
      property None: TColor read FNone write FNone;
      property Hover: TColor read FHover write FHover;
      property Press: TColor read FPress write FPress;
      property Disabled: TColor read FDisabled write FDisabled;
      property Focused: TColor read FFocused write FFocused;
  end;

implementation

{ TCONTROLSTATECOLORS }

constructor TControlStateColors.Create(aNone, aHover, aPress, aDisabled, aFocused: TColor);
begin
  inherited Create;

  FNone := aNone;
  FHover := aHover;
  FPress := aPress;
  FDisabled := aDisabled;
  FFocused := aFocused;
end;

function TControlStateColors.GetStateColor(const State: TUButtonState): TColor;
begin
  case State of
    bsNone:
      Result := None;
    bsHover:
      Result := Hover;
    bsPress:
      Result := Press;
    bsDisabled:
      Result := Disabled;
    bsFocused:
      Result := Focused;
    else
      Result := None;
  end;
end;

end.

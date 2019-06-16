{$M+}

unit UCL.Classes;

interface

uses
  System.Classes,
  VCL.Graphics, Vcl.Controls, VCL.Dialogs;

type
  TUTheme = (utLight, utDark);

  TUOrientation = (oHorizontal, oVertical);

  TUButtonState = (bsNone, bsHover, bsPress, bsDisabled, bsFocused);

  TDefColor = array [TUTheme, TUButtonState] of TColor;

  TControlStateColors = class(TPersistent)
    private
      FNone: TColor;
      FHover: TColor;
      FPress: TColor;
      FDisabled: TColor;
      FFocused: TColor;

      FOnChange: TNotifyEvent;

      procedure SetStateColor(const Index: Integer; const Value: TColor);

    protected 
      procedure Change; virtual;
    
    public
      constructor Create(aNone, aHover, aPress, aDisabled, aFocused: TColor); overload;
      function GetStateColor(const State: TUButtonState): TColor;

    published
      property None: TColor index 0 read FNone write SetStateColor default $000000;
      property Hover: TColor index 1 read FHover write SetStateColor default $000000;
      property Press: TColor index 2 read FPress write SetStateColor default $000000;
      property Disabled: TColor index 3 read FDisabled write SetStateColor default $000000;
      property Focused: TColor index 4 read FFocused write SetStateColor default $000000;

      property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

implementation

{ TCONTROLSTATECOLORS }

procedure TControlStateColors.Change;
begin
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

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

procedure TControlStateColors.SetStateColor(const Index: Integer; const Value: TColor);
begin
  case Index of
    0:  
      if Value <> FNone then
        begin
          FNone := Value;
          Change;
        end;    
    1:
      if Value <> FHover then
        begin
          FHover := Value;
          Change;
        end;
    2:
      if Value <> FPress then
        begin
          FPress := Value;
          Change;
        end;
    3:
      if Value <> FDisabled then
        begin
          FDisabled := Value;
          Change;
        end;
    4:
      if Value <> FFocused then
        begin
          FFocused := Value;
          Change;
        end;
  end;
end;

end.

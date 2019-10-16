{$M+}

unit UCL.Classes;

interface

uses
  System.Classes,
  Winapi.Windows,
  VCL.Graphics, Vcl.Controls, VCL.ExtCtrls;

type
  TUTheme = (utLight, utDark);

  TUOrientation = (oHorizontal, oVertical);

  TUControlState = (csNone, csHover, csPress, csDisabled, csFocused);

  TUImageKind = (ikFontIcon, ikImage);

  TDefColor = array [TUTheme, TUControlState] of TColor;

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
      function GetStateColor(const State: TUControlState): TColor;

    published
      property None: TColor index 0 read FNone write SetStateColor default $000000;
      property Hover: TColor index 1 read FHover write SetStateColor default $000000;
      property Press: TColor index 2 read FPress write SetStateColor default $000000;
      property Disabled: TColor index 3 read FDisabled write SetStateColor default $000000;
      property Focused: TColor index 4 read FFocused write SetStateColor default $000000;

      property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

  //  Windows 10

  AccentPolicy = packed record
    AccentState: Integer;
    AccentFlags: Integer;
    GradientColor: Integer;
    AnimationId: Integer;
  end;

  WindowCompositionAttributeData = packed record
    Attribute: Cardinal;
    Data: Pointer;
    SizeOfData: Integer;
  end;

function EnableBlur(FormHandle: HWND; AccentState: Integer): Integer;

implementation

{ WINDOWS 10 }

function EnableBlur(FormHandle: HWND; AccentState: Integer): Integer;
const
  WCA_ACCENT_POLICY = 19;
var
  apiHandle: THandle;
  Accent: AccentPolicy;
  Data: WindowCompositionAttributeData;
  SetWindowCompositionAttribute: function (hWnd: HWND; var data: WindowCompositionAttributeData):integer; stdcall;
begin
  apiHandle := LoadLibrary('user32.dll');
  try
    @SetWindowCompositionAttribute := GetProcAddress(apiHandle, 'SetWindowCompositionAttribute');
    if @SetWindowCompositionAttribute = nil then
      Result := -1
    else
      begin
        Accent.AccentState := AccentState;

        Data.Attribute := WCA_ACCENT_POLICY;
        Data.SizeOfData := SizeOf(Accent);
        Data.Data := @Accent;

        Result := SetWindowCompositionAttribute(FormHandle, Data);
      end;
  finally
    FreeLibrary(apiHandle);
  end;
end;

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

function TControlStateColors.GetStateColor(const State: TUControlState): TColor;
begin
  case State of
    csNone:
      Result := None;
    csHover:
      Result := Hover;
    csPress:
      Result := Press;
    csDisabled:
      Result := Disabled;
    csFocused:
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

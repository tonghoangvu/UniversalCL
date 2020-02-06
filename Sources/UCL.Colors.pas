unit UCL.Colors;

interface

uses
  Classes, SysUtils, Graphics,
  UCL.Classes, UCL.TUThemeManager;

type
  TUThemeColorSet = class(TPersistent)
    private
      FEnabled: Boolean;
      FColor: TColor;
      FLightColor: TColor;
      FDarkColor: TColor;
      FOnChange: TNotifyEvent;

      procedure SetEnabled(const Value: Boolean);
      procedure SetThemeColor(Index: Integer; const Value: TColor);

    protected
      procedure Changed;

    public
      constructor Create; overload;
      constructor Create(Color, LightColor, DarkColor: TColor); overload;

      procedure Assign(Source: TPersistent); override;
      procedure SetColor(Color, LightColor, DarkColor: TColor);
      function GetColor(const TM: TUThemeManager): TColor;

    published
      property Enabled: Boolean read FEnabled write SetEnabled;   //  No default
      property Color: TColor index 0 read FColor write SetThemeColor;
      property LightColor: TColor index 1 read FLightColor write SetThemeColor;
      property DarkColor: TColor index 2 read FDarkColor write SetThemeColor;

      property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

  TUStateColorSet = class(TPersistent)
    private
      FEnabled: Boolean;
      FNone: TColor;
      FHover: TColor;
      FPress: TColor;
      FSelectedNone: TColor;
      FSelectedHover: TColor;
      FSelectedPress: TColor;
      FOnChange: TNotifyEvent;

      procedure SetEnabled(const Value: Boolean);
      procedure SetStateColor(Index: Integer; const Value: TColor);

    protected
      procedure Changed;

    public
      constructor Create; overload;
      constructor Create(None, Hover, Press, sNone, sHover, sPress: TColor); overload;

      procedure Assign(Source: TPersistent); override;
      procedure SetColor(None, Hover, Press, sNone, sHover, sPress: TColor);
      function GetColor(State: TUButtonState): TColor;

    published
      property Enabled: Boolean read FEnabled write SetEnabled;   //  No default
      property None: TColor index 0 read FNone write SetStateColor;
      property Hover: TColor index 1 read FHover write SetStateColor;
      property Press: TColor index 2 read FPress write SetStateColor;
      property SelectedNone: TColor index 3 read FNone write SetStateColor;
      property SelectedHover: TColor index 4 read FHover write SetStateColor;
      property SelectedPress: TColor index 5 read FPress write SetStateColor;

      property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

var
  TOOLTIP_SHADOW: Boolean;
  TOOLTIP_BORDER_THICKNESS: Byte;
  TOOLTIP_BACK: TUThemeColorSet;
  TOOLTIP_BORDER: TUThemeColorSet;

  FORM_BACK: TUThemeColorSet;
  PANEL_BACK: TUThemeColorSet;
  SCROLLBOX_BACK: TUThemeColorSet;
  CAPTIONBAR_BACK: TUThemeColorSet;

  DETAIL_COLOR: TColor;
  DETAIL_COLOR_HIGHLIGHED: TColor;

implementation

{ TUThemeSet }

//  SETTERS

procedure TUThemeColorSet.SetEnabled(const Value: Boolean);
begin
  if Value <> FEnabled then
    begin
      FEnabled := Value;
      Changed;
    end;
end;

procedure TUThemeColorSet.SetThemeColor(Index: Integer; const Value: TColor);
begin
  case Index of
    0:
      if Value <> FColor then
        begin
          FColor := Value;
          Changed;
        end;
    1:
      if Value <> FLightColor then
        begin
          FLightColor := Value;
          Changed;
        end;
    2:
      if Value <> FDarkColor then
        begin
          FDarkColor := Value;
          Changed;
        end;
  end;
end;

//  MAIN CLASS

constructor TUThemeColorSet.Create;
begin
  inherited Create;
  FEnabled := false;
  FColor := clBtnFace;
  FLightColor := $FFFFFF;
  FDarkColor := $000000;
end;

constructor TUThemeColorSet.Create(Color, LightColor, DarkColor: TColor);
begin
  inherited Create;
  SetColor(Color, LightColor, DarkColor);
end;

//  METHODS

procedure TUThemeColorSet.Assign(Source: TPersistent);
begin
  if Source is TUThemeColorSet then
    begin
      FEnabled := (Source as TUThemeColorSet).Enabled;
      FColor := (Source as TUThemeColorSet).Color;
      FLightColor := (Source as TUThemeColorSet).LightColor;
      FDarkColor := (Source as TUThemeColorSet).DarkColor;
    end
  else
    inherited;
end;

procedure TUThemeColorSet.Changed;
begin
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

//  UTILS

procedure TUThemeColorSet.SetColor(Color, LightColor, DarkColor: TColor);
begin
  FColor := Color;
  FLightColor := LightColor;
  FDarkColor := DarkColor;
  Changed;
end;

function TUThemeColorSet.GetColor(const TM: TUThemeManager): TColor;
begin
  if TM = nil then
    Result := Color
  else if TM.Theme = utLight then
    Result := LightColor
  else
    Result := DarkColor;
end;

{ TUColorStateSet }

//  SETTERS

procedure TUStateColorSet.SetEnabled(const Value: Boolean);
begin
  if Value <> FEnabled then
    begin
      FEnabled := Value;
      Changed;
    end;
end;

procedure TUStateColorSet.SetStateColor(Index: Integer; const Value: TColor);
begin
  case Index of
    0:
      if Value <> FNone then
        begin
          FNone := Value;
          Changed;
        end;
    1:
      if Value <> FHover then
        begin
          FHover := Value;
          Changed;
        end;
    2:
      if Value <> FPress then
        begin
          FPress := Value;
          Changed;
        end;
    3:
      if Value <> FSelectedNone then
        begin
          FSelectedNone := Value;
          Changed;
        end;
    4:
      if Value <> FSelectedHover then
        begin
          FSelectedHover := Value;
          Changed;
        end;
    5:
      if Value <> FSelectedPress then
        begin
          FSelectedPress := Value;
          Changed;
        end;
  end;
end;

//  MAIN CLASS

constructor TUStateColorSet.Create;
begin
  inherited Create;
  FEnabled := false;
  FNone := $000000;
  FHover := $000000;
  FPress := $000000;
  FSelectedNone := $000000;
  FSelectedHover := $000000;
  FSelectedPress := $000000;
end;

constructor TUStateColorSet.Create(None, Hover, Press, sNone, sHover, sPress: TColor);
begin
  inherited Create;
  SetColor(None, Hover, Press, sNone, sHover, sPress);
end;

//  METHODS

procedure TUStateColorSet.Assign(Source: TPersistent);
begin
  if Source is TUStateColorSet then
    begin
      FEnabled := (Source as TUStateColorSet).Enabled;
      FNone := (Source as TUStateColorSet).None;
      FHover := (Source as TUStateColorSet).Hover;
      FPress := (Source as TUStateColorSet).Press;
      FSelectedNone := (Source as TUStateColorSet).SelectedNone;
      FSelectedHover := (Source as TUStateColorSet).SelectedHover;
      FSelectedPress := (Source as TUStateColorSet).SelectedPress;
    end
  else
    inherited;
end;

procedure TUStateColorSet.Changed;
begin
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

//  UTILS

procedure TUStateColorSet.SetColor(None, Hover, Press, sNone, sHover, sPress: TColor);
begin

end;

function TUStateColorSet.GetColor(State: TUButtonState): TColor;
begin
  case State of
    ubsNone:
      Result := None;
    ubsHover:
      Result := Hover;
    ubsPress:
      Result := Press;
    ubsSelectedNone:
      Result := SelectedNone;
    ubsSelectedHover:
      Result := SelectedHover;
    ubsSelectedPress:
      Result := SelectedPress;
  end;
end;

initialization
  TOOLTIP_SHADOW := false;
  TOOLTIP_BORDER_THICKNESS := 1;
  TOOLTIP_BACK := TUThemeColorSet.Create(0, $F2F2F2, $2B2B2B);
  TOOLTIP_BORDER := TUThemeColorSet.Create(0, $CCCCCC, $767676);

  FORM_BACK := TUThemeColorSet.Create(0, $FFFFFF, $000000);
  PANEL_BACK := TUThemeColorSet.Create(0, $E6E6E6, $1F1F1F);
  SCROLLBOX_BACK := TUThemeColorSet.Create(0, $E6E6E6, $1F1F1F);
  CAPTIONBAR_BACK := TUThemeColorSet.Create(0, $F2F2F2, $2B2B2B);

  DETAIL_COLOR := $808080;  //  Both light & dark
  DETAIL_COLOR_HIGHLIGHED := $C0C0C0;   //  Using when background is solid color

finalization
  TOOLTIP_BACK.Free;
  TOOLTIP_BORDER.Free;
  FORM_BACK.Free;
  PANEL_BACK.Free;
  SCROLLBOX_BACK.Free;
  CAPTIONBAR_BACK.Free;

end.

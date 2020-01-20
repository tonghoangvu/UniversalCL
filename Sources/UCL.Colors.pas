unit UCL.Colors;

interface

uses
  Classes, SysUtils, Graphics,
  UCL.Classes, UCL.TUThemeManager;

type
  TUColorSet = class(TPersistent)
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
      property Enabled: Boolean read FEnabled write SetEnabled;
      property Color: TColor index 0 read FColor write SetThemeColor;
      property LightColor: TColor index 1 read FLightColor write SetThemeColor;
      property DarkColor: TColor index 2 read FDarkColor write SetThemeColor;

      property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

var
  TOOLTIP_SHADOW: Boolean;
  TOOLTIP_BORDER_THICKNESS: Byte;
  TOOLTIP_BACK: TUColorSet;
  TOOLTIP_BORDER: TUColorSet;

  FORM_BACK: TUColorSet;
  PANEL_BACK: TUColorSet;
  SCROLLBOX_BACK: TUColorSet;
  CAPTIONBAR_BACK: TUColorSet;

implementation

{ TUThemeSet }

//  SETTERS

procedure TUColorSet.SetEnabled(const Value: Boolean);
begin
  if Value <> FEnabled then
    begin
      FEnabled := Value;
      Changed;
    end;
end;

procedure TUColorSet.SetThemeColor(Index: Integer; const Value: TColor);
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

constructor TUColorSet.Create;
begin
  inherited Create;
  FEnabled := false;
  FColor := clBtnFace;
  FLightColor := $FFFFFF;
  FDarkColor := $000000;
end;

constructor TUColorSet.Create(Color, LightColor, DarkColor: TColor);
begin
  inherited Create;
  SetColor(Color, LightColor, DarkColor);
end;

//  METHODS

procedure TUColorSet.Assign(Source: TPersistent);
begin
  if Source is TUColorSet then
    begin
      FEnabled := (Source as TUColorSet).Enabled;
      FColor := (Source as TUColorSet).Color;
      FLightColor := (Source as TUColorSet).LightColor;
      FDarkColor := (Source as TUColorSet).DarkColor;
    end
  else
    inherited;
end;

procedure TUColorSet.Changed;
begin
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

//  UTILS

procedure TUColorSet.SetColor(Color, LightColor, DarkColor: TColor);
begin
  FColor := Color;
  FLightColor := LightColor;
  FDarkColor := DarkColor;
  Changed;
end;

function TUColorSet.GetColor(const TM: TUThemeManager): TColor;
begin
  if TM = nil then
    Result := Color
  else if TM.Theme = utLight then
    Result := LightColor
  else
    Result := DarkColor;
end;

initialization
  TOOLTIP_SHADOW := false;
  TOOLTIP_BORDER_THICKNESS := 1;
  TOOLTIP_BACK := TUColorSet.Create(0, $F2F2F2, $2B2B2B);
  TOOLTIP_BORDER := TUColorSet.Create(0, $CCCCCC, $767676);

  FORM_BACK := TUColorSet.Create(0, $FFFFFF, $000000);
  PANEL_BACK := TUColorSet.Create(0, $E6E6E6, $1F1F1F);
  SCROLLBOX_BACK := TUColorSet.Create(0, $E6E6E6, $1F1F1F);
  CAPTIONBAR_BACK := TUColorSet.Create(0, $F2F2F2, $2B2B2B);

finalization
  TOOLTIP_BACK.Free;
  TOOLTIP_BORDER.Free;
  FORM_BACK.Free;
  PANEL_BACK.Free;
  SCROLLBOX_BACK.Free;
  CAPTIONBAR_BACK.Free;

end.

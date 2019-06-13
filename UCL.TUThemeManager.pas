unit UCL.TUThemeManager;

interface

uses
  UCL.Classes, UCL.SystemSettings,

  System.Classes, System.SysUtils, System.TypInfo,
  VCL.Graphics, VCL.Controls,
  Generics.Collections;

type
  TUThemeKind = (tkAuto, tkLight, tkDark);

  TUColorOnBorderKind = (cobkAuto, cobkTrue, cobkFalse);

  IUThemeControl = interface
    ['{2E7F3252-8372-4F68-9962-B17330678214}']
    procedure UpdateTheme;
  end;

  TUThemeManager = class(TComponent)
    private
      FTheme: TUTheme;
      FThemeKind: TUThemeKind;

      FActiveColor: TColor;
      FUseAccentColor: Boolean;
      FCustomColor: TColor;

      FColorOnBorder: Boolean;
      FColorOnBorderKind: TUColorOnBorderKind;

      FAutoUpdateTheme: Boolean;

      FControlList: TList<TControl>;

      procedure SetThemeKind(const Value: TUThemeKind);
      procedure SetUseAccentColor(const Value: Boolean);
      procedure SetColorOnBorderKind(const Value: TUColorOnBorderKind);

    public
      constructor Create(aOwner: TComponent); override;
      procedure UpdateThemeForComponents;
      procedure ReloadAutoSettings;

      class function CheckControlThemeAvailable(const aControl: TControl): Boolean;
      function ConnectedControlCount: Integer;
      procedure ConnectControl(const aControl: TControl);
      procedure DisconnectControl(const aControl: TControl);

    published
      property Theme: TUTheme read FTheme;
      property ThemeKind: TUThemeKind read FThemeKind write SetThemeKind default tkAuto;

      property ActiveColor: TColor read FActiveColor;
      property UseAccentColor: Boolean read FUseAccentColor write SetUseAccentColor default true;
      property CustomColor: TColor read FCustomColor write FCustomColor default $00D77800;

      property ColorOnBorder: Boolean read FColorOnBorder;
      property ColorOnBorderKind: TUColorOnBorderKind read FColorOnBorderKind write SetColorOnBorderKind default cobkAuto;

      property AutoUpdateTheme: Boolean read FAutoUpdateTheme write FAutoUpdateTheme default true;
  end;

implementation

{ STATIC METHODS }

class function TUThemeManager.CheckControlThemeAvailable(const aControl: TControl): Boolean;
var
  GUID: TGUID;
begin
  GUID := StringToGUID('{2E7F3252-8372-4F68-9962-B17330678214}');
  Result :=
    Supports(aControl, GUID)
    and IsPublishedProp(aControl, 'ThemeManager');
end;

{ GETTERS & SETTERS }

procedure TUThemeManager.SetThemeKind(const Value: TUThemeKind);
begin
  if Value <> FThemeKind then
    begin
      FThemeKind := Value;
      case Value of
        tkAuto:
          FTheme := GetAppTheme;
        tkLight:
          FTheme := utLight;
        tkDark:
          FTheme := utDark;
      end;

      if AutoUpdateTheme = true then
        UpdateThemeForComponents;
    end;
end;

procedure TUThemeManager.SetUseAccentColor(const Value: Boolean);
begin
  if Value <> FUseAccentColor then
    begin
      FUseAccentColor := Value;
      if Value = true then
        FActiveColor := GetAccentColor
      else
        FActiveColor := CustomColor;

      if AutoUpdateTheme = true then
        UpdateThemeForComponents;
    end;
end;

procedure TUThemeManager.SetColorOnBorderKind(const Value: TUColorOnBorderKind);
begin
  if Value <> FColorOnBorderKind then
    begin
      FColorOnBorderKind := Value;
      case Value of
        cobkAuto:
          FColorOnBorder := IsAccentColorEnabled;
        cobkTrue:
          FColorOnBorder := true;
        cobkFalse:
          FColorOnBorder := false;
      end;

      if AutoUpdateTheme = true then
        UpdateThemeForComponents;
    end;
end;

{ MAIN CLASS }

constructor TUThemeManager.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FControlList := TList<TControl>.Create;

  ThemeKind := tkAuto;
  UseAccentColor := true;
  CustomColor := $00D77800;
  AutoUpdateTheme := true;
  ColorOnBorderKind := cobkAuto;
end;

procedure TUThemeManager.UpdateThemeForComponents;
var
  aControl: TControl;
begin
  for aControl in FControlList do
    (aControl as IUThemeControl).UpdateTheme;
end;

procedure TUThemeManager.ReloadAutoSettings;
begin
  if ThemeKind = tkAuto then
    FTheme := GetAppTheme;
  if UseAccentColor = true then
    FActiveColor := GetAccentColor;

  if AutoUpdateTheme = true then
    UpdateThemeForComponents;
end;

{ UTILS }

function TUThemeManager.ConnectedControlCount: Integer;
begin
  Result := FControlList.Count;
end;

procedure TUThemeManager.ConnectControl(const aControl: TControl);
var
  HasBefore: Boolean;
begin
  if CheckControlThemeAvailable(aControl) = true then
    begin
      HasBefore := FControlList.IndexOf(aControl) <> -1;
      if HasBefore = false then
        FControlList.Add(aControl);
    end;
end;

procedure TUThemeManager.DisconnectControl(const aControl: TControl);
var
  ItemID: Integer;
begin
  ItemID := FControlList.IndexOf(aControl);
  if (ItemID <> -1) and (ItemID <= FControlList.Count - 1) then
    FControlList.Delete(ItemID);
end;

end.

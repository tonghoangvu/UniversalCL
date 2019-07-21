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

  //  UControl interface
  IUThemeControl = interface
    ['{2E7F3252-8372-4F68-9962-B17330678214}']
    procedure UpdateTheme;
  end;

  TUThemeManager = class(TComponent)
    private
      FTheme: TUTheme;
      FActiveColor: TColor;

      FThemeKind: TUThemeKind;

      FUseAccentColor: Boolean;
      FCustomColor: TColor;

      FColorOnBorder: Boolean;
      FColorOnBorderKind: TUColorOnBorderKind;

      FAutoUpdateTheme: Boolean;

      FControlList: TList<TComponent>;

      //  Events
      FOnUpdate: TNotifyEvent;

      procedure SetThemeKind(const Value: TUThemeKind);
      procedure SetUseAccentColor(const Value: Boolean);
      procedure SetColorOnBorderKind(const Value: TUColorOnBorderKind);
      procedure SetCustomColor(const Value: TColor);

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;
      procedure UpdateThemeForControls;
      procedure ReloadAutoSettings;

      //  Connect controls
      class function CheckControlThemeAvailable(const aControl: TComponent): Boolean;
      function ConnectedControlCount: Integer;
      procedure ConnectControl(const aControl: TComponent);
      procedure DisconnectControl(const aControl: TComponent);

    published
      property Theme: TUTheme read FTheme;
      property ThemeKind: TUThemeKind read FThemeKind write SetThemeKind default tkAuto;

      property ActiveColor: TColor read FActiveColor;
      property UseAccentColor: Boolean read FUseAccentColor write SetUseAccentColor default true;
      property CustomColor: TColor read FCustomColor write SetCustomColor default $00D77800;

      property ColorOnBorder: Boolean read FColorOnBorder;
      property ColorOnBorderKind: TUColorOnBorderKind read FColorOnBorderKind write SetColorOnBorderKind default cobkAuto;

      property AutoUpdateTheme: Boolean read FAutoUpdateTheme write FAutoUpdateTheme default true;

      property OnUpdate: TNotifyEvent read FOnUpdate write FOnUpdate;
  end;

implementation

{ STATIC METHODS }

class function TUThemeManager.CheckControlThemeAvailable(const aControl: TComponent): Boolean;
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
        UpdateThemeForControls;
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
        UpdateThemeForControls;
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
        UpdateThemeForControls;
    end;
end;

procedure TUThemeManager.SetCustomColor(const Value: TColor);
begin
  if Value <> FCustomColor then
    begin
      FCustomColor := Value;
      if FUseAccentColor = false then
        FActiveColor := FCustomColor;
      if AutoUpdateTheme = true then
        UpdateThemeForControls;
    end;
end;

{ MAIN CLASS }

constructor TUThemeManager.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FControlList := TList<TComponent>.Create;

  CustomColor := $00D77800;
  AutoUpdateTheme := true;

  ThemeKind := tkAuto;
  UseAccentColor := true;
  ColorOnBorderKind := cobkAuto;

  ReloadAutoSettings;
end;

destructor TUThemeManager.Destroy;
begin
  FControlList.Free;
  inherited Destroy;
end;

procedure TUThemeManager.UpdateThemeForControls;
var
  aControl: TComponent;
begin
  //  Call UpdateTheme for all controls in list
  for aControl in FControlList do
    if aControl <> nil then
      (aControl as IUThemeControl).UpdateTheme;

  if Assigned(FOnUpdate) then
    FOnUpdate(Self);
end;

procedure TUThemeManager.ReloadAutoSettings;
begin
  //  Reload system settings, which property is set to Auto
  if ThemeKind = tkAuto then
    FTheme := GetAppTheme;
  if UseAccentColor = true then
    FActiveColor := GetAccentColor;
  if ColorOnBorderKind = cobkAuto then
    FColorOnBorder := IsAccentColorEnabled;

  if AutoUpdateTheme = true then
    UpdateThemeForControls;
end;

{ UTILS }

function TUThemeManager.ConnectedControlCount: Integer;
begin
  Result := FControlList.Count;
end;

procedure TUThemeManager.ConnectControl(const aControl: TComponent);
var
  HasBefore: Boolean;
begin
  //  Check control is valid
  if CheckControlThemeAvailable(aControl) = true then
    begin
      HasBefore := FControlList.IndexOf(aControl) <> -1;
      if HasBefore = false then
        FControlList.Add(aControl);   //  Add control from list
    end;
end;

procedure TUThemeManager.DisconnectControl(const aControl: TComponent);
var
  ItemID: Integer;
begin
  //  Remove control from list
  ItemID := FControlList.IndexOf(aControl);
  if (ItemID <> -1) and (ItemID <= FControlList.Count - 1) then
    FControlList.Delete(ItemID);
end;

end.

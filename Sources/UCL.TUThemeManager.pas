unit UCL.TUThemeManager;

interface

uses
  UCL.Classes, UCL.SystemSettings,
  System.Classes, System.SysUtils, System.TypInfo,
  VCL.Controls, VCL.Graphics,
  Generics.Collections;

type
  IUThemeComponent = interface
    ['{C9D5D479-2F52-4BB9-8023-6EA00B5084F0}']
    procedure UpdateTheme;
  end;

  TUThemeManager = class(TComponent)
    private
      FAutoUpdateControls: Boolean;
      FCompList: TList<TComponent>;

      //  Events
      FOnUpdate: TNotifyEvent;

      //  Internal
      FTheme: TUTheme;
      FAccentColor: TColor;
      FColorOnBorder: Boolean;

      //  System
      FUseSystemTheme: Boolean;
      FUseSystemAccentColor: Boolean;

      //  Custom
      FCustomTheme: TUTheme;
      FCustomAccentColor: TColor;

      //  Setters
      procedure SetUseSystemTheme(const Value: Boolean);
      procedure SetUseSystemAccentColor(const Value: Boolean);

      procedure SetCustomTheme(const Value: TUTheme);
      procedure SetCustomAccentColor(const Value: TColor);

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;
      procedure Loaded; override;

      //  Utils
      procedure ReloadAutoSettings;
      procedure UpdateThemeForControls;

      //  Components connecting
      class function IsThemeAvailable(const Comp: TComponent): Boolean;
      function ConnectedComponentCount: Integer;
      procedure Connect(const Comp: TComponent);
      procedure Disconnect(const Comp: TComponent);

    published
      property AutoUpdateControls: Boolean read FAutoUpdateControls write FAutoUpdateControls default true;

      //  System
      property UseSystemTheme: Boolean read FUseSystemTheme write SetUseSystemTheme default true;
      property UseSystemAccentColor: Boolean read FUseSystemAccentColor write SetUseSystemAccentColor default true;

      //  Custom
      property CustomTheme: TUTheme read FCustomTheme write SetCustomTheme stored false default utLight;
      property CustomAccentColor: TColor read FCustomAccentColor write SetCustomAccentColor stored false default $D77800;

      property Theme: TUTheme read FTheme;
      property AccentColor: TColor read FAccentColor;
      property ColorOnBorder: Boolean read FColorOnBorder;

      //  Events
      property OnUpdate: TNotifyEvent read FOnUpdate write FOnUpdate;
  end;

implementation

{ TUThemeManager }

//  SETTERS

procedure TUThemeManager.SetUseSystemTheme(const Value: Boolean);
begin
  if Value <> FUseSystemTheme then
    begin
      FUseSystemTheme := Value;

      if not Value then
        FTheme := FCustomTheme
      else
        begin
          if IsAppsUseDarkTheme then
            FTheme := utDark
          else
            FTheme := utLight;
        end;

      if AutoUpdateControls then
        UpdateThemeForControls;
    end;
end;

procedure TUThemeManager.SetUseSystemAccentColor(const Value: Boolean);
begin
  if Value <> FUseSystemAccentColor then
    begin
      FUseSystemAccentColor := Value;

      if not Value then
        FAccentColor := FCustomAccentColor
      else
        FAccentColor := GetAccentColor;

      if AutoUpdateControls then
        UpdateThemeForControls;
    end;
end;

procedure TUThemeManager.SetCustomTheme(const Value: TUTheme);
begin
  if Value <> FCustomTheme then
    begin
      FUseSystemTheme := false;
      FCustomTheme := Value;
      FTheme := Value;

      if AutoUpdateControls then
        UpdateThemeForControls;
    end;
end;

procedure TUThemeManager.SetCustomAccentColor(const Value: TColor);
begin
  if Value <> FCustomAccentColor then
    begin
      FUseSystemAccentColor := false;
      FCustomAccentColor := Value;
      FAccentColor := Value;

      if AutoUpdateControls then
        UpdateThemeForControls;
    end;
end;

//  MAIN CLASS

constructor TUThemeManager.Create(aOwner: TComponent);
begin
  inherited;

  //  Objects
  FCompList := TList<TComponent>.Create;

  //  Default properties
  FAutoUpdateControls := true;

  FUseSystemTheme := true;
  FUseSystemAccentColor := true;

  FCustomTheme := utLight;
  FCustomAccentColor := $D77800;
end;

destructor TUThemeManager.Destroy;
begin
  FCompList.Free;
  inherited;
end;

procedure TUThemeManager.Loaded;
begin
  inherited;
  if Assigned(FOnUpdate) then
    FOnUpdate(Self);

  ReloadAutoSettings;
end;

//  UTILS

procedure TUThemeManager.ReloadAutoSettings;
begin
  //  Theme
  if not UseSystemTheme then
    FTheme := CustomTheme
  else
    begin
      if IsAppsUseDarkTheme then
        FTheme := utDark
      else
        FTheme := utLight;
    end;

  //  Accent color
  if not UseSystemAccentColor then
    FAccentColor := CustomAccentColor
  else
    FAccentColor := GetAccentColor;

  //  Color on border
  FColorOnBorder := IsColorOnBorderEnabled;

  //  Update for controls
  if AutoUpdateControls then
    UpdateThemeForControls;
end;

procedure TUThemeManager.UpdateThemeForControls;
var
  Comp: TComponent;
begin
  if Assigned(FOnUpdate) then
    FOnUpdate(Self);

  for Comp in FCompList do
    if Comp <> nil then
      (Comp as IUThemeComponent).UpdateTheme;
end;

//  COMPONENTS CONNECTING

class function TUThemeManager.IsThemeAvailable(const Comp: TComponent): Boolean;
begin
  Result :=
    IsPublishedProp(Comp, 'ThemeManager') and
    Supports(Comp, IUThemeComponent);
end;

function TUThemeManager.ConnectedComponentCount: Integer;
begin
  if FCompList = nil then
    Result := -1
  else
    Result := FCompList.Count;
end;

procedure TUThemeManager.Connect(const Comp: TComponent);
var
  ConnectedYet: Boolean;
begin
  if IsThemeAvailable(Comp) then
    begin
      ConnectedYet := FCompList.IndexOf(Comp) <> -1;
      if not ConnectedYet then
        FCompList.Add(Comp);
    end;
end;

procedure TUThemeManager.Disconnect(const Comp: TComponent);
var
  Index: Integer;
begin
  Index := FCompList.IndexOf(Comp);
  if Index <> -1 then
    FCompList.Delete(Index);
end;

end.

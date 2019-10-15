unit UCL.TUThemeManager;

interface

uses
  UCL.Classes, UCL.SystemSettings,
  System.Classes, System.SysUtils, System.TypInfo,
  VCL.Graphics, VCL.Controls,
  Generics.Collections;

type
  IUThemeComponent = interface
    ['{C9D5D479-2F52-4BB9-8023-6EA00B5084F0}']
    procedure UpdateTheme;
  end;

  IUComponent = interface
    procedure UpdateTheme;
  end;

  TUThemeManager = class(TComponent)
    private
      FAutoUpdateControls: Boolean;    
      FAutoTheme: Boolean;
      FTheme: TUTheme;
      FAutoAccentColor: Boolean;
      FAccentColor: TColor;
      FAutoColorOnBorder: Boolean;
      FColorOnBorder: Boolean;

      FComponentList: TList<TComponent>;
      FOnUpdate: TNotifyEvent;

      procedure SetAutoTheme(const Value: Boolean);
      procedure SetTheme(const Value: TUTheme);

      procedure SetAutoAccentColor(const Value: Boolean);
      procedure SetAccentColor(const Value: TColor);

      procedure SetAutoColorOnBorder(const Value: Boolean);

    public 
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;
      procedure Loaded; override;
      procedure Assign(Source: TPersistent); override;

      procedure UpdateThemeForControls;
      procedure ReloadAutoSettings;

      class function IsThemeAvailable(const aComponent: TComponent): Boolean;
      function ConnectedComponentCount: Integer;
      procedure Connect(const aComponent: TComponent);
      procedure Disconnect(const aComponent: TComponent);

    published
      property AutoUpdateControls: Boolean read FAutoUpdateControls write FAutoUpdateControls default true;

      property AutoTheme: Boolean read FAutoTheme write SetAutoTheme default true;
      property Theme: TUTheme read FTheme write SetTheme;

      property AutoAccentColor: Boolean read FAutoAccentColor write SetAutoAccentColor default true;
      property AccentColor: TColor read FAccentColor write SetAccentColor;

      property AutoColorOnBorder: Boolean read FAutoColorOnBorder write SetAutoColorOnBorder default true;
      property ColorOnBorder: Boolean read FColorOnBorder stored false;

      property OnUpdate: TNotifyEvent read FOnUpdate write FOnUpdate;
  end;

implementation

{ TUThemeManager }

//  SETTERS

procedure TUThemeManager.SetAutoTheme(const Value: Boolean);
begin
  if Value <> FAutoTheme then
    begin
      FAutoTheme := Value;
      if FAutoTheme then
        begin
          if IsAppsUseDarkTheme then
            FTheme := utDark
          else
            FTheme := utLight;

          if AutoUpdateControls then
            UpdateThemeForControls;
        end;
    end;
end;

procedure TUThemeManager.SetTheme(const Value: TUTheme);
begin
  FAutoTheme := false;
  if Value <> FTheme then
    begin
      FTheme := Value;
      if AutoUpdateControls then
        UpdateThemeForControls;
    end;
end;

procedure TUThemeManager.SetAutoAccentColor(const Value: Boolean);
begin
  if Value <> FAutoAccentColor then
    begin
      FAutoAccentColor := Value;
      if FAutoAccentColor then
        begin
          FAccentColor := GetAccentColor;
          if AutoUpdateControls then
            UpdateThemeForControls;
        end;
    end;
end;

procedure TUThemeManager.SetAccentColor(const Value: TColor);
begin
  FAutoAccentColor := false;
  if Value <> FAccentColor then
    begin
      FAccentColor := Value;
      if AutoUpdateControls then
        UpdateThemeForControls;
    end;
end;

procedure TUThemeManager.SetAutoColorOnBorder(const Value: Boolean);
begin
  if Value <> FAutoColorOnBorder then
    begin
      FAutoColorOnBorder := Value;
      if FAutoColorOnBorder then
        begin
          FColorOnBorder := IsColorOnBorderEnabled;
          if AutoUpdateControls then
            UpdateThemeForControls;
        end;
    end;
end;

//  MAIN CLASS

constructor TUThemeManager.Create(aOwner: TComponent);
begin
  inherited;
  FComponentList := TList<TComponent>.Create;
  FAutoUpdateControls := true;

  FAutoTheme := true;
  FAutoAccentColor := true;
  FAutoColorOnBorder := true;

  ReloadAutoSettings;
end;

destructor TUThemeManager.Destroy;
begin
  FComponentList.Free;
  inherited;
end;

procedure TUThemeManager.Loaded;
begin
  inherited;
  if Assigned(FOnUpdate) then
    FOnUpdate(Self);
end;

procedure TUThemeManager.Assign(Source: TPersistent);
begin
  if (Source is TUThemeManager) and (Source <> nil) then
    begin
      FTheme := (Source as TUThemeManager).Theme;
      FAccentColor := (Source as TUThemeManager).AccentColor;
      FColorOnBorder := (Source as TUThemeManager).ColorOnBorder;

      FAutoUpdateControls := (Source as TUThemeManager).AutoUpdateControls;
      FAutoTheme := (Source as TUThemeManager).AutoTheme;
      FAutoAccentColor := (Source as TUThemeManager).AutoAccentColor;
      FAutoColorOnBorder := (Source as TUThemeManager).AutoColorOnBorder;

      if AutoUpdateControls then
        UpdateThemeForControls;
    end
  else
    inherited;
end;

//  METHODS

class function TUThemeManager.IsThemeAvailable(
  const aComponent: TComponent): Boolean;
begin
  Result :=
    IsPublishedProp(aComponent, 'ThemeManager')
    and Supports(aComponent, IUThemeComponent);
end;

function TUThemeManager.ConnectedComponentCount: Integer;
begin
  if FComponentList = nil then
    Result := -1
  else
    Result := FComponentList.Count;
end;

procedure TUThemeManager.Connect(const aComponent: TComponent);
var
  IsConnectedBefore: Boolean;
begin
  if IsThemeAvailable(aComponent) then
    begin
      IsConnectedBefore := FComponentList.IndexOf(aComponent) <> -1;
      if not IsConnectedBefore then
        FComponentList.Add(aComponent);
    end;
end;

procedure TUThemeManager.Disconnect(const aComponent: TComponent);
var
  ID: Integer;
begin
  ID := FComponentList.IndexOf(aComponent);
  if ID <> -1 then
    FComponentList.Delete(ID);
end;

procedure TUThemeManager.UpdateThemeForControls;
var
  TempComponent: TComponent;
begin
  if Assigned(FOnUpdate) then
    FOnUpdate(Self);

  for TempComponent in FComponentList do
    if TempComponent <> nil then
      (TempComponent as IUThemeComponent).UpdateTheme;
end;

procedure TUThemeManager.ReloadAutoSettings;
begin
  if AutoTheme then
    if IsAppsUseDarkTheme then
      FTheme := utDark
    else
      FTheme := utLight;

  if AutoAccentColor then
    FAccentColor := GetAccentColor;

  if AutoColorOnBorder then
    FColorOnBorder := IsColorOnBorderEnabled;

  if AutoUpdateControls then
    UpdateThemeForControls;
end;

end.

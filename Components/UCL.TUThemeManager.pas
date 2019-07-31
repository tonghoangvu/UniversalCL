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
      procedure SetColorOnBorder(const Value: Boolean);

    public 
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;
      procedure Loaded; override;
      procedure UpdateThemeForControls;
      procedure ReloadAutoSettings;

      class function IsThemeAvailable(const aComponent: TComponent): Boolean;
      function ConnectedComponentCount: Integer;
      procedure Connect(const aComponent: TComponent);
      procedure Disconnect(const aComponent: TComponent);

    published
      property AutoUpdateControls: Boolean read FAutoUpdateControls write FAutoUpdateControls default true;    
      property AutoTheme: Boolean read FAutoTheme write SetAutoTheme default true;
      property Theme: TUTheme read FTheme write SetTheme default utLight;
      property AutoAccentColor: Boolean read FAutoAccentColor write SetAutoAccentColor default true;
      property AccentColor: TColor read FAccentColor write SetAccentColor default $D77800;
      property AutoColorOnBorder: Boolean read FAutoColorOnBorder write SetAutoColorOnBorder default true;
      property ColorOnBorder: Boolean read FColorOnBorder write SetColorOnBorder default false;
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
          FTheme := GetAppTheme;
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
          FColorOnBorder := GetColorOnBorderEnabled;
          if AutoUpdateControls then
            UpdateThemeForControls;
        end;
    end;
end;

procedure TUThemeManager.SetColorOnBorder(const Value: Boolean);
begin
  FAutoColorOnBorder := false;
  if Value <> FColorOnBorder then
    begin
      FColorOnBorder := Value;
      if AutoUpdateControls then
        UpdateThemeForControls;
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

  FTheme := utLight;
  FAccentColor := $D77800;
  FColorOnBorder := false;
end;

destructor TUThemeManager.Destroy;
begin
  FComponentList.Free;
  inherited;
end;

procedure TUThemeManager.Loaded;
begin
  inherited;
  ReloadAutoSettings;
end;

//  METHODS

class function TUThemeManager.IsThemeAvailable(
  const aComponent: TComponent): Boolean;
var
  GUID: TGUID;
begin
  GUID := StringToGUID('{C9D5D479-2F52-4BB9-8023-6EA00B5084F0}');
  Result :=
    IsPublishedProp(aComponent, 'ThemeManager')
    and Supports(aComponent, GUID);
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
    FTheme := GetAppTheme;
  if AutoAccentColor then
    FAccentColor := GetAccentColor;
  if AutoColorOnBorder then
    FColorOnBorder := GetColorOnBorderEnabled;

  if AutoUpdateControls then
    UpdateThemeForControls;
end;

end.

unit UCL.TUPanel;

interface

uses
  UCL.Classes, UCL.Utils, UCL.SystemSettings, UCL.TUThemeManager,
  Windows, Messages,
  Classes, SysUtils,
  Controls, ExtCtrls, Graphics;

type
  TUPanel = class(TPanel, IUThemeComponent)
    private
      FThemeManager: TUThemeManager;

      FHitTest: Boolean;
      FCustomTextColor: TColor;
      FCustomBackColor: TColor;

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetCustomBackColor(const Value: TColor);
      procedure SetCustomTextColor(const Value: TColor);

    protected
      procedure Notification(AComponent: TComponent; Operation: TOperation); override;

    public
      constructor Create(aOwner: TComponent); override;
      procedure UpdateTheme;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;

      property HitTest: Boolean read FHitTest write FHitTest default true;
      property CustomTextColor: TColor read FCustomTextColor write SetCustomTextColor;
      property CustomBackColor: TColor read FCustomBackColor write SetCustomBackColor;
  end;

implementation

{ TUPanel }

//  THEME

procedure TUPanel.SetThemeManager(const Value: TUThemeManager);
begin
  if Value <> FThemeManager then
    begin
      if FThemeManager <> nil then
        FThemeManager.Disconnect(Self);

      if Value <> nil then
        begin
          Value.Connect(Self);
          Value.FreeNotification(Self);
        end;

      FThemeManager := Value;
      UpdateTheme;
    end;
end;

procedure TUPanel.UpdateTheme;
begin
  if ThemeManager = nil then
    begin
      Color := CustomBackColor;
      Font.Color := CustomTextColor;
    end
  else if ThemeManager.Theme = utLight then
    begin
      Color := $00E6E6E6;
      Font.Color := GetTextColorFromBackground(Color);
    end
  else
    begin
      Color := $001F1F1F;
      Font.Color := GetTextColorFromBackground(Color);
    end;
end;

procedure TUPanel.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FThemeManager) then
    FThemeManager := nil;
end;

//  SETTERS

procedure TUPanel.SetCustomBackColor(const Value: TColor);
begin
  if FCustomBackColor <> Value then
    begin
      FCustomBackColor := Value;
      UpdateTheme;
    end;
end;

procedure TUPanel.SetCustomTextColor(const Value: TColor);
begin
  if FCustomTextColor <> Value then
    begin
      FCustomTextColor := Value;
      UpdateTheme;
    end;
end;

//  MAIN CLASS

constructor TUPanel.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  //  Old properties
  BevelOuter := bvNone;
  Font.Name := 'Segoe UI';
  Font.Size := 9;

  FHitTest := true;
  FCustomTextColor := $00000000;
  FCustomBackColor := $00E6E6E6;

  UpdateTheme;
end;

end.

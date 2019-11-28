unit UCL.TUText;

interface

uses
  UCL.Classes, UCL.TUThemeManager,
  System.Classes,
  Winapi.Windows, Winapi.Messages,
  VCL.Controls, VCL.StdCtrls;

type
  TUTextKind = (tkCustom, tkNormal, tkDescription, tkEntry, tkHeading, tkTitle);

  TUText = class(TLabel, IUThemeComponent)
    private
      FThemeManager: TUThemeManager;
      FTextKind: TUTextKind;
      FUseAccentColor: Boolean;

      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetTextKind(const Value: TUTextKind);
      procedure SetUseAccentColor(const Value: Boolean);

    protected
      procedure Notification(AComponent: TComponent; Operation: TOperation); override;

    public
      constructor Create(aOwner: TComponent); override;
      procedure UpdateTheme;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;
      property TextKind: TUTextKind read FTextKind write SetTextKind default tkNormal;
      property UseAccentColor: Boolean read FUseAccentColor write SetUseAccentColor default false;
  end;

implementation

{ TUText }

//  THEME

procedure TUText.SetThemeManager(const Value: TUThemeManager);
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

procedure TUText.UpdateTheme;
begin
  //  Font color
  if TextKind = tkDescription then
    Font.Color := $666666
  else if ThemeManager = nil then
    Font.Color := $000000
  else
    begin
      if UseAccentColor then
        Font.Color := ThemeManager.AccentColor
      else if ThemeManager.Theme = utLight then
        Font.Color := $000000
      else
        Font.Color := $FFFFFF;
    end;
end;

procedure TUText.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FThemeManager) then
    FThemeManager := nil;
end;

//  SETTERS

procedure TUText.SetTextKind(const Value: TUTextKind);
begin
  if Value <> FTextKind then
    begin
      FTextKind := Value;

      if FTextKind <> tkCustom then
        begin
          if TextKind = tkEntry then
            Font.Name := 'Segoe UI Semibold'
          else
            Font.Name := 'Segoe UI';

          //  Font size
          case TextKind of
            tkNormal:
              Font.Size := 10;
            tkDescription:
              Font.Size := 9;
            tkEntry:
              Font.Size := 10;
            tkHeading:
              Font.Size := 15;
            tkTitle:
              Font.Size := 21;
          end;
        end;

      UpdateTheme;
    end;
end;

procedure TUText.SetUseAccentColor(const Value: Boolean);
begin
  if Value <> FUseAccentColor then
    begin
      FUseAccentColor := Value;
      UpdateTheme;
    end;
end;

//  MAIN CLASS

constructor TUText.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  //  New properties
  FTextKind := tkNormal;
  FUseAccentColor := false;

  Font.Name := 'Segoe UI';
  Font.Size := 10;

  UpdateTheme;
end;

end.


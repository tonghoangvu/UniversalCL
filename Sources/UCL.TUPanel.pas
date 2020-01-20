{$LEGACYIFEND ON}

unit UCL.TUPanel;

interface

uses
  UCL.Colors,
  UCL.Classes, UCL.Utils, UCL.SystemSettings, UCL.TUThemeManager,
  Windows, Messages,
  Classes, SysUtils,
  Controls, ExtCtrls, Graphics;

type
  TUPanel = class(TPanel, IUThemeComponent)
    private
      FThemeManager: TUThemeManager;
      FBackColor: TUColorSet;

      //  Child events
      procedure BackColor_OnChange(Sender: TObject);
      
      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);

    protected
      procedure Notification(AComponent: TComponent; Operation: TOperation); override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;
      procedure UpdateTheme;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;
      property BackColor: TUColorSet read FBackColor write FBackColor;
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
var
  Back: TUColorSet;
begin
  if ThemeManager = nil then
    //  Do nothing
    begin
      //  Color := Color;
      //  Font.Color := Font.Color;
    end
  else
    begin
      //  Select default or custom style
      if not BackColor.Enabled then
        Back := PANEL_BACK
      else
        Back := BackColor;

      Color := Back.GetColor(ThemeManager);
      Font.Color := GetTextColorFromBackground(Color);
    end;
  
  //  Repaint
  //  Do not repaint, because it does not override Paint method
end;

procedure TUPanel.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FThemeManager) then
    FThemeManager := nil;
end;

//  MAIN CLASS

constructor TUPanel.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  //  Old properties
  BevelOuter := bvNone;
  Font.Name := 'Segoe UI';
  Font.Size := 9;
  ParentColor := false;
  ParentBackground := false;

  //  Objects
  FBackColor := TUColorSet.Create;
  FBackColor.OnChange := BackColor_OnChange;
  FBackColor.Assign(PANEL_BACK);
end;

destructor TUPanel.Destroy;
begin
  FBackColor.Free;
  inherited;
end;

//  CHILD EVENTS

procedure TUPanel.BackColor_OnChange(Sender: TObject);
begin
  UpdateTheme;
end;

end.

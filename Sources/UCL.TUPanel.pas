{$LEGACYIFEND ON}

unit UCL.TUPanel;

interface

uses
  Windows, Messages, Classes, SysUtils, Controls, ExtCtrls, Graphics,
  UCL.Classes, UCL.Colors, UCL.Utils, UCL.SystemSettings, UCL.TUThemeManager;

type
  TUPanel = class(TPanel, IUThemeComponent)
    private
      FThemeManager: TUThemeManager;
      FBackColor: TUThemeColorSet;

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
      property BackColor: TUThemeColorSet read FBackColor write FBackColor;

      property BevelOuter default bvNone;
      property ParentColor default false;
      property ParentBackground default false;
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
  setBack: TUThemeColorSet;
begin
  //  Select active style
  if (ThemeManager = nil) or (BackColor.Enabled) then
    setBack := BackColor   //  Custom style
  else
    setBack := PANEL_BACK;  //  Default style

  //  Background & text color
  Color := setBack.GetColor(ThemeManager);
  Font.Color := GetTextColorFromBackground(Color);
  
  //  Repaint
  //  Do not repaint, not necessary
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
  ParentColor := false;
  ParentBackground := false;

  //  Objects
  FBackColor := TUThemeColorSet.Create;
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

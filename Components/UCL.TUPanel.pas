unit UCL.TUPanel;

interface

uses
  UCL.Classes, UCL.Utils, UCL.SystemSettings, UCL.TUThemeManager,
  Winapi.Windows,
  System.Classes, System.SysUtils,
  VCL.Controls, VCL.ExtCtrls, VCL.Graphics;

type
  TUPanel = class(TCustomPanel, IUThemeControl)
    private
      FThemeManager: TUThemeManager;

      FCustomTextColor: TColor;
      FCustomBackColor: TColor;

      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetCustomBackColor(const Value: TColor);
      procedure SetCustomTextColor(const Value: TColor);

    public
      constructor Create(aOwner: TComponent); override;
      procedure UpdateTheme;

      property DockManager;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;
      property CustomTextColor: TColor read FCustomTextColor write SetCustomTextColor;
      property CustomBackColor: TColor read FCustomBackColor write SetCustomBackColor;

      {$REGION 'Common properties'}
      property Align;
      property Alignment;
      property Anchors;
      property AutoSize;
      property BevelEdges;
      property BevelInner;
      property BevelKind;
      property BevelOuter;
      property BevelWidth;
      property BiDiMode;
      property BorderWidth;
      property BorderStyle;
      property Caption;
      //property Color;
      property Constraints;
      property Ctl3D;
      property UseDockManager default True;
      property DockSite;
      property DoubleBuffered;
      property DragCursor;
      property DragKind;
      property DragMode;
      property Enabled;
      property FullRepaint;
      property Font;
      property Locked;
      property Padding;
      property ParentBiDiMode;
      property ParentBackground;
      //property ParentColor;
      property ParentCtl3D;
      property ParentDoubleBuffered;
      property ParentFont;
      property ParentShowHint;
      property PopupMenu;
      property ShowCaption;
      property ShowHint;
      property TabOrder;
      property TabStop;
      property Touch;
      property VerticalAlignment;
      property Visible;
      property StyleElements;
      property OnAlignInsertBefore;
      property OnAlignPosition;
      property OnCanResize;
      property OnClick;
      property OnConstrainedResize;
      property OnContextPopup;
      property OnDockDrop;
      property OnDockOver;
      property OnDblClick;
      property OnDragDrop;
      property OnDragOver;
      property OnEndDock;
      property OnEndDrag;
      property OnEnter;
      property OnExit;
      property OnGesture;
      property OnGetSiteInfo;
      property OnMouseActivate;
      property OnMouseDown;
      property OnMouseEnter;
      property OnMouseLeave;
      property OnMouseMove;
      property OnMouseUp;
      property OnResize;
      property OnStartDock;
      property OnStartDrag;
      property OnUnDock;
      {$ENDREGION}
  end;

implementation

{ THEME }

procedure TUPanel.SetThemeManager(const Value: TUThemeManager);
begin
  if Value <> FThemeManager then
    begin
      //  Disconnect current ThemeManager
      if FThemeManager <> nil then
        FThemeManager.DisconnectControl(Self);

      //  Connect to new ThemeManager
      if Value <> nil then
        Value.ConnectControl(Self);

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

{ SETTERS }

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

{ MAIN CLASS }

constructor TUPanel.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  //  Old properties
  BevelOuter := bvNone;
  Font.Name := 'Segoe UI';
  Font.Size := 9;

  FCustomTextColor := $00000000;
  FCustomBackColor := $00E6E6E6;

  UpdateTheme;
end;

end.

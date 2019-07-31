unit UCL.TUSeparator;

interface

uses
  UCL.Classes, UCL.TUThemeManager,
  System.Classes, System.SysUtils, System.Types,
  Winapi.Messages,
  VCL.Controls, VCL.Graphics;

type
  TUCustomSeparator = class(TCustomControl, IUThemeComponent)
    private
      FThemeManager: TUThemeManager;

      FCustomColor: TColor;
      FOrientation: TUOrientation;
      FAlignSpace: Integer;

      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetAlignSpace(const Value: Integer);
      procedure SetCustomColor(const Value: TColor);
      procedure SetOrientation(const Value: TUOrientation);

      procedure WM_EraseBkGnd(var Msg: TWMEraseBkgnd); message WM_ERASEBKGND;

    protected
      procedure Paint; override;

    public
      constructor Create(aOwner: TComponent); override;
      procedure UpdateTheme;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;

      property CustomColor: TColor read FCustomColor write SetCustomColor default $999999;
      property Orientation: TUOrientation read FOrientation write SetOrientation default oVertical;
      property AlignSpace: Integer read FAlignSpace write SetAlignSpace default 10;
  end;

  TUSeparator = class(TUCustomSeparator)
    published
      // Common properties
      property Align;
      property AlignWithMargins;
      property Anchors;
      property Constraints;
      property DragCursor;
      property DragKind;
      property DragMode;
      property Enabled;
      property ParentShowHint;
      property PopupMenu;
      property ShowHint;
      property Touch;
      property Visible;

      //  Common events
      property OnClick;
      property OnContextPopup;
      property OnDblClick;
      property OnDragDrop;
      property OnDragOver;
      property OnEndDock;
      property OnEndDrag;
      property OnGesture;
      property OnMouseActivate;
      property OnMouseDown;
      property OnMouseEnter;
      property OnMouseLeave;
      property OnMouseMove;
      property OnMouseUp;
      property OnStartDock;
      property OnStartDrag;
  end;

implementation

{ THEME }

procedure TUCustomSeparator.SetThemeManager(const Value: TUThemeManager);
begin
  if Value <> FThemeManager then
    begin
      //  Disconnect current ThemeManager
      if FThemeManager <> nil then
        FThemeManager.Disconnect(Self);

      //  Connect to new ThemeManager
      if Value <> nil then
        Value.Connect(Self);

      FThemeManager := Value;
      UpdateTheme;
    end;
end;

procedure TUCustomSeparator.UpdateTheme;
begin
  Paint;
end;

{ SETTERS }

procedure TUCustomSeparator.SetAlignSpace(const Value: Integer);
begin
  if Value <> FAlignSpace then
    begin
      FAlignSpace := Value;
      UpdateTheme;
    end;
end;

procedure TUCustomSeparator.SetCustomColor(const Value: TColor);
begin
  if Value <> FCustomColor then
    begin
      FCustomColor := Value;
      UpdateTheme;
    end;
end;

procedure TUCustomSeparator.SetOrientation(const Value: TUOrientation);
begin
  if Value <> FOrientation then
    begin
      FOrientation := Value;
      UpdateTheme;
    end;
end;

{ MAIN CLASS }

constructor TUCustomSeparator.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FCustomColor := $999999;
  FOrientation := oVertical;
  FAlignSpace := 10;

  ParentColor := true;
  Width := 20;
  Height := 50;

  //UpdateTheme;
end;

{ CUSTOM METHODS }

procedure TUCustomSeparator.Paint;
begin
  inherited;

  ParentColor := true;

  //  Paint background
  Canvas.Brush.Color := Color;
  Canvas.FillRect(Rect(0, 0, Width, Height));

  if ThemeManager = nil then
    Canvas.Pen.Color := CustomColor
  else if ThemeManager.Theme = utLight then
    Canvas.Pen.Color := $999999
  else
    Canvas.Pen.Color := $666666;

  //  Paint line
  if Orientation = oVertical then
    begin
      Canvas.MoveTo(Width div 2, AlignSpace);
      Canvas.LineTo(Width div 2, Height - AlignSpace);
    end
  else
    begin
      Canvas.MoveTo(AlignSpace, Height div 2);
      Canvas.LineTo(Width - AlignSpace, Height div 2);
    end;
end;

{ MESSAGES }

procedure TUCustomSeparator.WM_EraseBkGnd(var Msg: TWMEraseBkgnd);
begin
  //  Skip message
end;

end.

unit UCL.TUSeparator;

interface

uses
  UCL.Classes, UCL.TUThemeManager, UCL.Utils,
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
      FOnlySpace: Boolean;

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetAlignSpace(const Value: Integer);
      procedure SetCustomColor(const Value: TColor);
      procedure SetOrientation(const Value: TUOrientation);

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
      property OnlySpace: Boolean read FOnlySpace write FOnlySpace default false;
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

{ TUCustomSeparator }

//  THEME

procedure TUCustomSeparator.SetThemeManager(const Value: TUThemeManager);
begin
  if Value <> FThemeManager then
    begin
      if FThemeManager <> nil then
        FThemeManager.Disconnect(Self);

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

//  SETTERS

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

//  MAIN CLASS

constructor TUCustomSeparator.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FCustomColor := $999999;
  FOrientation := oVertical;
  FAlignSpace := 10;
  FOnlySpace := false;

  ParentColor := true;
  Width := 20;
  Height := 50;
end;

//  CUSTOM METHODS

procedure TUCustomSeparator.Paint;
var
  LineColor: TColor;
begin
  inherited;

  //  Paint background
  ParentColor := true;
  Canvas.Brush.Handle := CreateSolidBrushWithAlpha(Color, 255);
  Canvas.FillRect(Rect(0, 0, Width, Height));

  if OnlySpace = true then
    exit;
  
  if ThemeManager = nil then
    LineColor := CustomColor
  else if ThemeManager.Theme = utLight then
    LineColor := $999999
  else
    LineColor := $666666;

  //  Paint line
  Canvas.Pen.Color := LineColor;
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

end.

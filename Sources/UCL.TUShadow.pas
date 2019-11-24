unit UCL.TUShadow;

interface

uses
  UCL.Classes, UCL.Utils, UCL.Graphics, UCL.TUThemeManager,
  System.Classes, System.Types,
  Winapi.Windows,
  VCL.Controls, VCL.Graphics, VCL.ExtCtrls;

type
  TUCustomShadow = class(TGraphicControl, IUThemeComponent)
    private
      var Color: TColor;
      var BlendFunc: BLENDFUNCTION;
      var BlendBmp: TBitmap;

      FThemeManager: TUThemeManager;

      FLightColor: TColor;
      FDarkColor: TColor;
      FDirection: TUDirection;

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetDirection(const Value: TUDirection);

    protected
      procedure Paint; override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;
      procedure UpdateTheme;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;

      property LightColor: TColor read FLightColor write FLightColor default $F2F2F2;
      property DarkColor: TColor read FDarkColor write FDarkColor default $2B2B2B;
      property Direction: TUDirection read FDirection write SetDirection default dLeft;
  end;

  TUShadow = class(TUCustomShadow)
    published
      property Align;
      property Anchors;
      property AutoSize;
      property BiDiMode;
      //property Caption;
      //property Color;
      property Constraints;
      property DragCursor;
      property DragKind;
      property DragMode;
      property Enabled;
      property Font;
      property ParentBiDiMode;
      property ParentColor;
      property ParentFont;
      property ParentShowHint;
      property PopupMenu;
      property ShowHint;
      property Touch;
      property Visible;
      property StyleElements;

      property OnCanResize;
      property OnClick;
      property OnConstrainedResize;
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
      property OnResize;
      property OnStartDock;
      property OnStartDrag;
  end;

implementation

{ TUCustomShadow }

//  THEME

procedure TUCustomShadow.SetThemeManager(const Value: TUThemeManager);
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

procedure TUCustomShadow.UpdateTheme;
var
  IsLightTheme: Boolean;
begin
  if ThemeManager = nil then
    IsLightTheme := true
  else
    IsLightTheme := ThemeManager.Theme = utLight;

  if IsLightTheme then
    Color := LightColor
  else
    Color := DarkColor;

  Repaint;
end;

//  SETTERS

procedure TUCustomShadow.SetDirection(const Value: TUDirection);
begin
  if Value <> FDirection then
    begin
      FDirection := Value;
      Repaint;
    end;
end;

//  MAIN CLASS

constructor TUCustomShadow.Create(aOwner: TComponent);
begin
  inherited;

  FLightColor := $F2F2F2;
  FDarkColor := $2B2B2B;
  FDirection := dLeft;

  Color := $D77800;
  BlendFunc := CreateBlendFunc(255, true);
  BlendBmp := TBitmap.Create;
end;

destructor TUCustomShadow.Destroy;
begin
  BlendBmp.Free;
  inherited;
end;

procedure TUCustomShadow.Paint;
begin
  inherited;

  BlendBmp.Width := Width;
  BlendBmp.Height := Height;

  AssignGradientBlendBitmap(BlendBmp, Color, Direction);
  PaintBlendBitmap(Canvas, GetClientRect, BlendBmp, BlendFunc);
end;

end.

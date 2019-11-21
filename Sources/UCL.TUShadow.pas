unit UCL.TUShadow;

interface

uses
  UCL.Classes, UCL.Utils, UCL.Graphics,
  System.Classes, System.Types,
  Winapi.Windows,
  VCL.Controls, VCL.Graphics, VCL.ExtCtrls;

type
  TUCustomShadow = class(TGraphicControl)
    private
      var BlendFunc: BLENDFUNCTION;
      var BlendBmp: TBitmap;

      FColor: TColor;
      FDirection: TUDirection;

      //  Setters
      procedure SetColor(const Value: TColor);
      procedure SetDirection(const Value: TUDirection);

    protected
      procedure Paint; override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

    published
      property Color: TColor read FColor write SetColor default $D77800;
      property Direction: TUDirection read FDirection write SetDirection default dLeft;
  end;

  TUShadow = class(TUCustomShadow)
    published
      property Align;
      property Anchors;
      property AutoSize;
      property BiDiMode;
      //property Caption;
      property Color;
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

//  SETTERS

procedure TUCustomShadow.SetColor(const Value: TColor);
begin
  if Value <> FColor then
    begin
      FColor := Value;

      Repaint;
    end;
end;

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

  FColor := $D77800;
  FDirection := dLeft;

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

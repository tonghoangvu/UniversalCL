{$LEGACYIFEND ON}

unit UCL.TUShadow;

interface

uses
  UCL.Classes, UCL.Utils, UCL.Graphics, UCL.TUThemeManager,
  Classes, Types,
  Windows,
  Controls, Graphics, ExtCtrls;

type
  TUCustomShadow = class(TGraphicControl, IUThemeComponent)
    private
      var Color: TColor;
      var BlendFunc: BLENDFUNCTION;
      var BlendBmp: TBitmap;

      FThemeManager: TUThemeManager;

      FLightColor: TColor;
      FDarkColor: TColor;
      FAlphaA: Byte;
      FAlphaB: Byte;
      FDirection: TUDirection;

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetAlpha(Index: Integer; const Value: Byte);      
      procedure SetColor(Index: Integer; const Value: TColor);
      procedure SetDirection(const Value: TUDirection);

    protected
      procedure Notification(AComponent: TComponent; Operation: TOperation); override;
      procedure Paint; override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;
      procedure UpdateTheme;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;

      property AlphaA: Byte index 0 read FAlphaA write SetAlpha default 255;
      property AlphaB: Byte index 1 read FAlphaB write SetAlpha default 255;
      property LightColor: TColor index 0 read FLightColor write SetColor default $F2F2F2;
      property DarkColor: TColor index 1 read FDarkColor write SetColor default $2B2B2B;
      property Direction: TUDirection read FDirection write SetDirection default dLeft;      
  end;

  TUShadow = class(TUCustomShadow)
    published
      property Align;
      property Anchors;
      property AutoSize;
      property BiDiMode;
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
    {$IF CompilerVersion > 29}
      property StyleElements;
    {$IFEND}

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
        begin
          Value.Connect(Self);
          Value.FreeNotification(Self);
        end;

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

procedure TUCustomShadow.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FThemeManager) then
    FThemeManager := nil;
end;

//  SETTERS

procedure TUCustomShadow.SetAlpha(Index: Integer; const Value: Byte);
begin
  case Index of
    0:
      if Value <> FAlphaA then
        begin
          FAlphaA := Value;
          Repaint;
        end;  
    1:
      if Value <> FAlphaB then
        begin
          FAlphaB := Value;
          Repaint;
        end;
  end;
end;

procedure TUCustomShadow.SetColor(Index: Integer; const Value: TColor);
begin
  case Index of
    0:  
      if Value <> FLightColor then
        begin
          FLightColor := Value;
          UpdateTheme;
        end;
    1:
      if Value <> FDarkColor then
        begin
          FDarkColor := Value;
          UpdateTheme;
        end;
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

  FAlphaA := 255;
  FAlphaB := 255;
  FLightColor := $F2F2F2;
  FDarkColor := $2B2B2B;
  FDirection := dLeft;

  Color := $F2F2F2;
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

  AssignGradientBlendBitmap(BlendBmp, Color, AlphaA, AlphaB, Direction);
  PaintBlendBitmap(Canvas, Rect(0, 0, Width, Height), BlendBmp, BlendFunc);
end;

end.

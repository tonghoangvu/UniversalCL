unit UCL.TUSwitch;

interface

uses
  UCL.Classes, UCL.TUThemeManager,
  Classes, SysUtils, Types, Messages,
  Controls, Graphics,
  GDIPAPI, GDIPObj, GDIPUtil;

type
  TUSwitch = class(TCustomControl, IUThemeComponent)
    private
      var ThumbSpace: Integer;
      var ActiveColor: TColor;
      var IsMouseDown: Boolean;
      
      FThemeManager: TUThemeManager;

      FIsOn: Boolean;
      FSwitchWidth: Integer;
      FSwitchHeight: Integer;

      //  Internal
      procedure UpdateColors;
      procedure UpdateRects;      

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetIsOn(const Value: Boolean);

      //  Messages
      procedure WM_LButtonDown(var Msg: TWMLButtonDown); message WM_LBUTTONDOWN;
      procedure WM_LButtonUp(var Msg: TWMLButtonUp); message WM_LBUTTONUP;

    protected
      procedure Paint; override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;
      procedure UpdateTheme;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;
      property IsOn: Boolean read FIsOn write SetIsOn default false;
      property SwitchWidth: Integer read FSwitchWidth write FSwitchWidth default 40;
      property SwitchHeight: Integer read FSwitchHeight write FSwitchHeight default 20;
      property Caption;
      property Font;
  end;

implementation

{ TUSwitch }

//  INTERNAL

procedure TUSwitch.UpdateColors;
begin
  if ThemeManager = nil then
    ActiveColor := $D77800
  else
    ActiveColor := ThemeManager.AccentColor;
end;

procedure TUSwitch.UpdateRects;
begin

end;

//  THEME

procedure TUSwitch.SetThemeManager(const Value: TUThemeManager);
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

procedure TUSwitch.UpdateTheme;
begin
  UpdateColors;
  Repaint;
end;

//  SETTERS

procedure TUSwitch.SetIsOn(const Value: Boolean);
begin
  if Value <> FIsOn then
    begin
      FIsOn := Value;
      UpdateRects;
      Repaint;
    end;
end;

//  MAIN CLASS

constructor TUSwitch.Create(aOwner: TComponent);
begin
  inherited;

  ThumbSpace := 5;
  ActiveColor := $D77800;
  IsMouseDown := false;

  Width := 45;
  Height := 20;
  ParentColor := true;
end;

destructor TUSwitch.Destroy;
begin

  inherited;
end;

//  CUSTOM METHODS

procedure TUSwitch.Paint;
var
  Graphic: TGPGraphics;
  Pen: TGPPen;
  ThumbBrush: TGPSolidBrush;
  T, L, W, H: Integer;
  ThumbRect: TGPRectF;

  TextH: Integer;
begin
  inherited;

  T := (Height - 20) div 2;
  L := 0;
  W := {Width}45;
  H := {Height}20;

  ThumbRect.X := L + 6;
  ThumbRect.Y := T + 5;
  ThumbRect.Height := (H - 11);
  ThumbRect.Width := ThumbRect.Height;
  //  Right thumb
  if IsOn then
    ThumbRect.X := W - 5 - ThumbRect.Width;

  Graphic := TGPGraphics.Create(Canvas.Handle);
  Pen := TGPPen.Create(MakeColor(255, 0, 0, 0), 2);
  ThumbBrush := TGPSolidBrush.Create(MakeColor(255, 255, 255, 255));
  try
    //  Prepair colors
    if IsOn or IsMouseDown then
      begin
        Pen.SetStartCap(LineCapRound);
        Pen.SetEndCap(LineCapRound); 
        Pen.SetWidth(H);
        if not IsMouseDown then
          Pen.SetColor(MakeColor(255, 2, 113, 213))
        else
          Pen.SetColor(MakeColor(255, 102, 102, 102));
        ThumbBrush.SetColor(MakeColor(255, 255, 255, 255));
      end
    else 
      begin
        Pen.SetWidth(2);
        Pen.SetColor(MakeColor(255, 51, 51, 51));
        ThumbBrush.SetColor(MakeColor(255, 0, 0, 0));        
      end;


    if IsOn or IsMouseDown then
      begin
        Graphic.SetSmoothingMode(SmoothingModeAntiAlias);
        Graphic.DrawLine(Pen, L + (H/2), T + (H/2), L + W - (H / 2), T + (H / 2));
        Graphic.DrawLine(Pen, L + (H/2), T + (H/2), L + W - (H / 2), T + (H / 2));
      end
    else
      begin
        
        //  Draw top / bottom border
        Graphic.SetSmoothingMode(SmoothingModeNone);
        Graphic.DrawLine(pen, L + (H - 1) div 2, T + 1, L + W - (H - 1) div 2, T + 1);
        Graphic.DrawLine(pen, L + (H - 1) div 2 - 1, T + H - 1, L + W - (H - 1) div 2 + 2, T + H - 1);
    
        //  Draw left / right arc
        Graphic.SetSmoothingMode(SmoothingModeAntiAlias);
        Graphic.DrawArc(pen, L + 1, T, H - 1, H - 1, -100, -155);
        Graphic.DrawArc(pen, W - H - 1, T, H - 1, H - 1, -80, 155);    
      end;

    //  Draw thumb
    Graphic.FillEllipse(ThumbBrush, ThumbRect);

    Canvas.Font := Font;
    TextH := Canvas.TextHeight(Caption);
    Canvas.TextOut(W + 7, (Height - TextH) div 2 - 1, Caption);
  finally
    ThumbBrush.Free;
    Pen.Free;
    Graphic.Free;
  end;
end;

//  MESSAGES

procedure TUSwitch.WM_LButtonDown(var Msg: TWMLButtonDown);
begin
  inherited;
  if Msg.XPos <= 45 + 5 then
    begin
      IsMouseDown := true;
      Repaint;
    end;
end;

procedure TUSwitch.WM_LButtonUp(var Msg: TWMLButtonUp);
begin
  inherited;
  if Msg.XPos <= 45 + 5 then
    begin
      IsMouseDown := false;
      IsOn := not IsOn;
    end;
end;

end.

{$LEGACYIFEND ON}

unit UCL.TUSeparator;

interface

uses
  Classes, Messages, Controls, Graphics,
  UCL.Classes, UCL.TUThemeManager, UCL.Utils;

type
  TUCustomSeparator = class(TGraphicControl, IUThemeComponent)
    private
      var LineColor: TColor;

      FThemeManager: TUThemeManager;

      FCustomColor: TColor;
      FOrientation: TUOrientation;
      FAlignSpace: Integer;
      FLineBetween: Boolean;
      FUseAccentColor: Boolean;

      //  Internal
      procedure UpdateColors;

      //  Setters
      procedure SetThemeManager(const Value: TUThemeManager);
      procedure SetCustomColor(const Value: TColor);
      procedure SetOrientation(const Value: TUOrientation);
      procedure SetAlignSpace(const Value: Integer);
      procedure SetLineBetween(const Value: Boolean);
      procedure SetUseAccentColor(const Value: Boolean);

    protected
      procedure Notification(AComponent: TComponent; Operation: TOperation); override;
      procedure Paint; override;

    public
      constructor Create(aOwner: TComponent); override;
      procedure UpdateTheme;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;

      property CustomColor: TColor read FCustomColor write SetCustomColor default $999999;
      property Orientation: TUOrientation read FOrientation write SetOrientation default oVertical;
      property AlignSpace: Integer read FAlignSpace write SetAlignSpace default 10;
      property LineBetween: Boolean read FLineBetween write SetLineBetween default true;
      property UseAccentColor: Boolean read FUseAccentColor write SetUseAccentColor default false;

      property Height default 50;
      property Width default 20;
  end;

  TUSeparator = class(TUCustomSeparator)
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

{ TUCustomSeparator }

//  THEME

procedure TUCustomSeparator.SetThemeManager(const Value: TUThemeManager);
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

procedure TUCustomSeparator.UpdateTheme;
begin
  UpdateColors;
  Repaint;
end;

procedure TUCustomSeparator.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FThemeManager) then
    FThemeManager := nil;
end;

//  INTERNAL

procedure TUCustomSeparator.UpdateColors;
begin
  if ThemeManager = nil then
    LineColor := CustomColor
  else if UseAccentColor then
    LineColor := ThemeManager.AccentColor
  else if ThemeManager.Theme = utLight then
    LineColor := $999999
  else
    LineColor := $666666;
end;

//  SETTERS

procedure TUCustomSeparator.SetAlignSpace(const Value: Integer);
begin
  if Value <> FAlignSpace then
    begin
      FAlignSpace := Value;
      //
      Repaint;
    end;
end;

procedure TUCustomSeparator.SetCustomColor(const Value: TColor);
begin
  if Value <> FCustomColor then
    begin
      FCustomColor := Value;
      UpdateColors;
      Repaint;
    end;
end;

procedure TUCustomSeparator.SetLineBetween(const Value: Boolean);
begin
  if Value <> FLineBetween then
    begin
      FLineBetween := Value;
      //
      Repaint;
    end;
end;

procedure TUCustomSeparator.SetOrientation(const Value: TUOrientation);
begin
  if Value <> FOrientation then
    begin
      FOrientation := Value;
      //
      Repaint;
    end;
end;

procedure TUCustomSeparator.SetUseAccentColor(const Value: Boolean);
begin
  if Value <> FUseAccentColor then
    begin
      FUseAccentColor := Value;
      UpdateColors;
      Repaint;
    end;
end;

//  MAIN CLASS

constructor TUCustomSeparator.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FCustomColor := $000000;
  FOrientation := oVertical;
  FAlignSpace := 10;
  FLineBetween := true;
  FUseAccentColor := false;

  Width := 20;
  Height := 50;

  UpdateColors;
end;

//  CUSTOM METHODS

procedure TUCustomSeparator.Paint;
begin
  inherited;

  if not LineBetween then exit;

  //  Draw line
  Canvas.Brush.Style := bsClear;
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

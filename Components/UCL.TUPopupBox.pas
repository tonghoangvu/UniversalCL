unit UCL.TUPopupBox;

interface

uses
  UCL.Classes, UCL.TUThemeManager, UCL.Utils, UCL.IntAnimation,
  System.Classes, System.SysUtils, System.Types,
  Winapi.Messages, Winapi.Windows,
  VCL.Controls, VCL.ExtCtrls, VCL.Forms, VCL.Graphics;

type
  TUPopupKind = (pkDown, pkUp);

  TUPopupBox = class(TCustomControl, IUThemeControl)
    private
      FThemeManager: TUThemeManager;

      FPopupKind: TUPopupKind;
      FCustomBackColor: TColor;
      FCustomBorderColor: TColor;
      FIsShowing: Boolean;

      FOldParent: TWinControl;

      procedure SetThemeManager(const Value: TUThemeManager);

      procedure PopupDeactive(Sender: TObject);

    protected
      procedure Paint; override;

    public
      constructor Create(aOwner: TComponent); override;
      procedure UpdateTheme;
      procedure Popup(X, Y: Integer); overload;
      procedure Popup; overload;

    published
      property ThemeManager: TUThemeManager read FThemeManager write SetThemeManager;

      property PopupKind: TUPopupKind read FPopupKind write FPopupKind default pkDown;
      property CustomBackColor: TColor read FCustomBackColor write FCustomBackColor default $E6E6E6;
      property CustomBorderColor: TColor read FCustomBorderColor write FCustomBorderColor default $C6C6C6;
      property IsShowing: Boolean read FIsShowing;
  end;

implementation

{ THEME }

procedure TUPopupBox.SetThemeManager(const Value: TUThemeManager);
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

procedure TUPopupBox.UpdateTheme;
begin
  if ThemeManager = nil then
    begin
      Color := CustomBackColor;
      Canvas.Pen.Color := CustomBorderColor;
    end
  else if ThemeManager.Theme = utLight then
    begin
      Color := $E6E6E6;
      Canvas.Pen.Color := $C6C6C6;
    end
  else
    begin
      Color := $1F1F1F;
      Canvas.Pen.Color := $141414;
    end;

  Canvas.Brush.Color := Self.Color;
  Font.Color := GetTextColorFromBackground(Color);
end;

{ MAIN CLASS }

constructor TUPopupBox.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FPopupKind := pkDown;
  FCustomBackColor := $E6E6E6;
  FCustomBorderColor := $C6C6C6;

  FIsShowing := false;

  if csDesigning in ComponentState then
    Visible := true
  else
    Visible := false;
  BevelOuter := bvNone;
  Width := 240;
  Height := 115;
  Padding.SetBounds(1, 5, 1, 5);

  Canvas.Pen.Width := 1;

  UpdateTheme;
end;

procedure TUPopupBox.Popup(X, Y: Integer);
var
  ClickPoint: TPoint;
  PopupForm: TForm;
  Ani: TIntAni;
begin
  if FIsShowing = true then
    exit
  else
    FIsShowing := true;

  ClickPoint.X := X;
  ClickPoint.Y := Y;

  Application.CreateForm(TForm, PopupForm);
  PopupForm.BorderStyle := bsNone;
  PopupForm.FormStyle := fsStayOnTop;
  PopupForm.Width := Self.Width;
  PopupForm.Color := Self.Color;

  PopupForm.OnDeactivate := PopupDeactive;

  Self.Top := 0;
  Self.Left := 0;
  Self.Align := alTop;

  FOldParent := Self.Parent;
  Self.Parent := PopupForm;
  Self.Visible := true;

  PopupForm.Show;
  PopupForm.Color := $E6E6E6;
  PopupForm.Left := ClickPoint.X;
  PopupForm.Top := ClickPoint.Y;

  if PopupKind = pkDown then
    Ani := TIntAni.Create(akOut, afkQuartic, 0, Self.Height,
      procedure (Value: Integer)
      begin
        PopupForm.Height := Value;
      end, true)
  else
    Ani := TIntAni.Create(akOut, afkQuartic, 0, Self.Height,
      procedure (Value: Integer)
      begin
        PopupForm.Top := Y - Value;
        PopupForm.Height := Value;
      end, true);


  Ani.Step := 20;
  Ani.Duration := 200;

  Ani.Start;
end;

procedure TUPopupBox.Popup;
begin
  Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TUPopupBox.PopupDeactive(Sender: TObject);
var
  Ani: TIntAni;
  FirstTop: Integer;
begin
  //  Not inherited

  if Sender is TForm = false then
    exit;

  if PopupKind = pkDown then
    Ani := TIntAni.Create(akOut, afkQuartic, (Sender as TForm).Height, 0,
      procedure (Value: Integer)
      begin
        (Sender as TForm).Height := Value;
      end, true)
  else
    begin
      FirstTop := (Sender as TForm).Top + (Sender as TForm).Height;
      Ani := TIntAni.Create(akOut, afkQuartic, (Sender as TForm).Height, 0,
        procedure (Value: Integer)
        begin
          (Sender as TForm).Top := FirstTop - Value;
          (Sender as TForm).Height := Value;
        end, true);
    end;

  Ani.OnDone := procedure
    begin
      (Sender as TForm).Close;
      FIsShowing := false;
      Self.Align := alNone;
      Self.Visible := false;
      Self.Parent := FOldParent;
    end;

  Ani.Step := 20;
  Ani.Duration := 200;

  Ani.Start;
end;

{ CUSTOM METHODS }

procedure TUPopupBox.Paint;
begin
  inherited;

  Canvas.Rectangle(0, 0, Width, Height);  //  Paint border
  Canvas.FillRect(Rect(1, 1, Width - 2, 5));  //  Paint top rect
  Canvas.FillRect(Rect(1, Height - 5, Width - 2, Height - 1));  //  Paint bottom rect
end;

end.

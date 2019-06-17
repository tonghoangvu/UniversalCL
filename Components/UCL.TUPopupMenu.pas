unit UCL.TUPopupMenu;

interface

uses
  UCL.Classes, UCL.TUThemeManager, UCL.TUPopupBox,
  System.Classes, System.SysUtils,
  VCL.Controls, VCL.Menus;

type
  TUPopupMenu = class(TPopupMenu{, IUThemeControl})
    private
      FPopupBox: TUPopupBox;
      FUseNewPopup: Boolean;

    public
      constructor Create(aOwner: TComponent); override;
      procedure Popup(X, Y: Integer); override;

    published
      property PopupBox: TUPopupBox read FPopupBox write FPopupBox;
      property UseNewPopup: Boolean read FUseNewPopup write FUseNewPopup default true;
  end;

implementation

{ TUPopupMenu }

constructor TUPopupMenu.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FUseNewPopup := true;
end;

procedure TUPopupMenu.Popup(X, Y: Integer);
begin
  if UseNewPopup = false then
    inherited
  else
    begin
      DoPopup(Self);
      if PopupBox <> nil then
        PopupBox.Popup(X, Y);
    end;
end;

end.

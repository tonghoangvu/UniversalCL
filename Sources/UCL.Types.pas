unit UCL.Types;

interface

{$IF CompilerVersion <= 30}
uses
  Types;

type
  TRectHelper = record helper for TRect
  private
    function GetWidth: Integer;
    procedure SetWidth(const Value: Integer);
    function GetHeight: Integer;
    procedure SetHeight(const Value: Integer);
    function GetSize: TSize;
    procedure SetSize(const Value: TSize);
  public
    class function Empty: TRect; inline; static;
    function IsEmpty: Boolean;
    function Contains(const Pt: TPoint): Boolean; overload;
    function Contains(const R: TRect): Boolean; overload;
    function IntersectsWith(const R: TRect): Boolean;
    class function Intersect(const R1: TRect; const R2: TRect): TRect; overload; static;
    procedure Intersect(const R: TRect); overload;
    class function Union(const R1: TRect; const R2: TRect): TRect; overload; static;
    procedure Union(const R: TRect); overload;
    procedure Offset(const DX, DY: Integer); overload;
    procedure Offset(const Point: TPoint); overload;
    procedure Inflate(const DX, DY: Integer); overload;
    procedure Inflate(const DL, DT, DR, DB: Integer); overload;
    function CenterPoint: TPoint;
    //
    property Width: Integer read GetWidth write SetWidth;
    property Height: Integer read GetHeight write SetHeight;
    property Size: TSize read GetSize write SetSize;
  end;

  TPointHelper = record helper for TPoint
  public
    class function Zero: TPoint; inline; static;

    procedure SetLocation(const X, Y : Integer); overload;
    procedure SetLocation(const P : TPoint); overload;
    procedure Offset(const DX, DY : Integer); overload;
    procedure Offset(const Point: TPoint); overload;
    function Add(const Point: TPoint): TPoint;
    function Subtract(const Point: TPoint): TPoint;
    function IsZero : Boolean;
  end;
{$IFEND}

implementation

{$IF CompilerVersion <= 30}

{ TRectHelper }

function TRectHelper.GetWidth: Integer;
begin
  Result := Self.Right - Self.Left;
end;

procedure TRectHelper.SetWidth(const Value: Integer);
begin
  Self.Right := Self.Left + Value;
end;

function TRectHelper.GetHeight: Integer;
begin
  Result := Self.Bottom - Self.Top;
end;

procedure TRectHelper.SetHeight(const Value: Integer);
begin
  Self.Bottom := Self.Top + Value;
end;

function TRectHelper.GetSize: TSize;
begin
  Result.cx := Width;
  Result.cy := Height;
end;

procedure TRectHelper.SetSize(const Value: TSize);
begin
  Width := Value.cx;
  Height := Value.cy;
end;

class function TRectHelper.Empty: TRect;
begin
  Result := Rect(0, 0, 0, 0);
end;

function TRectHelper.IsEmpty: Boolean;
begin
  Result := IsRectEmpty(Self);
end;

function PtInRect(const Rect: TRect; const P: TPoint): Boolean;
begin
  Result := (P.X >= Rect.Left) and (P.X < Rect.Right) and (P.Y >= Rect.Top) and (P.Y < Rect.Bottom);
end;

function TRectHelper.Contains(const PT: TPoint): Boolean;
begin
  Result := PtInRect(self, PT);
end;

function TRectHelper.Contains(const R: TRect): Boolean;
begin
  Result := (Self.Left <= R.Left)
        and (Self.Right >= R.Right)
        and (Self.Top <= R.Top)
        and (Self.Bottom >= R.Bottom);
end;

function TRectHelper.IntersectsWith(const R: TRect): Boolean;
begin
  Result := (Self.Left < R.Right)
        and (Self.Right > R.Left)
        and (Self.Top < R.Bottom)
        and (Self.Bottom > R.Top);
end;

class function TRectHelper.Intersect(const R1: TRect; const R2: TRect): TRect;
begin
  IntersectRect(Result, R1, R2);
end;

procedure TRectHelper.Intersect(const R: TRect);
begin
  Self := Intersect(Self, R);
end;

class function TRectHelper.Union(const R1: TRect; const R2: TRect): TRect;
begin
  UnionRect(Result, R1, R2);
end;

procedure TRectHelper.Union(const R: TRect);
begin
  Self := Union(Self, R);
end;

procedure TRectHelper.Offset(const DX, DY: Integer);
begin
  TopLeft.Offset(DX, DY);
  BottomRight.Offset(DX, DY);
end;

procedure TRectHelper.Offset(const Point: TPoint);
begin
  TopLeft.Offset(Point);
  BottomRight.Offset(Point);
end;

procedure TRectHelper.Inflate(const DX, DY: Integer);
begin
  TopLeft.Offset(-DX, -DY);
  BottomRight.Offset(DX, DY);
end;

procedure TRectHelper.Inflate(const DL, DT, DR, DB: Integer);
begin
  TopLeft.Offset(-DL, -DT);
  BottomRight.Offset(DR, DB);
end;

function TRectHelper.CenterPoint: TPoint;
begin
  Result.X := (Right - Left) div 2 + Left;
  Result.Y := (Bottom - Top) div 2 + Top;
end;

{ TPointHelper }

class function TPointHelper.Zero: TPoint;
begin
  Result.X := 0;
  Result.Y := 0;
end;

procedure TPointHelper.SetLocation(const X, Y: Integer);
begin
  Self.X := X;
  Self.Y := Y;
end;

procedure TPointHelper.SetLocation(const P: TPoint);
begin
  Self := P;
end;

procedure TPointHelper.Offset(const DX, DY: Integer);
begin
  Inc(Self.X, DX);
  Inc(Self.Y, DY);
end;

procedure TPointHelper.Offset(const Point: TPoint);
begin
  Self.Offset(Point.X, Point.Y);
end;

function TPointHelper.Add(const Point: TPoint): TPoint;
begin
  Result.SetLocation(Self.X + Point.X, Self.Y + Point.Y);
end;

function TPointHelper.Subtract(const Point: TPoint): TPoint;
begin
  Result.SetLocation(Self.X - Point.X, Self.Y - Point.Y);
end;

function TPointHelper.IsZero: Boolean;
begin
  Result := (X = 0) and (Y = 0);
end;

{$IFEND}

end.

program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  a, b, c, x1, y1, x2, y2, x3, y3, x4, y4, p, S, S1, S2, S3: Double;
  PointInsideTriangle, PointOnVertex, PointOnEdge: Boolean;

begin
////////////////////////////////////////////
  Write('Введіть координати x1: ');
  ReadLn(x1);
  Write('Введіть координати y1: ');
  ReadLn(y1);
////////////////////////////////////////////
  Write('Введіть координати x2: ');
  ReadLn(x2);
  Write('Введіть координати y2: ');
  ReadLn(y2);
////////////////////////////////////////////
  Write('Введіть координати x3: ');
  ReadLn(x3);
  Write('Введіть координати y3: ');
  ReadLn(y3);
////////////////////////////////////////////
  Write('Введіть координати x4: ');
  ReadLn(x4);
  Write('Введіть координати y4: ');
  ReadLn(y4);
////////////////////////////////////////////
  a := sqrt(sqr(x2 - x1) + sqr(y2 - y1));
  b := sqrt(sqr(x3 - x2) + sqr(y3 - y2));
  c := sqrt(sqr(x1 - x3) + sqr(y1 - y3));
////////////////////////////////////////////
  p := (a + b + c) / 2;
  S := sqrt(p * (p - a) * (p - b) * (p - c));
////////////////////////////////////////////
  p := (a + sqrt(sqr(x4 - x1) + sqr(y4 - y1) ) + sqrt(sqr(x4 - x2) + sqr(y4 - y2))) / 2;
  S1 := sqrt(p * (p - a) * sqrt(sqr(x4 - x1) + sqr(y4 - y1)));
  p := (b + sqrt(sqr(x4 - x2) + sqr(y4 - y2) ) + sqrt(sqr(x4 - x3) + sqr(y4 - y3))) / 2;
  S2 := sqrt(p * (p - b) * sqrt(sqr(x4 - x2) + sqr(y4 - y2)));
  p := (b + sqrt(sqr(x4 - x2) + sqr(y4 - y2) ) + sqrt(sqr(x4 - x3) + sqr(y4 - y3))) / 2;
  S3 := sqrt(p * (p - c) * sqrt(sqr(x4 - x3) + sqr(y4 - y3)));
  p := (c + sqrt(sqr(x4 - x3) + sqr(y4 - y3) ) + sqrt(sqr(x4 - x1) + sqr(y4 - y1))) / 2;
////////////////////////////////////////////
  PointInsideTriangle := Abs(S - (S1 + S2 + S3)) < 1e-6;
  if PointInsideTriangle then
    begin
////////////////////////////////////////////
    PointOnVertex := (x4 = x1) and (y4 = y1) or
                     (x4 = x2) and (y4 = y2) or
                     (x4 = x3) and (y4 = y3);

    PointOnEdge := (Abs(S - S1) < 1e-6) or
                   (Abs(S - S2) < 1e-6) or
                   (Abs(S - S3) < 1e-6);
////////////////////////////////////////////
    if PointOnVertex then
      WriteLn('Точка знаходиться на вершині трикутника.')
    else if PointOnEdge then
      WriteLn('Точка знаходиться на одній із сторін трикутника.')
    end
  else
    WriteLn('Точка знаходиться поза трикутником.');
ReadLn;
end.


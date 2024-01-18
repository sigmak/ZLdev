unit utils;

interface
uses
   SysUtils,
   WinTypes,
   WinProcs,
   Classes,
   Consts;

//type


function  AppendSlash(Source:string):string;
function  NPos(const C: string; S: string; StartPos,Length: Integer): Integer;

implementation

// �ҽ� ���ڿ��� '/'�� �� ������ ��� , /�� �ٿ��ش�.
function  AppendSlash(Source:string):string;
var
  S:string;
begin
  Result:= Source;
  if Source = '' then Exit;
  if Source[Length(Source)]<>'\' then S:=Source+'\'
  else S:=Source;
  Result:=S;
end;

// ���ڿ�S�� N��° ���ں��� Length������ ���ڿ��� C���ڿ��� �ִ��� �˻��Ѵ�.
function NPos(const C: string; S: string; StartPos,Length: Integer): Integer;
var
  I: Integer;
  S1:string;
begin
  Result := 0;
  if (S = '') then Exit;
  S1:= Copy(S,StartPos,Length);
  I:=Pos(UpperCase(C),UpperCase(S1));
  if I>0 then Result:= I+StartPos;
end;


end.

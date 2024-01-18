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

// 소스 문자열이 '/'로 안 끝나는 경우 , /를 붙여준다.
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

// 문자열S의 N번째 문자부터 Length까지의 문자열에 C문자열이 있는지 검사한다.
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

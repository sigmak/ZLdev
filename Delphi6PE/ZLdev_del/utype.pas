unit utype;

interface

uses
   Windows,
   Classes, // class(TComponent) 사용을 위해
   SysUtils, Controls, Forms;


//   Windows,Classes, SysUtils, Messages, Controls, Forms,Graphics, TypInfo,
//   DsgnIntf,Proxy,buttons,menus,clipbrd, comobj;


type
  TProjectInfo = class(TComponent)
  private
     fProjectName,fProjectPath:string;
     //fProjectState : TProjectState;
     fUnitItems:TStringList;
     fFormItems:TStringList;
     fProjectSource:TStringList;
     fMainForm:string;
     fTitle:string;
     fHelpFile:string;
     function  GetStrValue(const Str:string):string;
     procedure GetMainForm;
     function  GetStrPos(const Str:string):Integer;

     
  protected
//     procedure SetUnitItems(Value:TStringList);
     //procedure SetFormItems(Value:TStringList);


  public
     constructor Create(AOwner: TComponent); override;
     destructor Destroy; override;

     procedure UpdateProject(Sender:TObject);

     property ProjectSource : TStringList read fProjectSource write fProjectSource;


end;



implementation

//uses


{TProjectInfo}
constructor TProjectInfo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  fUnitItems := TStringList.Create;
  fFormItems := TStringList.Create;
  fProjectSource := TStringList.Create;
  ProjectSource.OnChange:=UpdateProject;
end;

destructor TProjectInfo.Destroy;
begin
  fUnitItems.Free;
  fFormItems.Free;
  fProjectSource.Free;
  inherited Destroy;
end;

procedure TProjectInfo.UpdateProject(Sender:TObject);
var
   I:Integer;
begin
   for I:=0 to ProjectSource.Count-1 do begin
       if Pos('Application.Title',ProjectSource[I])>0 then  fTitle:=GetStrValue(ProjectSource[I]);
       if Pos('Application.HelpFile',ProjectSource[I])>0 then  fHelpFile:=GetStrValue(ProjectSource[I]);
   end;
   GetMainForm;
end;

// 프로젝트 소스에서 문자열의 할당된 값(이름)을 돌려준다.
function TProjectInfo.GetStrValue(const Str:string):string;
var
  Pos1,Pos2:Integer;
  S:String;
begin
   Pos1:=Pos(':=',Str);
   Pos2:=Pos(';',Str);
   S:=Trim(Copy(Str,Pos1+2,Pos2-Pos1-2));
   Result:=Copy(S,2,Length(S)-2);
end;

procedure TProjectInfo.GetMainForm;
var
  I,Pos1,Pos2:Integer;
begin
   I:=GetStrPos('Application.CreateForm');
   if I<>-1 then begin
      Pos1:=Pos(',',ProjectSource[I]);
      Pos2:=Pos(')',ProjectSource[I]);
      if Pos1>0 then fMainForm:=Trim(Copy(ProjectSource[I],Pos1+1,Pos2-Pos1-1));
   end;
end;

// 프로젝트 소스에서 특정한 문자열이 있는 행을 알려준다.
function TProjectInfo.GetStrPos(const Str:string):Integer;
var
  I:Integer;
begin
   Result:=-1;
   for I:=0 to ProjectSource.Count-1 do
       if Pos(Str,ProjectSource[I])>0 then begin
          Result:=I;
          Exit;
       end;
end;



end.

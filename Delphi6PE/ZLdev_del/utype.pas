unit utype;

interface

uses
   Windows, SysUtils, Controls, Forms;


type
  TProjectInfo = class(TComponent)
  private
     fProjectName,fProjectPath:string;
     fProjectState : TProjectState;
     fUnitItems:TStringList;
     fFormItems:TStringList;
     fProjectSource:TStringList;
     fMainForm:string;
     fTitle:string;
     fHelpFile:string;
     
  protected
     procedure SetUnitItems(Value:TStringList);
     procedure SetFormItems(Value:TStringList);


  public
end;



implementation

end.

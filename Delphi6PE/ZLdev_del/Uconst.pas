unit Uconst;
// 프로젝트에서 사용하는 전역 변수와 상수 정의

interface
uses
  utype,     //TProjectInfo 사용을 위해
  IniFiles,
  ComCtrls;  //

const
   IniName='Handel.ini';
   
var
   ProjectInfo:TProjectInfo;
   TempDir:string;
   FilePath:string;
   IniFile:TIniFile;
   SelectedComponentName:string;
   
implementation

end.

unit Uconst;
// ������Ʈ���� ����ϴ� ���� ������ ��� ����

interface
uses
  utype,     //TProjectInfo ����� ����
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

unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type

  TOpenUnitList = record
     FileName:string;
     Modified:Boolean;
     Closed:Boolean;
  end;

  TFMainForm = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    SourceList: TStringList;  // 폼 파일의 텍스트 표현을 저장한다.
    
  public
    { Public declarations }
    ToggleFormUnit:Boolean;    
    UnitCount:Integer;                            // 이때까지 생성한 에디터의 수
    OpenUnitList: array [1..255] of TOpenUnitList;  // 작업중인 유니트의 목록 보관
  end;

var
  FMainForm: TFMainForm;

implementation

//uses
//        ObjectInspec;

{$R *.dfm}

procedure TFMainForm.FormCreate(Sender: TObject);
var
  Delphi:string;
begin
    // 프로젝트 환경을 초기화한다.
    Left:=0;
    Top:=0;
    UnitCount:= 1;
    OpenUnitList[1].FileName:= 'unit1.pas';
    ToggleFormUnit:=False;
    //ProjectInfo:=TProjectInfo.Create(self); // 오류발생

end;

end.

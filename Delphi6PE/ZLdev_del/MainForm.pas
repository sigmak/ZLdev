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
    SourceList: TStringList;  // �� ������ �ؽ�Ʈ ǥ���� �����Ѵ�.
    
  public
    { Public declarations }
    ToggleFormUnit:Boolean;    
    UnitCount:Integer;                            // �̶����� ������ �������� ��
    OpenUnitList: array [1..255] of TOpenUnitList;  // �۾����� ����Ʈ�� ��� ����
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
    // ������Ʈ ȯ���� �ʱ�ȭ�Ѵ�.
    Left:=0;
    Top:=0;
    UnitCount:= 1;
    OpenUnitList[1].FileName:= 'unit1.pas';
    ToggleFormUnit:=False;
    //ProjectInfo:=TProjectInfo.Create(self); // �����߻�

end;

end.

unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  utype, // TProjectInfo ����� ����
  uconst,// ProjectInfo ����� ����
  utils, // AppendSlash ����� ����
  ComCtrls, //TTabSheet ����� ����
  Buttons,  // TSpeedButton ����� ����
  
  Dialogs;

type

  TOpenUnitList = record
     FileName:string;
     Modified:Boolean;
     Closed:Boolean;
  end;

  TFMainForm = class(TForm)
    PageControl1: TPageControl;
    procedure FormCreate(Sender: TObject);
    procedure sbButtonClick(Sender: TObject);
    procedure MakeBitmap(Component:TSpeedButton;ComponentName:string);
    procedure LoadDefaultButton(TabSheet:TTabSheet);


  private
    { Private declarations }
    SourceList: TStringList;  // �� ������ �ؽ�Ʈ ǥ���� �����Ѵ�.
    fShiftKeyed:Boolean;
    procedure LoadingComponents;
    procedure LoadDefaultPalette;
    procedure CreatePalettePage(PalettePage:string);
    function  UniqueName(Comp:TComponent):string;
    function  TryName(const Test:string;Comp:TComponent):Boolean;


    
  public
    { Public declarations }
    ToggleFormUnit:Boolean;    
    UnitCount:Integer;                            // �̶����� ������ �������� ��
    OpenUnitList: array [1..255] of TOpenUnitList;  // �۾����� ����Ʈ�� ��� ����
    procedure ReadClass;
    property  ShiftKeyed:Boolean read fShiftKeyed write fShiftKeyed;
  end;


var
  FMainForm: TFMainForm;

implementation

uses
    IniFiles;    //TIniFile ����� ����
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
    ProjectInfo:=TProjectInfo.Create(self); // �����߻� -> 2024.01.18 ���� 5�� �ذ�
    GetDir(0,TempDir); // TempDir �� Uconst���� ����
    TempDir:= AppendSlash(TempDir);
    FilePath:=ExtractFilePath(Application.ExeName);
    IniFile:=TIniFile.Create(FilePath+IniName);
    LoadingComponents;

    

end;


procedure TFMainForm.LoadingComponents;
// Dynamic loading components
var
  PaletteList:TStringList;
  I:Integer;
  PalettePage:string;
begin
   PaletteList:= TStringList.Create;
   ReadClass;
   IniFile.ReadSectionValues('Palette',PaletteList);
   if PaletteList.Count <= 0 then begin
      LoadDefaultPalette;
      IniFile.ReadSectionValues('Palette',PaletteList);
   end;
   for I:=0 to PaletteList.Count - 1 do begin
      PalettePage:= PaletteList.Names[I];
      if PalettePage <> '' then CreatePalettePage(PalettePage);
   end;
end;

procedure TFMainForm.ReadClass;
// �� ���Ͽ� �ִ� ���۳�Ʈ�� Ŭ������ ����Ѵ�.
begin
    RegisterClasses([TForm
                     //,
                     //TButton,TMainMenu,TPopupMenu,TLabel,TEdit,TMemo,
                     //TRadioButton,TCheckBox,TListBox,TComboBox,TScrollBar,
                     //TGroupBox,TRadioGroup,TPanel,TBitBtn,TSpeedButton,TMaskEdit,
                     //TStringGrid,TImage,TShape,TBevel,TScrollBox,TTabControl,
                     //TPageControl,TTreeView,TListView,TImageList,THeaderControl,
                     //TRichEdit,TStatusBar,TTrackBar,TProgressBar,TUpDown,THotKey,
                     //{$IFDEF DBVERSION}
                     //TTable,TQuery,TDataSource,TStoredProc,TDatabase,TSession,
                     //TBatchMove,TUpdateSQL,TDBGrid,TDBNavigator,TDBText,TDBEdit,
                     //TDBMemo,TDBImage,TDBListBox,TDBComboBox,TDBCheckBox,TDBRadioGroup,
                     //TDBLookupListBox,TDBLookupComboBox,TDBCtrlGrid,
                     //TDBRichedit,TDBLookupList,TDBLookupCombo,
                     //{$ENDIF}
                     //TTimer,
                     //TPaintBox,TFileListBox,TDirectoryListBox,TDriveComboBox,
                     //TFilterComboBox,TMediaPlayer,TGauge,TColorGrid,
                     //TSpinButton,TSpinEdit,TDirectoryOutline,TCalendar,TWrapperControl,
                     //TOpenDialog,TTabSheet,TSaveDialog,TFontDialog,TToolBar,TCoolBar,
                     //TToolButton,TPrintDialog,TAnimate,TNotebook,TFindDialog,
                     //TReplaceDialog,TOpenPictureDialog,TSavePictureDialog,
                     //TPrinterSetupDialog,TColorDialog,TCheckListBox,TSplitter,
                     //TStaticText,TDatetimePicker,TOleContainer,TDdeClientConv,
                     //TDdeClientItem,TDdeServerConv,TDdeServerItem,
                     //TTabSet,TOutline,
                     //TTabbedNotebook, THeader
                     ]);
end;

procedure TFMainForm.LoadDefaultPalette();
// Load default palette when palette not exists
begin
   with IniFile do begin
      WriteString('Palette', 'Standard' ,'TMainMenu;TPopupMenu;TLabel;TEdit;TMemo;TButton;TCheckBox;TRadioButton;TListBox;TComboBox;TScrollBar;TGroupBox;TRadioGroup;TPanel;');
      WriteString('Palette', 'Addtional' ,'TBitBtn;TSpeedButton;TMaskEdit;TStringGrid;TDrawGrid;TImage;TShape;TBevel;TScrollBox;TCheckListBox;TSplitter;TStaticText;');
      WriteString('Palette', 'Win32' ,'TTabControl;TPageControl;TImageList;TRichEdit;TTrackBar;TProgressBar;TUpDown;THotKey;TAnimate;TDateTimePicker;TTreeView;TListView;THeaderControl;TStatusBar;TToolBar;TCoolBar;');
      WriteString('Palette', 'System' ,'TTimer;TPaintBox;TMediaPlayer;TOleContainer;TDdeClientConv;TDdeClientItem;TDdeServerConv;TDdeServerItem;');
     // WriteString('Palette', 'Internet' ,'TClientSocket;TServerSocket;TWebDispatcher;TPageProducer;TQueryTableProducer;TDataSetTableProducer;TFTP;THTML;THTTP;TNNTP;TPOP;TSMTP;TTCP;TUDP;');
     {$IFDEF DBVERSION}
      WriteString('Palette', 'Data Access' ,'TDataSource;TTable;TQuery;TStoredProc;TDatabase;TSession;TBatchMove;TUpdateSQL');
      WriteString('Palette', 'Data Controls' ,'TDBGrid;TDBNavigator;TDBText;TDBEdit;TDBMemo;TDBImage;TDBListBox;TDBComboBox;TDBCheckBox;TDBRadioGroup;TDBLookupListBox;TDBLookupComboBox;TDBRichEdit;TDBCtrlGrid;TDBChart;');
      WriteString('Palette', 'QReport' ,'TQuickRep;TQRSubDetail;TQRBand;TQRChildBand;TQRGroup;TQRLabel;TQRDBText;TQRExpr;TQRSysData;TQRMemo;TQRRichText;TQRDBRichText;TQRShape;TQRImage;TQRDBImage;TQRCompositeReport;TQRPreview;TQRChart;');
      {$ENDIF}
      WriteString('Palette', 'Dialogs' ,'TOpenDialog;TSaveDialog;TOpenPictureDialog;TSavePictureDialog;TFontDialog;TColorDialog;TPrintDialog;TPrinterSetupDialog;TFindDialog;TReplaceDialog;');
      WriteString('Palette', 'Win 3.1' ,'TDBLookupList;TDBLookupCombo;TTabSet;TOutline;TTabbedNotebook;TNotebook;THeader;TFileListBox;TDirectoryListBox;TDriveComboBox;TFilterComboBox;');
      WriteString('Palette', 'Samples' ,'TGauge;TColorGrid;TSpinButton;TSpinEdit;TCalendar');
   end;
end;

procedure TFMainForm.CreatePalettePage(PalettePage:string);
// Create component of palette page (page name is PalettePage)
var
  TabSheet:TTabSheet;
  Button:TSpeedButton;
  ComponentNames, ComponentName:string;
  Temp, Pos1, Index:Integer;
procedure CreateButton(ButtonName:string);
begin
   Button:=TSpeedButton.Create(TabSheet);
   with Button do begin
      Name := UniqueName(Button);
      Flat:= True;
      GroupIndex:= 1;
      Height:= 28;
      Hint:= ButtonName;
      Left:= Index * 29;
      Parent := TabSheet;
      ShowHint:= True;
      Top:= 5;
      Width:= 28;
      OnClick:= sbButtonClick;
   end;
   MakeBitmap(Button,ButtonName);
end;
begin
   TabSheet:=TTabSheet.Create(self);
   with TabSheet do
   begin
      PageControl := PageControl1;
      Caption:= PalettePage;
      Name := UniqueName(TabSheet);
   end;
   LoadDefaultButton(TabSheet);
   ComponentNames:= IniFile.ReadString('Palette',PalettePage, '');
   if ComponentNames = '' then Exit;
   Pos1:= 0;
   Temp:= 1;
   Index:= 1;
   while True do begin
      Pos1:= NPos(';', ComponentNames, Temp, Length(ComponentNames));
      if Pos1 = 0 then Break;
      ComponentName:= Copy(ComponentNames, Temp, Pos1 - Temp -1);
      CreateButton(ComponentName);
      Temp:= Pos1;
      Inc(Index);
   end;
end;

function TFMainForm.UniqueName(Comp:TComponent):string;
{ǥ�� �������� ��Ģ�� ����Ͽ� ���۳�Ʈ�� ���� ������ �̸��� �����Ѵ�. �� <Ÿ��><����>
 ������ ����ϴµ�, <Ÿ��>�� ���۳�Ʈ�� Ŭ���� �̸����� 'T'�� �� ���̰�, <����>��
 �̸��� �����ϰ� ����� ���� �����̴�.}
var
   I:Integer;
   Fmt:string;
begin
    if Comp.ClassName[1] in ['t','T'] then
        Fmt:=Copy(Comp.ClassName,2,255)+'%d'
    else Fmt:=Comp.ClassName+'%d';
    if Comp.Owner=nil then begin
       {�����ڰ� �����Ƿ� ��� �̸��� �����ϴ�. 1�� ����Ѵ�.}
       Result:=Format(Fmt,[1]);
       Exit;
    end
    else begin
       {������ �̸��� ���� ������ , ������ ���ڸ� ��� �����Ѵ�.}
       for I:=1 to High(Integer) do begin
           Result:=Format(Fmt,[I]);
           if TryName(Result,Comp.Owner) then Exit;
       end;
    end;
end;

procedure TFMainForm.sbButtonClick(Sender: TObject);
var
  st:Integer;
begin
   SelectedComponentName:=(Sender as TSpeedButton).Hint;
   st:=GetKeyState(VK_SHIFT);
   if SelectedComponentName = '' then ShiftKeyed:= False
   else if st < 0 then ShiftKeyed:= True
   else ShiftKeyed:= False;
end;

procedure TFMainForm.MakeBitmap(Component:TSpeedButton;ComponentName:string);
// Make bitmap of component
var
  ResName: array[0..64] of Char;
  ResBitmap: TBitmap;
begin
  ResBitmap := TBitmap.Create;
  try
    StrPLCopy(ResName, ComponentName, SizeOf(ResName));
    AnsiUpper(ResName);
    ResBitmap.Handle := LoadBitmap(hInstance, ResName);
    if ResBitmap.Handle = 0 then
      ResBitmap.Handle := LoadBitmap(hInstance, 'DEFAULT');

    Component.Glyph:= ResBitmap;
  finally
    ResBitmap.Free;
  end;
end;

procedure TFMainForm.LoadDefaultButton(TabSheet:TTabSheet);
// Load default button
var
  Button:TSpeedButton;
procedure CreateButton(ButtonName:string;Index:Integer);
begin
   Button:=TSpeedButton.Create(TabSheet);
   with Button do begin
      Name := UniqueName(Button);
      if Index = 0 then Down:= True;
      Flat:= True;
      GroupIndex:= 1;
      Height:= 28;
      Left:= Index * 29;
      Parent := TabSheet;
      Top:= 5;
      Width:= 28;
      OnClick:= sbButtonClick;
   end;
   MakeBitmap(Button,ButtonName);
end;
begin
   CreateButton('CURSOR',0);
end;

function TFmainForm.TryName(const Test:string;Comp:TComponent):Boolean;
{���۳�Ʈ �̸��� �������� �׽�Ʈ �غ���, ���� �����ϴٸ� True�� �����ϰ�, �ƴϸ�
 False�� �����Ѵ�.}
var
   I:Integer;
begin
    Result:=False;
    for I:=0 to Comp.ComponentCount-1 do
        if CompareText(Comp.Components[I].Name,Test) =0 then Exit;
    Result:=True;
end;

end.

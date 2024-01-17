unit ObjectInspec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, StdCtrls, ComCtrls;

type
  TObjectInspec = class(TForm)
    PageControl1: TPageControl;
    TabProperty: TTabSheet;
    StatusBar1: TStatusBar;
    PropertyBox: TListBox;
    cbValue: TComboBox;
    edProperty: TEdit;
    Browse: TPanel;
    TabEvent: TTabSheet;
    EventBox: TListBox;
    edEvent: TEdit;
    Panel1: TPanel;
    ComponentList: TComboBox;
    FontDialog1: TFontDialog;
    InspectorMenu: TPopupMenu;
    StayOnTopItem: TMenuItem;
    HideItem: TMenuItem;
    HelpItem: TMenuItem;
    N9: TMenuItem;
    InformationItem: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ObjectInspec: TObjectInspec;

implementation

{$R *.dfm}

end.

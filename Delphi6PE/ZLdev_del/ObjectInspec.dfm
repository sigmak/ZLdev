object ObjectInspec: TObjectInspec
  Left = 192
  Top = 125
  Width = 256
  Height = 450
  Caption = 'ObjectInspec'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 28
    Width = 240
    Height = 383
    ActivePage = TabProperty
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    object TabProperty: TTabSheet
      Caption = 'Properties'
      object StatusBar1: TStatusBar
        Left = 0
        Top = 336
        Width = 232
        Height = 19
        Panels = <>
        SimplePanel = True
      end
      object PropertyBox: TListBox
        Left = 0
        Top = 0
        Width = 232
        Height = 336
        Style = lbOwnerDrawFixed
        Align = alClient
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImeName = #54620#44397#50612'('#54620#44544')'
        ItemHeight = 20
        ParentFont = False
        TabOrder = 1
      end
      object cbValue: TComboBox
        Left = 4
        Top = 136
        Width = 141
        Height = 22
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ImeName = #54620#44397#50612'('#54620#44544')'
        ItemHeight = 14
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        Visible = False
      end
      object edProperty: TEdit
        Left = 6
        Top = 168
        Width = 121
        Height = 19
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ImeName = #54620#44397#50612'('#54620#44544')'
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        Visible = False
      end
      object Browse: TPanel
        Left = 129
        Top = 167
        Width = 17
        Height = 19
        Hint = 'Browse'
        Caption = '...'
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        Visible = False
      end
    end
    object TabEvent: TTabSheet
      Caption = 'Events'
      object EventBox: TListBox
        Left = 0
        Top = 0
        Width = 232
        Height = 355
        Style = lbOwnerDrawFixed
        Align = alClient
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ImeName = #54620#44397#50612'('#54620#44544')'
        ItemHeight = 20
        ParentFont = False
        TabOrder = 0
      end
      object edEvent: TEdit
        Left = 48
        Top = 40
        Width = 121
        Height = 19
        BorderStyle = bsNone
        Ctl3D = False
        ImeName = #54620#44397#50612'('#54620#44544')'
        ParentCtl3D = False
        TabOrder = 1
        Visible = False
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 240
    Height = 28
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object ComponentList: TComboBox
      Left = 0
      Top = 1
      Width = 185
      Height = 21
      Style = csDropDownList
      ImeName = #54620#44397#50612'('#54620#44544')'
      ItemHeight = 13
      Sorted = True
      TabOrder = 0
    end
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MinFontSize = 0
    MaxFontSize = 0
    Left = 38
    Top = 62
  end
  object InspectorMenu: TPopupMenu
    Left = 9
    Top = 62
    object StayOnTopItem: TMenuItem
      Caption = '&Stay On Top'
    end
    object HideItem: TMenuItem
      Caption = '&Hide'
    end
    object HelpItem: TMenuItem
      Caption = 'H&elp'
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object InformationItem: TMenuItem
      Caption = '&Information'
    end
  end
end

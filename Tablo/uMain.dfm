object Main: TMain
  Left = 1308
  Top = 27
  Caption = #1054#1095#1077#1088#1077#1076#1100
  ClientHeight = 261
  ClientWidth = 584
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 600
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTurn: TPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
  end
  object grdTurn: TDBGridEh
    Left = 0
    Top = 25
    Width = 584
    Height = 217
    Align = alClient
    AutoFitColWidths = True
    FilterEditMode = False
    DataGrouping.GroupLevels = <>
    DataSource = ds
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines, dghHideFilterDoApply, dghHighlightNull]
    ReadOnly = True
    RowDetailPanel.Color = clBtnFace
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = 'NUM'
        Footers = <>
        Width = 50
      end
      item
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = 'ROOM'
        Footers = <>
        Width = 50
      end
      item
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = 'LNAME'
        Footers = <>
        Visible = False
        Width = 100
      end
      item
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = 'FNAME'
        Footers = <>
        Visible = False
        Width = 100
      end
      item
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = 'SNAME'
        Footers = <>
        Visible = False
        Width = 100
      end
      item
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = 'ORG'
        Footers = <>
        Width = 300
      end
      item
        EditButtons = <>
        FieldName = 'GOAL'
        Footers = <>
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object sbTurn: TStatusBar
    Left = 0
    Top = 242
    Width = 584
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Text = '0:0'
        Width = 100
      end
      item
        Width = 50
      end>
  end
  object mt: TMemTable
    AfterScroll = mtAfterScroll
    Left = 304
    Top = 48
    object mtNUM: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'NUM'
      Size = 10
    end
    object mtROOM: TStringField
      DisplayLabel = #1050#1072#1073#1080#1085#1077#1090
      FieldName = 'ROOM'
      Size = 10
    end
    object mtLNAME: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'LNAME'
      Visible = False
      Size = 30
    end
    object mtFNMAE: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'FNAME'
      Visible = False
      Size = 30
    end
    object mtSNAME: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'SNAME'
      Visible = False
      Size = 30
    end
    object mtORG: TStringField
      DisplayLabel = #1057#1086#1089#1090#1072#1074
      FieldName = 'ORG'
      Size = 100
    end
    object mtGOAL: TStringField
      DisplayLabel = #1062#1077#1083#1100' '#1074#1080#1079#1080#1090#1072
      FieldName = 'GOAL'
      Size = 50
    end
  end
  object ds: TDataSource
    DataSet = mt
    Left = 344
    Top = 48
  end
  object Timer: TTimer
    Enabled = False
    Interval = 15000
    OnTimer = TimerTimer
    Left = 384
    Top = 48
  end
end

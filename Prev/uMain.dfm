object Main: TMain
  Left = 1325
  Top = 201
  Caption = #1055#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1072#1103' '#1079#1072#1087#1080#1089#1100
  ClientHeight = 311
  ClientWidth = 1008
  Color = clBtnFace
  Constraints.MinHeight = 350
  Constraints.MinWidth = 1024
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 1008
    Height = 50
    Align = alTop
    TabOrder = 0
    DesignSize = (
      1008
      50)
    object btnNew: TButton
      Left = 9
      Top = 9
      Width = 100
      Height = 30
      Caption = #1053#1086#1074#1099#1081
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnNewClick
    end
    object btnSave: TButton
      Left = 221
      Top = 10
      Width = 100
      Height = 30
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnSaveClick
    end
    object btnDel: TButton
      Left = 115
      Top = 10
      Width = 100
      Height = 30
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnDelClick
    end
    object stStatus: TPanel
      Left = 433
      Top = 9
      Width = 562
      Height = 30
      Alignment = taLeftJustify
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
    end
    object btnCardLst: TButton
      Left = 327
      Top = 10
      Width = 100
      Height = 30
      Caption = #1056#1077#1076#1072#1082#1090#1086#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnCardLstClick
    end
  end
  object pcPGS: TExPageControl
    Left = 0
    Top = 50
    Width = 1008
    Height = 261
    ActivePage = tsList
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TabStop = False
    OnChange = pcPGSChange
    Buttons = False
    ExplicitWidth = 924
    ExplicitHeight = 231
    object tsList: TTabSheet
      Caption = #1057#1087#1080#1089#1086#1082
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnlPrev: TPanel
        Left = 0
        Top = 0
        Width = 1000
        Height = 40
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 916
        object btnPrevRefresh: TButton
          Left = 5
          Top = 3
          Width = 100
          Height = 30
          Caption = #1054#1073#1085#1086#1074#1080#1090#1100
          TabOrder = 0
          OnClick = btnPrevRefreshClick
        end
        object edPrevDT: TDBDateTimeEditEh
          Left = 111
          Top = 4
          Width = 139
          Height = 27
          EditButtons = <>
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Kind = dtkDateEh
          ParentFont = False
          TabOrder = 1
          Value = 36526d
          Visible = True
          OnCloseUp = edPrevDTCloseUp
          OnKeyPress = edPrevDTKeyPress
        end
      end
      object grdPrev: TDBGridEh
        Left = 0
        Top = 40
        Width = 1000
        Height = 167
        Align = alClient
        AutoFitColWidths = True
        FilterEditMode = False
        DataGrouping.GroupLevels = <>
        DataSource = dsPrev
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -16
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines, dghHideFilterDoApply, dghHighlightNull]
        ReadOnly = True
        RowDetailPanel.Color = clBtnFace
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = grdPrevDblClick
        Columns = <
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'LNAME'
            Footers = <>
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
            Width = 130
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'FNAME'
            Footers = <>
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
            Width = 130
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'SNAME'
            Footers = <>
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
            Width = 130
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DisplayFormat = 'HH:NN'
            EditButtons = <>
            FieldName = 'DT'
            Footers = <>
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
            Width = 55
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'ROOM'
            Footers = <>
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
            Width = 100
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'GOAL'
            Footers = <>
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
            Width = 150
          end
          item
            EditButtons = <>
            FieldName = 'ORG'
            Footers = <>
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
            Width = 154
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'AUTO'
            Footers = <>
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
            Width = 200
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object sbPrev: TStatusBar
        Left = 0
        Top = 207
        Width = 1000
        Height = 20
        Panels = <
          item
            Alignment = taCenter
            Text = '0 : 0'
            Width = 120
          end
          item
            Width = 50
          end>
        ParentFont = True
        UseSystemFont = False
      end
    end
    object tsPerson: TTabSheet
      Caption = #1055#1086#1089#1077#1090#1080#1090#1077#1083#1100
      OnShow = tsPersonShow
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnlPerson: TPanel
        Left = 0
        Top = 0
        Width = 1000
        Height = 227
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 916
        ExplicitHeight = 197
        object lblLNAME: TLabel
          Left = 15
          Top = 17
          Width = 65
          Height = 19
          Alignment = taRightJustify
          Caption = #1060#1072#1084#1080#1083#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblFNAME: TLabel
          Left = 50
          Top = 50
          Width = 29
          Height = 19
          Alignment = taRightJustify
          Caption = #1048#1084#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblSNAME: TLabel
          Left = 11
          Top = 83
          Width = 69
          Height = 19
          Alignment = taRightJustify
          Caption = #1054#1090#1095#1077#1089#1090#1074#1086
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblMAIL: TLabel
          Left = 536
          Top = 149
          Width = 106
          Height = 19
          Alignment = taRightJustify
          Caption = #1055#1086#1095#1090#1072' (e-mail)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblROOM: TLabel
          Left = 19
          Top = 116
          Width = 61
          Height = 19
          Alignment = taRightJustify
          Caption = #1050#1072#1073#1080#1085#1077#1090
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblGOAL: TLabel
          Left = 552
          Top = 83
          Width = 90
          Height = 19
          Alignment = taRightJustify
          Caption = #1062#1077#1083#1100' '#1074#1080#1079#1080#1090#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblEvaOrg: TLabel
          Left = 529
          Top = 17
          Width = 113
          Height = 19
          Alignment = taRightJustify
          Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblTime: TLabel
          Left = 289
          Top = 149
          Width = 67
          Height = 19
          Alignment = taRightJustify
          Caption = #1053#1072' '#1074#1088#1077#1084#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblDate: TLabel
          Left = 45
          Top = 149
          Width = 35
          Height = 19
          Alignment = taRightJustify
          Caption = #1044#1072#1090#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblTel: TLabel
          Left = 577
          Top = 116
          Width = 65
          Height = 19
          Alignment = taRightJustify
          Caption = #1058#1077#1083#1077#1092#1086#1085
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblAuto: TLabel
          Left = 437
          Top = 182
          Width = 205
          Height = 19
          Alignment = taRightJustify
          Caption = #1040#1074#1090#1086#1084#1086#1073#1080#1083#1100' ('#1084#1072#1088#1082#1072', '#1085#1086#1084#1077#1088')'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object cbGOAL: TDBComboBoxEh
          Left = 648
          Top = 80
          Width = 338
          Height = 27
          DataField = 'GOAL'
          DataSource = dsPrev
          EditButtons = <>
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          Visible = True
          OnKeyPress = edUpKeyPress
        end
        object cbROOM: TDBComboBoxEh
          Left = 86
          Top = 113
          Width = 338
          Height = 27
          DataField = 'ROOM'
          DataSource = dsPrev
          EditButtons = <>
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          Visible = True
          OnExit = cbROOMExit
        end
        object edTime: TDBDateTimeEditEh
          Left = 362
          Top = 146
          Width = 62
          Height = 27
          Alignment = taCenter
          DataField = 'DT'
          DataSource = dsPrev
          EditButton.Style = ebsAltUpDownEh
          EditButton.Visible = False
          EditButtons = <>
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          Visible = True
          EditFormat = 'HH:NN'
        end
        object edDate: TDBDateTimeEditEh
          Left = 86
          Top = 146
          Width = 138
          Height = 27
          Alignment = taCenter
          DataField = 'DT'
          DataSource = dsPrev
          EditButtons = <>
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Kind = dtkDateEh
          ParentFont = False
          ParentShowHint = False
          TabOrder = 4
          Visible = True
        end
        object mmOrg: TDBMemo
          Left = 648
          Top = 14
          Width = 338
          Height = 60
          DataField = 'ORG'
          DataSource = dsPrev
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
        end
        object edFNAME: TDBEditEh
          Left = 85
          Top = 47
          Width = 338
          Height = 27
          DataField = 'FNAME'
          DataSource = dsPrev
          EditButtons = <>
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          Visible = True
        end
        object edSNAME: TDBEditEh
          Left = 86
          Top = 80
          Width = 338
          Height = 27
          DataField = 'SNAME'
          DataSource = dsPrev
          EditButtons = <>
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          Visible = True
        end
        object edLNAME: TDBEditEh
          Left = 86
          Top = 14
          Width = 338
          Height = 27
          DataField = 'LNAME'
          DataSource = dsPrev
          EditButtons = <>
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          Visible = True
        end
        object edMAIL: TDBEditEh
          Left = 648
          Top = 146
          Width = 338
          Height = 27
          DataField = 'MAIL'
          DataSource = dsPrev
          EditButtons = <>
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          Visible = True
          OnKeyPress = edLwKeyPress
        end
        object edTel: TDBEditEh
          Left = 648
          Top = 113
          Width = 338
          Height = 27
          DataField = 'TEL'
          DataSource = dsPrev
          EditButtons = <>
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          Visible = True
        end
        object edAuto: TDBEditEh
          Left = 648
          Top = 179
          Width = 338
          Height = 27
          DataField = 'AUTO'
          DataSource = dsPrev
          EditButtons = <>
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
          Visible = True
        end
      end
    end
  end
  object mtPrev: TMemTable
    AfterScroll = mtPrevAfterScroll
    LogChanges = True
    OnNewRecord = mtPrevNewRecord
    Left = 360
    Top = 16
    object mtPrevDTCREAT: TDateTimeField
      DisplayLabel = #1057#1086#1079#1076#1072#1085#1086
      FieldName = 'DTCREAT'
    end
    object mtPrevLNAME: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'LNAME'
      Size = 30
    end
    object mtPrevFNAME: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'FNAME'
      Size = 30
    end
    object mtPrevSNAME: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'SNAME'
      Size = 30
    end
    object mtPrevROOM: TStringField
      DisplayLabel = #1050#1072#1073#1080#1085#1077#1090
      FieldName = 'ROOM'
      Size = 10
    end
    object mtPrevDT: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103
      FieldName = 'DT'
    end
    object mtPrevORG: TStringField
      DisplayLabel = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      FieldName = 'ORG'
      Size = 100
    end
    object mtPrevGOAL: TStringField
      DisplayLabel = #1062#1077#1083#1100' '#1074#1080#1079#1080#1090#1072
      FieldName = 'GOAL'
      Size = 50
    end
    object mtPrevTEL: TStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085
      FieldName = 'TEL'
    end
    object mtPrevMAIL: TStringField
      DisplayLabel = #1055#1086#1095#1090#1072' (e-mail)'
      FieldName = 'MAIL'
      Size = 30
    end
    object mtPrevAUTO: TStringField
      DisplayLabel = #1040#1074#1090#1086#1084#1086#1073#1080#1083#1100
      FieldName = 'AUTO'
      Size = 30
    end
    object mtPrevSRC: TStringField
      FieldName = 'SRC'
      Size = 200
    end
  end
  object dsPrev: TDataSource
    DataSet = mtPrev
    OnStateChange = dsPrevStateChange
    Left = 400
    Top = 16
  end
  object tmNoSleep: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = tmNoSleepTimer
    Left = 452
    Top = 16
  end
end

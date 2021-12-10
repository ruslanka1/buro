object Main: TMain
  Left = 2166
  Top = 446
  Caption = #1069#1083#1077#1082#1090#1088#1086#1085#1085#1072#1103' '#1086#1095#1077#1088#1077#1076#1100
  ClientHeight = 476
  ClientWidth = 956
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcPGS: TExPageControl
    Left = 0
    Top = 50
    Width = 956
    Height = 426
    ActivePage = tsList
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TabStop = False
    OnChange = pcPGSChange
    Buttons = False
    object tsList: TTabSheet
      Caption = #1057#1087#1080#1089#1086#1082
      object pnlTurn: TPanel
        Left = 0
        Top = 0
        Width = 948
        Height = 40
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object btnTurnRefresh: TButton
          Left = 5
          Top = 3
          Width = 100
          Height = 30
          Caption = #1054#1073#1085#1086#1074#1080#1090#1100
          TabOrder = 0
          OnClick = btnTurnRefreshClick
        end
        object edTurnDT: TDBDateTimeEditEh
          Left = 111
          Top = 4
          Width = 140
          Height = 30
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
          OnCloseUp = edTurnDTCloseUp
          OnKeyPress = edTurnDTKeyPress
        end
      end
      object grdTurn: TDBGridEh
        Left = 0
        Top = 40
        Width = 948
        Height = 332
        Align = alClient
        AutoFitColWidths = True
        FilterEditMode = False
        DataGrouping.GroupLevels = <>
        DataSource = dsTurn
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
        OnDblClick = grdTurnDblClick
        Columns = <
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'TICKET'
            Footers = <>
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
            Width = 50
          end
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
            FieldName = 'TIME'
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
            FieldName = 'INROOM'
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
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object sbTurn: TStatusBar
        Left = 0
        Top = 372
        Width = 948
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
      object pnlPerson: TPanel
        Left = 0
        Top = 0
        Width = 948
        Height = 392
        Align = alClient
        TabOrder = 0
        object gbPerson: TGroupBox
          Left = 5
          Top = 0
          Width = 932
          Height = 201
          Caption = ' '#1055#1086#1089#1077#1090#1080#1090#1077#1083#1100' '
          TabOrder = 0
          object lblFNAME: TLabel
            Left = 70
            Top = 60
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
          object lblLNAME: TLabel
            Left = 35
            Top = 27
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
          object lblDate: TLabel
            Left = 65
            Top = 159
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
          object lblROOM: TLabel
            Left = 39
            Top = 126
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
          object lblSNAME: TLabel
            Left = 31
            Top = 93
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
          object lblTime: TLabel
            Left = 309
            Top = 159
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
          object lblEvaOrg: TLabel
            Left = 461
            Top = 27
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
          object lblGOAL: TLabel
            Left = 484
            Top = 93
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
          object lblMAIL: TLabel
            Left = 468
            Top = 159
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
          object lblTel: TLabel
            Left = 509
            Top = 126
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
          object lblOld: TLabel
            Left = 319
            Top = 126
            Width = 57
            Height = 19
            Alignment = taRightJustify
            Caption = #1042#1086#1079#1088#1072#1089#1090
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edFNAME: TDBEditEh
            Left = 105
            Top = 57
            Width = 338
            Height = 30
            DataField = 'FNAME'
            DataSource = dsTurn
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
          object edLNAME: TDBEditEh
            Left = 106
            Top = 24
            Width = 338
            Height = 30
            DataField = 'LNAME'
            DataSource = dsTurn
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
          object cbROOM: TDBEditEh
            Left = 106
            Top = 123
            Width = 175
            Height = 30
            DataField = 'ROOM'
            DataSource = dsTurn
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
          object edDate: TDBDateTimeEditEh
            Left = 106
            Top = 156
            Width = 175
            Height = 30
            Alignment = taCenter
            DataField = 'DT'
            DataSource = dsTurn
            EditButton.Visible = False
            EditButtons = <>
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            Kind = dtkDateEh
            ParentFont = False
            ParentShowHint = False
            TabOrder = 3
            Visible = True
          end
          object edSNAME: TDBEditEh
            Left = 106
            Top = 90
            Width = 338
            Height = 30
            DataField = 'SNAME'
            DataSource = dsTurn
            EditButtons = <>
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            Visible = True
          end
          object cbGOAL: TDBEditEh
            Left = 580
            Top = 90
            Width = 338
            Height = 30
            DataField = 'GOAL'
            DataSource = dsTurn
            EditButtons = <>
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
            Visible = True
          end
          object edMAIL: TDBEditEh
            Left = 580
            Top = 156
            Width = 338
            Height = 30
            DataField = 'MAIL'
            DataSource = dsTurn
            EditButtons = <>
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 6
            Visible = True
          end
          object edTel: TDBEditEh
            Left = 580
            Top = 123
            Width = 338
            Height = 30
            DataField = 'TEL'
            DataSource = dsTurn
            EditButtons = <>
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 7
            Visible = True
          end
          object mmOrg: TDBMemo
            Left = 580
            Top = 24
            Width = 338
            Height = 60
            DataField = 'ORG'
            DataSource = dsTurn
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -19
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 8
          end
          object edOld: TDBEditEh
            Left = 382
            Top = 123
            Width = 63
            Height = 30
            DataField = 'OLD'
            DataSource = dsTurn
            EditButtons = <>
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 9
            Visible = True
          end
          object edIME: TDBEditEh
            Left = 382
            Top = 156
            Width = 63
            Height = 30
            DataField = 'TIME'
            DataSource = dsTurn
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
        object gbDoc: TGroupBox
          Left = 5
          Top = 207
          Width = 932
          Height = 170
          Caption = ' '#1044#1086#1082#1091#1084#1077#1085#1090' '
          TabOrder = 1
          object lblDoc: TLabel
            Left = 28
            Top = 32
            Width = 71
            Height = 19
            Alignment = taRightJustify
            Caption = #1044#1086#1082#1091#1084#1077#1085#1090
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblDOCSER: TLabel
            Left = 55
            Top = 65
            Width = 44
            Height = 19
            Alignment = taRightJustify
            Caption = #1057#1077#1088#1080#1103
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblDOCNUM: TLabel
            Left = 254
            Top = 65
            Width = 47
            Height = 19
            Alignment = taRightJustify
            Caption = #1053#1086#1084#1077#1088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblSEX: TLabel
            Left = 70
            Top = 98
            Width = 29
            Height = 19
            Alignment = taRightJustify
            Caption = #1055#1086#1083
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblBDATE: TLabel
            Left = 184
            Top = 98
            Width = 113
            Height = 19
            Alignment = taRightJustify
            Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblBPLACE: TLabel
            Left = 7
            Top = 131
            Width = 93
            Height = 19
            Alignment = taRightJustify
            Caption = #1052#1077#1089#1090#1086' '#1088#1086#1078#1076'.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblWhDOC: TLabel
            Left = 486
            Top = 32
            Width = 87
            Height = 19
            Alignment = taRightJustify
            Caption = #1050#1077#1084' '#1074#1099#1076#1072#1085#1086
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblDTDOC: TLabel
            Left = 479
            Top = 131
            Width = 94
            Height = 19
            Alignment = taRightJustify
            Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblCODEDOC: TLabel
            Left = 729
            Top = 131
            Width = 74
            Height = 19
            Alignment = taRightJustify
            Caption = #1050#1086#1076' '#1087#1086#1076#1088'.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object cbDoc: TDBEditEh
            Left = 107
            Top = 29
            Width = 334
            Height = 30
            DataField = 'DOC'
            DataSource = dsTurn
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
          object edDOCSER: TDBEditEh
            Left = 107
            Top = 62
            Width = 126
            Height = 30
            DataField = 'DOCSER'
            DataSource = dsTurn
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
          object edDOCNUM: TDBEditEh
            Left = 307
            Top = 62
            Width = 133
            Height = 30
            DataField = 'DOCNUM'
            DataSource = dsTurn
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
          object edSEX: TDBEditEh
            Left = 107
            Top = 95
            Width = 52
            Height = 30
            DataField = 'SEX'
            DataSource = dsTurn
            EditButtons = <>
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            Visible = True
          end
          object edBDATE: TDBDateTimeEditEh
            Left = 305
            Top = 95
            Width = 138
            Height = 30
            Alignment = taCenter
            DataField = 'BDATE'
            DataSource = dsTurn
            EditButton.Visible = False
            EditButtons = <>
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            Kind = dtkDateEh
            ParentFont = False
            TabOrder = 4
            Visible = True
          end
          object edBPLACE: TDBEditEh
            Left = 107
            Top = 128
            Width = 335
            Height = 30
            DataField = 'BPLACE'
            DataSource = dsTurn
            EditButtons = <>
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
            Visible = True
          end
          object mmWhDOC: TDBMemo
            Left = 580
            Top = 29
            Width = 336
            Height = 93
            DataField = 'WHDOC'
            DataSource = dsTurn
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 6
          end
          object edDTDOC: TDBDateTimeEditEh
            Left = 580
            Top = 128
            Width = 138
            Height = 30
            Alignment = taCenter
            DataField = 'DTDOC'
            DataSource = dsTurn
            EditButton.Visible = False
            EditButtons = <>
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            Kind = dtkDateEh
            ParentFont = False
            TabOrder = 7
            Visible = True
          end
          object edCODEDOC: TDBEditEh
            Left = 809
            Top = 128
            Width = 107
            Height = 30
            DataField = 'CODDOC'
            DataSource = dsTurn
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
        end
      end
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 956
    Height = 50
    Align = alTop
    TabOrder = 1
    DesignSize = (
      956
      50)
    object btnSave: TButton
      Left = 9
      Top = 10
      Width = 100
      Height = 30
      Caption = #1055#1088#1080#1085#1103#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnSaveClick
    end
    object stStatus: TPanel
      Left = 261
      Top = 9
      Width = 682
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
      TabOrder = 1
    end
    object btnCardLst: TButton
      Left = 115
      Top = 10
      Width = 140
      Height = 30
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnCardLstClick
    end
  end
  object mtTurn: TMemTable
    AfterScroll = mtTurnAfterScroll
    LogChanges = True
    OnNewRecord = mtTurnNewRecord
    Left = 368
    Top = 64
    object mtTurnDTCREAT: TDateTimeField
      DisplayLabel = #1057#1086#1079#1076#1072#1085#1086
      FieldName = 'DTCREAT'
    end
    object mtTurnLNAME: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'LNAME'
      Size = 30
    end
    object mtTurnFNAME: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'FNAME'
      Size = 30
    end
    object mtTurnSNAME: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'SNAME'
      Size = 30
    end
    object mtTurnROOM: TStringField
      DisplayLabel = #1050#1072#1073#1080#1085#1077#1090
      FieldName = 'ROOM'
      Size = 10
    end
    object mtTurnINROOM: TStringField
      DisplayLabel = #1055#1088#1080#1085#1103#1090
      FieldName = 'INROOM'
      Size = 30
    end
    object mtTurnDT: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103
      FieldName = 'DT'
    end
    object mtTurnTIME: TStringField
      DisplayLabel = #1042#1088#1077#1084#1103
      FieldName = 'TIME'
      Size = 5
    end
    object mtTurnORG: TStringField
      DisplayLabel = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      FieldName = 'ORG'
      Size = 100
    end
    object mtTurnGOAL: TStringField
      DisplayLabel = #1062#1077#1083#1100' '#1074#1080#1079#1080#1090#1072
      FieldName = 'GOAL'
      Size = 50
    end
    object mtTurnGOALID: TStringField
      FieldName = 'GOALID'
      Size = 3
    end
    object mtTurnTEL: TStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085
      FieldName = 'TEL'
    end
    object mtTurnMAIL: TStringField
      DisplayLabel = #1055#1086#1095#1090#1072' (e-mail)'
      FieldName = 'MAIL'
      Size = 30
    end
    object mtTurnOLD: TStringField
      FieldName = 'OLD'
      Size = 3
    end
    object mtTurnDOC: TStringField
      FieldName = 'DOC'
      Size = 30
    end
    object mtTurnDOCSER: TStringField
      FieldName = 'DOCSER'
      Size = 10
    end
    object mtTurnDOCNUM: TStringField
      FieldName = 'DOCNUM'
    end
    object mtTurnSEX: TStringField
      FieldName = 'SEX'
      Size = 10
    end
    object mtTurnBDATE: TDateTimeField
      FieldName = 'BDATE'
    end
    object mtTurnBPLACE: TStringField
      FieldName = 'BPLACE'
      Size = 100
    end
    object mtTurnWHDOC: TStringField
      FieldName = 'WHDOC'
      Size = 200
    end
    object mtTurnDTDOC: TDateTimeField
      FieldName = 'DTDOC'
    end
    object mtTurnCODDOC: TStringField
      FieldName = 'CODDOC'
      Size = 10
    end
    object mtTurnTICKET: TStringField
      DisplayLabel = #1058#1072#1083#1086#1085
      FieldName = 'TICKET'
      Size = 3
    end
    object mtTurnSRC: TStringField
      FieldName = 'SRC'
      Size = 200
    end
  end
  object dsTurn: TDataSource
    DataSet = mtTurn
    Left = 408
    Top = 64
  end
  object tmNoSleep: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = tmNoSleepTimer
    Left = 460
    Top = 64
  end
end

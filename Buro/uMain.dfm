object Main: TMain
  Left = 1303
  Top = 232
  Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103' '#1087#1086#1089#1077#1090#1080#1090#1077#1083#1103
  ClientHeight = 679
  ClientWidth = 1214
  Color = clBtnFace
  Constraints.MinHeight = 718
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
    Width = 1214
    Height = 50
    Align = alTop
    TabOrder = 0
    DesignSize = (
      1214
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
    object btnPrint: TButton
      Left = 221
      Top = 10
      Width = 100
      Height = 30
      Caption = #1058#1072#1083#1086#1085
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnPrintClick
    end
    object btnScan: TButton
      Left = 115
      Top = 10
      Width = 100
      Height = 30
      Caption = #1057#1082#1072#1085#1080#1088#1086#1074#1072#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnScanClick
    end
    object stStatus: TPanel
      Left = 327
      Top = 9
      Width = 871
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
  end
  object pcPGS: TPageControl
    Left = 0
    Top = 50
    Width = 1214
    Height = 629
    ActivePage = tsTurn
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitWidth = 1008
    object tsPerson: TTabSheet
      Caption = #1055#1086#1089#1077#1090#1080#1090#1077#1083#1100
      OnShow = tsPersonShow
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object imgPerson: TImage
        Left = 0
        Top = 0
        Width = 656
        Height = 595
        Align = alClient
        Proportional = True
        Stretch = True
        ExplicitLeft = 1
        ExplicitWidth = 450
        ExplicitHeight = 814
      end
      object pnlPerson: TPanel
        Left = 656
        Top = 0
        Width = 550
        Height = 595
        Align = alRight
        TabOrder = 0
        ExplicitLeft = 450
        object lblLNAME: TLabel
          Left = 55
          Top = 275
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
          Left = 90
          Top = 311
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
          Left = 51
          Top = 347
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
        object lblSEX: TLabel
          Left = 91
          Top = 87
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
          Left = 278
          Top = 87
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
          Left = 27
          Top = 120
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
          Left = 33
          Top = 159
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
          Left = 26
          Top = 239
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
          Left = 277
          Top = 239
          Width = 144
          Height = 19
          Alignment = taRightJustify
          Caption = #1050#1086#1076' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblMAIL: TLabel
          Left = 14
          Top = 511
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
        object lblOLD: TLabel
          Left = 431
          Top = 511
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
        object lblROOM: TLabel
          Left = 59
          Top = 383
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
        object lblDOCSER: TLabel
          Left = 76
          Top = 51
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
          Left = 275
          Top = 51
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
        object lblGOAL: TLabel
          Left = 30
          Top = 472
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
          Left = 7
          Top = 416
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
          Left = 52
          Top = 547
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
        object lblDoc: TLabel
          Left = 49
          Top = 18
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
        object lblFLOOR: TLabel
          Left = 285
          Top = 383
          Width = 106
          Height = 19
          Alignment = taRightJustify
          Caption = #1056#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edLNAME: TEdit
          Left = 126
          Top = 272
          Width = 410
          Height = 30
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          Text = #1048#1074#1072#1085#1086#1074
          OnKeyPress = edUpKeyPress
        end
        object edFNAME: TEdit
          Left = 126
          Top = 308
          Width = 410
          Height = 30
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
          Text = #1048#1074#1072#1085
          OnKeyPress = edUpKeyPress
        end
        object edSNAME: TEdit
          Left = 126
          Top = 344
          Width = 410
          Height = 30
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 11
          Text = #1048#1074#1072#1085#1086#1074#1080#1095
          OnKeyPress = edUpKeyPress
        end
        object edSEX: TEdit
          Left = 126
          Top = 84
          Width = 130
          Height = 30
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          Text = #1084#1091#1078
          OnKeyPress = edUpKeyPress
        end
        object edBPLACE: TEdit
          Left = 126
          Top = 120
          Width = 410
          Height = 30
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          Text = #1050#1072#1079#1072#1093#1089#1090#1072#1085' '#1075'. '#1059#1089#1090#1100'-'#1050#1072#1084#1077#1085#1086#1075#1086#1088#1089#1082
          OnKeyPress = edUpKeyPress
        end
        object edCODEDOC: TEdit
          Left = 427
          Top = 236
          Width = 109
          Height = 30
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          Text = '123-456'
          OnKeyPress = edUpKeyPress
        end
        object edMAIL: TEdit
          Left = 126
          Top = 508
          Width = 299
          Height = 30
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 16
          Text = 'ex@mail.ru'
          OnKeyPress = edLwKeyPress
        end
        object edOLD: TEdit
          Left = 494
          Top = 508
          Width = 42
          Height = 30
          TabStop = False
          Alignment = taCenter
          Color = clBtnFace
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 17
          Text = '105'
        end
        object edBDATE: TDBDateTimeEditEh
          Left = 397
          Top = 84
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
          TabOrder = 4
          Value = 36526d
          Visible = True
          OnExit = edBDATEExit
        end
        object edDTDOC: TDBDateTimeEditEh
          Left = 126
          Top = 236
          Width = 140
          Height = 27
          EditButtons = <>
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Kind = dtkDateEh
          ParentFont = False
          TabOrder = 7
          Value = 36526d
          Visible = True
        end
        object edDOCSER: TEdit
          Left = 126
          Top = 48
          Width = 130
          Height = 30
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          Text = '1234'
          OnKeyPress = edUpKeyPress
        end
        object edDOCNUM: TEdit
          Left = 328
          Top = 48
          Width = 208
          Height = 30
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          Text = '123456'
          OnKeyPress = edUpKeyPress
        end
        object btnFind: TButton
          Left = 200
          Top = 544
          Width = 336
          Height = 30
          Caption = #1053#1072#1081#1090#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 19
          OnClick = btnFindClick
        end
        object mmOrg: TMemo
          Left = 126
          Top = 413
          Width = 410
          Height = 50
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Lines.Strings = (
            #1057#1084#1077#1096#1072#1085#1085#1099#1081' '#1089#1086#1089#1090#1072#1074' '#8470'4 ('#1076#1077#1090#1089#1082#1086#1077' '
            #1086#1090#1076#1077#1083#1077#1085#1080#1077')'
            '')
          ParentFont = False
          TabOrder = 14
        end
        object edTime: TEdit
          Left = 125
          Top = 544
          Width = 69
          Height = 30
          TabStop = False
          Alignment = taCenter
          Color = clBtnFace
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 18
          Text = '00:00'
        end
        object cbDoc: TDBComboBoxEh
          Left = 126
          Top = 15
          Width = 410
          Height = 27
          EditButtons = <>
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          Text = 'cbDoc'
          Visible = True
          OnKeyPress = edUpKeyPress
        end
        object mmWhDOC: TMemo
          Left = 126
          Top = 156
          Width = 410
          Height = 74
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Lines.Strings = (
            #1057#1072#1074#1074#1080#1085#1089#1082#1080#1084' '#1086#1090#1076#1077#1083#1077#1085#1080#1077#1084' '#1084#1080#1083#1080#1094#1080#1080' '
            #1041#1072#1083#1072#1096#1080#1093#1080#1085#1089#1082#1086#1075#1086' '#1059#1042#1044' '#1052#1086#1089#1082#1086#1074#1089#1082#1086#1081' '
            #1086#1073#1083#1086#1089#1090#1080'.')
          ParentFont = False
          TabOrder = 6
          OnKeyPress = edUpKeyPress
        end
        object cbGOAL: TDBComboBoxEh
          Left = 126
          Top = 469
          Width = 410
          Height = 27
          EditButtons = <>
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 15
          Text = #1051#1045#1063#1045#1053#1048#1045
          Visible = True
          OnKeyPress = edUpKeyPress
        end
        object cbROOM: TDBComboBoxEh
          Left = 126
          Top = 380
          Width = 139
          Height = 27
          EditButtons = <>
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          MaxLength = 10
          ParentFont = False
          TabOrder = 12
          Text = #1053#1072#1079#1074#1072#1085#1080#1077
          Visible = True
          OnExit = cbROOMExit
        end
        object cbFLOOR: TDBComboBoxEh
          Left = 397
          Top = 380
          Width = 139
          Height = 27
          EditButtons = <>
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          MaxLength = 10
          ParentFont = False
          TabOrder = 13
          Text = #1069#1090#1072#1078
          Visible = True
        end
      end
    end
    object tsTurn: TTabSheet
      Caption = #1054#1095#1077#1088#1077#1076#1100
      ImageIndex = 1
      OnShow = tsTurnShow
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnlTurn: TPanel
        Left = 0
        Top = 0
        Width = 1206
        Height = 40
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 1000
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
          OnCloseUp = edTurnDTCloseUp
          OnKeyPress = edTurnDTKeyPress
        end
        object btnMtCsv: TButton
          Left = 256
          Top = 4
          Width = 130
          Height = 30
          Caption = #1042#1077#1089#1100' '#1089#1087#1080#1089#1086#1082
          TabOrder = 2
          OnClick = btnMtCsvClick
        end
        object btnRepCsv: TButton
          Tag = 1
          Left = 392
          Top = 4
          Width = 130
          Height = 30
          Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
          TabOrder = 3
          OnClick = btnRepCsvClick
        end
        object btnRep1: TButton
          Tag = 2
          Left = 528
          Top = 4
          Width = 130
          Height = 30
          Caption = 'Rep1'
          TabOrder = 4
          OnClick = btnRepClick
        end
        object btnRep2: TButton
          Tag = 3
          Left = 664
          Top = 4
          Width = 130
          Height = 30
          Caption = 'Rep2'
          TabOrder = 5
          OnClick = btnRepClick
        end
        object btnRep3: TButton
          Tag = 4
          Left = 800
          Top = 4
          Width = 130
          Height = 30
          Caption = 'Rep3'
          TabOrder = 6
          OnClick = btnRepClick
        end
        object btnRep4: TButton
          Tag = 5
          Left = 936
          Top = 4
          Width = 130
          Height = 30
          Caption = 'Rep4'
          TabOrder = 7
          OnClick = btnRepClick
        end
        object btnRep5: TButton
          Tag = 6
          Left = 1072
          Top = 4
          Width = 130
          Height = 30
          Caption = 'Rep5'
          TabOrder = 8
          OnClick = btnRepClick
        end
      end
      object grdTurn: TDBGridEh
        Left = 0
        Top = 40
        Width = 1206
        Height = 535
        Align = alClient
        FilterEditMode = False
        DataGrouping.GroupLevels = <>
        DataSource = ds
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -16
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines, dghHideFilterDoApply, dghHighlightNull]
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
            FieldName = 'NUM'
            Footers = <>
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
            Width = 50
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'INTIME'
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
            Alignment = taCenter
            AutoFitColWidth = False
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
            EditButtons = <>
            FieldName = 'BDATE'
            Footers = <>
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'GOAL'
            Footers = <>
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
            Width = 300
          end
          item
            EditButtons = <>
            FieldName = 'ORG'
            Footers = <>
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
            Width = 1000
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object sbTurn: TStatusBar
        Left = 0
        Top = 575
        Width = 1206
        Height = 20
        Panels = <
          item
            Alignment = taCenter
            Text = '0 : 0'
            Width = 100
          end
          item
            Width = 50
          end>
        ParentFont = True
        UseSystemFont = False
      end
    end
    object tsList: TTabSheet
      Caption = #1045#1040#1042#1048#1048#1040#1057
      ImageIndex = 2
      OnShow = tsListShow
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnlEva: TPanel
        Left = 0
        Top = 0
        Width = 1206
        Height = 40
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 1000
        object btnEvaRefresh: TButton
          Left = 5
          Top = 3
          Width = 100
          Height = 30
          Caption = #1054#1073#1085#1086#1074#1080#1090#1100
          TabOrder = 0
          OnClick = btnEvaRefreshClick
        end
        object edEvaDT: TDBDateTimeEditEh
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
          OnCloseUp = edEvaDTCloseUp
          OnExit = edBDATEExit
          OnKeyPress = edEvaDTKeyPress
        end
      end
      object grdEva: TDBGridEh
        Left = 0
        Top = 40
        Width = 1206
        Height = 535
        Align = alClient
        AutoFitColWidths = True
        FilterEditMode = False
        DataGrouping.GroupLevels = <>
        DataSource = dsReg
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -16
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines, dghHideFilterDoApply, dghHighlightNull]
        ReadOnly = True
        RowDetailPanel.Color = clBtnFace
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = grdEvaDblClick
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
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'DT_MSE'
            Footers = <>
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
            Width = 200
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
            EditButtons = <>
            FieldName = 'ORG'
            Footers = <>
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
            Width = 200
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object sbEva: TStatusBar
        Left = 0
        Top = 575
        Width = 1206
        Height = 20
        Panels = <
          item
            Alignment = taCenter
            Text = '0 : 0'
            Width = 100
          end
          item
            Width = 50
          end>
        ParentFont = True
        UseSystemFont = False
        ExplicitWidth = 1000
      end
    end
    object tsPrev: TTabSheet
      Caption = #1055#1088#1077#1076#1074'. '#1079#1072#1087#1080#1089#1100
      ImageIndex = 3
      OnShow = tsPrevShow
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object sbPrev: TStatusBar
        Left = 0
        Top = 575
        Width = 1206
        Height = 20
        Panels = <
          item
            Alignment = taCenter
            Text = '0 : 0'
            Width = 100
          end
          item
            Width = 50
          end>
        ParentFont = True
        UseSystemFont = False
        ExplicitWidth = 1000
      end
      object grdPrev: TDBGridEh
        Left = 0
        Top = 40
        Width = 1206
        Height = 535
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
            Width = 101
          end
          item
            EditButtons = <>
            FieldName = 'ORG'
            Footers = <>
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
            Width = 122
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
      object pnlPrev: TPanel
        Left = 0
        Top = 0
        Width = 1206
        Height = 40
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        ExplicitWidth = 1000
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
    end
  end
  object mt: TMemTable
    AfterScroll = mtAfterScroll
    Left = 32
    Top = 216
    object mtNUM: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'NUM'
      Size = 10
    end
    object mtINTIME: TStringField
      DisplayLabel = #1042#1088#1077#1084#1103
      FieldName = 'INTIME'
      Size = 5
    end
    object mtROOM: TStringField
      DisplayLabel = #1050#1072#1073#1080#1085#1077#1090
      FieldName = 'ROOM'
      Size = 10
    end
    object mtTIME: TStringField
      DisplayLabel = #1047#1072#1087#1080#1089#1100
      FieldName = 'TIME'
      Size = 5
    end
    object mtLNAME: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'LNAME'
      Size = 30
    end
    object mtFNMAE: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'FNAME'
      Size = 30
    end
    object mtSNAME: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'SNAME'
      Size = 30
    end
    object mtBDATE: TStringField
      DisplayLabel = #1056#1086#1076#1080#1083#1089#1103
      FieldName = 'BDATE'
      Size = 12
    end
    object mtGOAL: TStringField
      DisplayLabel = #1062#1077#1083#1100' '#1074#1080#1079#1080#1090#1072
      FieldName = 'GOAL'
      Size = 50
    end
    object mtORG: TStringField
      DisplayLabel = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      FieldName = 'ORG'
      Size = 250
    end
    object mtSRC: TStringField
      FieldName = 'SRC'
      Visible = False
      FixedChar = True
      Size = 200
    end
  end
  object ds: TDataSource
    DataSet = mt
    Left = 80
    Top = 216
  end
  object dsReg: TDataSource
    DataSet = qReg
    Left = 80
    Top = 168
  end
  object MSBase: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=123mse123;Persist Security Info=Tru' +
      'e;User ID=mseUser;Initial Catalog=FMBA_MSE_1277;Data Source=BD2'
    ConnectionTimeout = 30
    IsolationLevel = ilBrowse
    KeepConnection = False
    LoginPrompt = False
    Mode = cmRead
    Provider = 'SQLOLEDB.1'
    Left = 128
    Top = 168
  end
  object qReg: TADOQuery
    Connection = MSBase
    CursorType = ctStatic
    AfterScroll = qRegAfterScroll
    OnCalcFields = qRegCalcFields
    Parameters = <
      item
        Name = 'DT'
        DataType = ftDateTime
        Size = -1
        Value = 0d
      end>
    SQL.Strings = (
      'DECLARE @DD1 as DATE, @DD2 as DATE'
      'SET @DD1 = :DT -- GETDATE()'
      ''
      'SELECT'
      '  isnull(convert(char(36),  EXR.Id),'#39#39') as [GUID]'
      ', isnull(convert(nchar(30), EXR.LastName), '#39#39') AS LNAME'
      ', isnull(convert(nchar(30), EXR.FirstName), '#39#39') AS FNAME'
      ', isnull(convert(nchar(30), EXR.SecondName), '#39#39') AS SNAME'
      ', isnull(EXR.AppointmentDT, '#39#39') AS DT_MSE'
      ', isnull(convert(nchar(100), DOR.ORGANIZATION_NAME), '#39#39') AS ORG'
      ', isnull(convert(nchar(10), DOR.Room), '#39#39') AS ROOM'
      ''
      'FROM [dbo].[ExamRecordListView] EXR'
      ''
      'JOIN Person PSR on PSR.PersonID = EXR.RecipientPersonId'
      'JOIN DicOrganization DOR on DOR.ORGANIZATION_ID = EXR.BuroId'
      ''
      'WHERE CAST (EXR.AppointmentDT as date) = @DD1'
      'ORDER BY EXR.LastName,EXR.FirstName,EXR.SecondName'
      ';')
    Left = 176
    Top = 168
    object qRegGUID: TStringField
      FieldName = 'GUID'
      ReadOnly = True
      FixedChar = True
      Size = 36
    end
    object qRegLNAME: TWideStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'LNAME'
      ReadOnly = True
      FixedChar = True
      Size = 30
    end
    object qRegFNAME: TWideStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'FNAME'
      ReadOnly = True
      FixedChar = True
      Size = 30
    end
    object qRegSNAME: TWideStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'SNAME'
      ReadOnly = True
      FixedChar = True
      Size = 30
    end
    object qRegDT_MSE: TDateTimeField
      DisplayLabel = #1047#1072#1087#1080#1089#1100' '#1085#1072' '#1052#1057#1069
      FieldName = 'DT_MSE'
      ReadOnly = True
    end
    object qRegORG: TWideStringField
      DisplayLabel = #1057#1086#1089#1090#1072#1074
      FieldName = 'ORG'
      ReadOnly = True
      FixedChar = True
      Size = 100
    end
    object qRegROOM: TWideStringField
      DisplayLabel = #1050#1072#1073#1080#1085#1077#1090
      FieldName = 'ROOM'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object qRegFIND: TStringField
      FieldKind = fkCalculated
      FieldName = 'FIND'
      Size = 90
      Calculated = True
    end
  end
  object tmNoSleep: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = tmNoSleepTimer
    Left = 32
    Top = 168
  end
  object pgBase: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    HostName = ''
    Port = 0
    Database = ''
    User = ''
    Password = ''
    Protocol = ''
    Left = 228
    Top = 168
  end
  object pgQry: TZReadOnlyQuery
    Connection = pgBase
    AfterScroll = pgQryAfterScroll
    OnCalcFields = pgQryCalcFields
    SQL.Strings = (
      'SELECT'
      '  coalesce(cast(exp."Id" as char(36)),'#39#39') as "GUID"'
      ', coalesce(cast(exp."LastName" as nchar(30)), '#39#39') AS "LNAME"'
      ', coalesce(cast(exp."FirstName" as nchar(30)), '#39#39') AS "FNAME"'
      ', coalesce(cast(exp."SecondName" as nchar(30)), '#39#39') AS "SNAME"'
      ', coalesce(exp."AppointmentDT", '#39'-infinity'#39') AS "DT_MSE"'
      
        ', coalesce(cast(dor."ORGANIZATION_NAME" as nchar(100)), '#39#39') AS "' +
        'ORG"'
      ', coalesce(cast(dor."Room" as nchar(10)), '#39#39') AS "ROOM"'
      ''
      'FROM "ExamRecordListView" exp'
      ''
      'JOIN "Person" prs on prs."PersonID" = exp."RecipientPersonId"'
      
        'JOIN "DicOrganization" dor on dor."ORGANIZATION_ID" = exp."BuroI' +
        'd"'
      ''
      'WHERE CAST (exp."AppointmentDT" as date) = :DT'
      'ORDER BY exp."LastName",exp."FirstName",exp."SecondName"'
      ';')
    Params = <
      item
        DataType = ftDate
        Name = 'DT'
        ParamType = ptInput
        Value = 42767d
      end>
    Left = 276
    Top = 168
    ParamData = <
      item
        DataType = ftDate
        Name = 'DT'
        ParamType = ptInput
        Value = 42767d
      end>
    object pgQryGUID: TWideStringField
      FieldName = 'GUID'
      ReadOnly = True
      Size = 126
    end
    object pgQryLNAME: TWideStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'LNAME'
      ReadOnly = True
      Size = 126
    end
    object pgQryFNAME: TWideStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'FNAME'
      ReadOnly = True
      Size = 126
    end
    object pgQrySNAME: TWideStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'SNAME'
      ReadOnly = True
      Size = 126
    end
    object pgQryDT_MSE: TDateTimeField
      DisplayLabel = #1047#1072#1087#1080#1089#1100' '#1085#1072' '#1052#1057#1069
      FieldName = 'DT_MSE'
      ReadOnly = True
    end
    object pgQryORG: TWideStringField
      DisplayLabel = #1057#1086#1089#1090#1072#1074
      FieldName = 'ORG'
      ReadOnly = True
      Size = 126
    end
    object pgQryROOM: TWideStringField
      DisplayLabel = #1050#1072#1073#1080#1085#1077#1090
      FieldName = 'ROOM'
      ReadOnly = True
      Size = 126
    end
    object pgQryFIND: TStringField
      FieldKind = fkCalculated
      FieldName = 'FIND'
      Size = 90
      Calculated = True
    end
  end
  object mtPrev: TMemTable
    AfterScroll = mtPrevAfterScroll
    LogChanges = True
    OnCalcFields = mtPrevCalcFields
    Left = 32
    Top = 264
    object mtPrevDTCREAT: TDateTimeField
      DisplayLabel = #1057#1086#1079#1076#1072#1085
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
    object mtPrevOWN: TStringField
      DisplayLabel = #1042#1083#1072#1076#1077#1083#1077#1094
      FieldName = 'OWN'
      Visible = False
      Size = 30
    end
    object mtPrevFIND: TStringField
      FieldKind = fkCalculated
      FieldName = 'FIND'
      Size = 90
      Calculated = True
    end
  end
  object dsPrev: TDataSource
    DataSet = mtPrev
    Left = 80
    Top = 264
  end
end

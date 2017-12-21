object Main: TMain
  Left = 2181
  Top = 146
  Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103' '#1087#1086#1089#1077#1090#1080#1090#1077#1083#1103
  ClientHeight = 371
  ClientWidth = 714
  Color = clBtnFace
  Constraints.MinHeight = 410
  Constraints.MinWidth = 730
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
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 714
    Height = 41
    Align = alTop
    TabOrder = 0
    DesignSize = (
      714
      41)
    object btnNew: TButton
      Left = 8
      Top = 9
      Width = 75
      Height = 25
      Caption = #1053#1086#1074#1099#1081
      TabOrder = 0
      OnClick = btnNewClick
    end
    object btnPrint: TButton
      Left = 170
      Top = 10
      Width = 75
      Height = 25
      Caption = #1058#1072#1083#1086#1085
      TabOrder = 2
      OnClick = btnPrintClick
    end
    object btnScan: TButton
      Left = 89
      Top = 10
      Width = 75
      Height = 25
      Caption = #1057#1082#1072#1085#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 1
      OnClick = btnScanClick
    end
    object stStatus: TPanel
      Left = 251
      Top = 9
      Width = 414
      Height = 25
      Alignment = taLeftJustify
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
    end
  end
  object pcPGS: TPageControl
    Left = 0
    Top = 41
    Width = 714
    Height = 330
    ActivePage = tsPerson
    Align = alClient
    TabOrder = 1
    ExplicitHeight = 300
    object tsPerson: TTabSheet
      Caption = #1055#1086#1089#1077#1090#1080#1090#1077#1083#1100
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 272
      object imgPerson: TImage
        Left = 0
        Top = 0
        Width = 141
        Height = 302
        Align = alClient
        Proportional = True
        Stretch = True
        ExplicitLeft = 10
        ExplicitTop = 18
        ExplicitWidth = 113
        ExplicitHeight = 105
      end
      object pnlPerson: TPanel
        Left = 141
        Top = 0
        Width = 565
        Height = 302
        Align = alRight
        TabOrder = 0
        ExplicitHeight = 272
        object lblLNAME: TLabel
          Left = 51
          Top = 47
          Width = 44
          Height = 13
          Alignment = taRightJustify
          Caption = #1060#1072#1084#1080#1083#1080#1103
        end
        object lblFNAME: TLabel
          Left = 371
          Top = 47
          Width = 19
          Height = 13
          Alignment = taRightJustify
          Caption = #1048#1084#1103
        end
        object lblSNAME: TLabel
          Left = 46
          Top = 74
          Width = 49
          Height = 13
          Alignment = taRightJustify
          Caption = #1054#1090#1095#1077#1089#1090#1074#1086
        end
        object lblSEX: TLabel
          Left = 236
          Top = 74
          Width = 19
          Height = 13
          Alignment = taRightJustify
          Caption = #1055#1086#1083
        end
        object lblBDATE: TLabel
          Left = 311
          Top = 74
          Width = 80
          Height = 13
          Alignment = taRightJustify
          Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
        end
        object lblBPLACE: TLabel
          Left = 10
          Top = 101
          Width = 85
          Height = 13
          Alignment = taRightJustify
          Caption = #1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103
        end
        object lblWhDOC: TLabel
          Left = 34
          Top = 128
          Width = 61
          Height = 13
          Alignment = taRightJustify
          Caption = #1050#1077#1084' '#1074#1099#1076#1072#1085#1086
        end
        object lblDTDOC: TLabel
          Left = 27
          Top = 155
          Width = 68
          Height = 13
          Alignment = taRightJustify
          Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
        end
        object lblCODEDOC: TLabel
          Left = 238
          Top = 155
          Width = 102
          Height = 13
          Alignment = taRightJustify
          Caption = #1050#1086#1076' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
        end
        object lblMAIL: TLabel
          Left = 25
          Top = 183
          Width = 70
          Height = 13
          Alignment = taRightJustify
          Caption = #1055#1086#1095#1090#1072' (e-mail)'
        end
        object lblOLD: TLabel
          Left = 447
          Top = 182
          Width = 40
          Height = 13
          Alignment = taRightJustify
          Caption = #1042#1086#1079#1088#1072#1089#1090
        end
        object lblROOM: TLabel
          Left = 260
          Top = 182
          Width = 43
          Height = 13
          Alignment = taRightJustify
          Caption = #1050#1072#1073#1080#1085#1077#1090
        end
        object lblTicket: TLabel
          Left = 360
          Top = 182
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = #1058#1072#1083#1086#1085
        end
        object lblDOCSER: TLabel
          Left = 64
          Top = 20
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = #1057#1077#1088#1080#1103
        end
        object lblDOCNUM: TLabel
          Left = 258
          Top = 20
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = #1053#1086#1084#1077#1088
        end
        object lblGOAL: TLabel
          Left = 31
          Top = 209
          Width = 64
          Height = 13
          Alignment = taRightJustify
          Caption = #1062#1077#1083#1100' '#1074#1080#1079#1080#1090#1072
        end
        object lblEvaID: TLabel
          Left = 48
          Top = 236
          Width = 47
          Height = 13
          Alignment = taRightJustify
          Caption = #1045#1040#1042#1048#1048#1040#1057
        end
        object lblEvaOrg: TLabel
          Left = 59
          Top = 263
          Width = 36
          Height = 13
          Alignment = taRightJustify
          Caption = #1057#1086#1089#1090#1072#1074
        end
        object lblTime: TLabel
          Left = 360
          Top = 236
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = #1042#1088#1077#1084#1103
        end
        object edLNAME: TEdit
          Left = 101
          Top = 44
          Width = 264
          Height = 21
          TabOrder = 2
        end
        object edFNAME: TEdit
          Left = 396
          Top = 44
          Width = 124
          Height = 21
          TabOrder = 3
        end
        object edSNAME: TEdit
          Left = 101
          Top = 71
          Width = 130
          Height = 21
          TabOrder = 4
        end
        object edSEX: TEdit
          Left = 261
          Top = 71
          Width = 40
          Height = 21
          TabOrder = 5
        end
        object edBPLACE: TEdit
          Left = 101
          Top = 98
          Width = 419
          Height = 21
          TabOrder = 7
        end
        object edWhDOC: TEdit
          Left = 101
          Top = 125
          Width = 419
          Height = 21
          TabOrder = 8
        end
        object edCODEDOC: TEdit
          Left = 346
          Top = 152
          Width = 174
          Height = 21
          TabOrder = 10
        end
        object edMAIL: TEdit
          Left = 101
          Top = 179
          Width = 153
          Height = 21
          TabOrder = 11
        end
        object edOLD: TEdit
          Left = 493
          Top = 179
          Width = 27
          Height = 21
          ReadOnly = True
          TabOrder = 14
        end
        object edROOM: TEdit
          Left = 309
          Top = 179
          Width = 45
          Height = 21
          TabOrder = 12
        end
        object edBDATE: TDBDateTimeEditEh
          Left = 397
          Top = 71
          Width = 123
          Height = 21
          EditButtons = <>
          Kind = dtkDateEh
          TabOrder = 6
          Visible = True
          OnExit = edBDATEExit
        end
        object edDTDOC: TDBDateTimeEditEh
          Left = 101
          Top = 152
          Width = 130
          Height = 21
          EditButtons = <>
          Kind = dtkDateEh
          TabOrder = 9
          Visible = True
        end
        object edTicket: TEdit
          Left = 396
          Top = 179
          Width = 45
          Height = 21
          ReadOnly = True
          TabOrder = 13
        end
        object edDOCSER: TEdit
          Left = 101
          Top = 17
          Width = 130
          Height = 21
          TabOrder = 0
        end
        object edDOCNUM: TEdit
          Left = 295
          Top = 17
          Width = 225
          Height = 21
          TabOrder = 1
        end
        object edGOAL: TEdit
          Left = 101
          Top = 206
          Width = 419
          Height = 21
          TabOrder = 15
        end
        object edEvaID: TEdit
          Left = 101
          Top = 233
          Width = 253
          Height = 21
          ReadOnly = True
          TabOrder = 16
        end
        object btnEvaID: TButton
          Left = 447
          Top = 233
          Width = 73
          Height = 21
          Caption = #1053#1072#1081#1090#1080
          TabOrder = 17
          OnClick = btnEvaIDClick
        end
        object mmOrg: TMemo
          Left = 101
          Top = 260
          Width = 420
          Height = 32
          TabOrder = 18
        end
        object edTime: TEdit
          Left = 396
          Top = 233
          Width = 45
          Height = 21
          Alignment = taCenter
          ReadOnly = True
          TabOrder = 19
        end
      end
    end
    object tsTurn: TTabSheet
      Caption = #1054#1095#1077#1088#1077#1076#1100
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnlTurn: TPanel
        Left = 0
        Top = 0
        Width = 706
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object btnTurnRefresh: TButton
          Left = 4
          Top = 1
          Width = 75
          Height = 25
          Caption = #1054#1073#1085#1086#1074#1080#1090#1100
          TabOrder = 0
          OnClick = btnTurnRefreshClick
        end
      end
      object grdTurn: TDBGridEh
        Left = 0
        Top = 30
        Width = 706
        Height = 253
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
            Width = 100
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'FNAME'
            Footers = <>
            Width = 100
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'SNAME'
            Footers = <>
            Width = 100
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'BDATE'
            Footers = <>
            Width = 80
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
        Top = 283
        Width = 706
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
    end
    object tsList: TTabSheet
      Caption = #1057#1087#1080#1089#1086#1082
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnlEva: TPanel
        Left = 0
        Top = 0
        Width = 706
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object lblEvaIP: TLabel
          Left = 125
          Top = 6
          Width = 10
          Height = 13
          Alignment = taRightJustify
          Caption = 'IP'
        end
        object lblEvaBD: TLabel
          Left = 281
          Top = 6
          Width = 14
          Height = 13
          Alignment = taRightJustify
          Caption = #1041#1044
        end
        object lblEvaPort: TLabel
          Left = 446
          Top = 8
          Width = 25
          Height = 13
          Alignment = taRightJustify
          Caption = #1055#1086#1088#1090
        end
        object btnEvaRefresh: TButton
          Left = 4
          Top = 1
          Width = 75
          Height = 25
          Caption = #1054#1073#1085#1086#1074#1080#1090#1100
          TabOrder = 0
          OnClick = btnEvaRefreshClick
        end
        object edEvaIP: TEdit
          Left = 141
          Top = 3
          Width = 130
          Height = 21
          TabOrder = 1
        end
        object edEvaBD: TEdit
          Left = 301
          Top = 3
          Width = 130
          Height = 21
          TabOrder = 2
        end
        object edEvaPort: TEdit
          Left = 477
          Top = 3
          Width = 44
          Height = 21
          TabOrder = 3
        end
      end
      object grdEva: TDBGridEh
        Left = 0
        Top = 30
        Width = 706
        Height = 253
        Align = alClient
        AutoFitColWidths = True
        FilterEditMode = False
        DataGrouping.GroupLevels = <>
        DataSource = dsReg
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
        OnDblClick = grdEvaDblClick
        Columns = <
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'LNAME'
            Footers = <>
            Width = 100
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'FNAME'
            Footers = <>
            Width = 100
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'SNAME'
            Footers = <>
            Width = 100
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'DT_MSE'
            Footers = <>
            Width = 150
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'ROOM'
            Footers = <>
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'ORG'
            Footers = <>
            Width = 200
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object sbEva: TStatusBar
        Left = 0
        Top = 283
        Width = 706
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
    end
  end
  object mt: TMemTable
    AfterScroll = mtAfterScroll
    Left = 304
    Top = 56
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
  end
  object ds: TDataSource
    DataSet = mt
    Left = 344
    Top = 56
  end
  object mtReg: TMemTable
    Left = 304
    Top = 8
    object mtRegNumReg: TIntegerField
      DisplayLabel = 'NN'
      FieldName = 'NumReg'
    end
    object mtRegNmReg: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1088#1077#1075#1080#1086#1085#1072
      FieldName = 'NmReg'
      Size = 60
    end
    object mtRegBdReg: TIntegerField
      DisplayLabel = #1041#1044
      FieldName = 'BdReg'
    end
    object mtRegConnect: TStringField
      DisplayLabel = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077
      FieldName = 'Connect'
      Size = 200
    end
  end
  object dsReg: TDataSource
    DataSet = qReg
    Left = 352
    Top = 8
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
    Left = 400
    Top = 8
  end
  object qReg: TADOQuery
    Connection = MSBase
    CursorType = ctStatic
    AfterScroll = qRegAfterScroll
    Parameters = <>
    SQL.Strings = (
      'DECLARE @DD1 as DATE, @DD2 as DATE'
      'SET @DD1 = GETDATE()'
      ''
      'SELECT'
      '  isnull(convert(char(36),  EXR.RecipientPersonId),'#39#39') as [GUID]'
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
      'ORDER BY EXR.AppointmentDT'
      ';')
    Left = 448
    Top = 8
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
  end
  object ssw: TSSWriter
    NewSheetName = #1057#1090#1088#1072#1085#1080#1094#1072
    Server = sssExcel
    Left = 496
    Top = 8
  end
end

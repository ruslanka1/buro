object Main: TMain
  Left = 899
  Height = 336
  Top = 166
  Width = 701
  Caption = 'Регистрация посетителя'
  ClientHeight = 336
  ClientWidth = 701
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
  LCLVersion = '1.6.0.4'
  object pnlTop: TPanel
    Left = 0
    Height = 41
    Top = 0
    Width = 701
    Height = 41
    Align = alTop
    ClientHeight = 41
    ClientWidth = 701
    TabOrder = 0
    DesignSize = (
      701
      41)
    object btnNew: TButton
      Left = 8
      Height = 25
      Top = 9
      Width = 75
      Caption = 'Новый'
      OnClick = btnNewClick
      TabOrder = 0
      OnClick = btnNewClick
    end
    object btnPrint: TButton
      Left = 170
      Height = 25
      Top = 10
      Width = 75
      Caption = 'Печать'
      OnClick = btnPrintClick
      TabOrder = 2
      OnClick = btnPrintClick
    end
    object btnSend: TButton
      Left = 251
      Height = 25
      Top = 10
      Width = 75
      Caption = 'Отправить'
      OnClick = btnSendClick
      TabOrder = 3
    end
    object btnScan: TButton
      Left = 89
      Height = 25
      Top = 10
      Width = 75
      Caption = 'Сканировать'
      OnClick = btnScanClick
      TabOrder = 1
      OnClick = btnScanClick
    end
    object stStatus: TStaticText
      Left = 332
      Height = 21
      Top = 12
      Width = 320
      Anchors = [akTop, akLeft, akRight]
      BorderStyle = sbsSunken
      TabOrder = 4
    end
  end
  object pcPGS: TPageControl
    Left = 0
    Height = 295
    Top = 41
    Width = 701
    ActivePage = tsPerson
    Align = alClient
    TabIndex = 0
    TabOrder = 1
    ExplicitWidth = 353
    ExplicitHeight = 392
    object tsPerson: TTabSheet
      Caption = 'Посетитель'
      ClientHeight = 272
      ClientWidth = 699
      object imgPerson: TImage
        Left = 0
        Height = 272
        Top = 0
        Width = 134
        Align = alClient
        Proportional = True
        Stretch = True
        ExplicitLeft = 10
        ExplicitTop = 18
        ExplicitWidth = 113
        ExplicitHeight = 105
      end
      object pnlPerson: TPanel
        Left = 134
        Height = 272
        Top = 0
        Width = 565
        Height = 267
        Align = alRight
        ClientHeight = 272
        ClientWidth = 565
        TabOrder = 0
        ExplicitLeft = 129
        ExplicitHeight = 228
        object lblLNAME: TLabel
          Left = 51
          Height = 13
          Top = 47
          Width = 52
          Alignment = taRightJustify
          Caption = 'Фамилия'
          ParentColor = False
        end
        object lblFNAME: TLabel
          Left = 371
          Height = 13
          Top = 47
          Width = 23
          Alignment = taRightJustify
          Caption = 'Имя'
          ParentColor = False
        end
        object lblSNAME: TLabel
          Left = 46
          Height = 13
          Top = 74
          Width = 54
          Alignment = taRightJustify
          Caption = 'Отчество'
          ParentColor = False
        end
        object lblSEX: TLabel
          Left = 236
          Height = 13
          Top = 74
          Width = 22
          Alignment = taRightJustify
          Caption = 'Пол'
          ParentColor = False
        end
        object lblBDATE: TLabel
          Left = 311
          Height = 13
          Top = 74
          Width = 93
          Alignment = taRightJustify
          Caption = 'Дата рождения'
          ParentColor = False
        end
        object lblBPLACE: TLabel
          Left = 10
          Height = 13
          Top = 101
          Width = 99
          Alignment = taRightJustify
          Caption = 'Место рождения'
          ParentColor = False
        end
        object lblWhDOC: TLabel
          Left = 34
          Height = 13
          Top = 128
          Width = 71
          Alignment = taRightJustify
          Caption = 'Кем выдано'
          ParentColor = False
        end
        object lblDTDOC: TLabel
          Left = 27
          Height = 13
          Top = 155
          Width = 77
          Alignment = taRightJustify
          Caption = 'Дата выдачи'
          ParentColor = False
        end
        object lblCODEDOC: TLabel
          Left = 238
          Height = 13
          Top = 155
          Width = 119
          Alignment = taRightJustify
          Caption = 'Код подразделения'
          ParentColor = False
        end
        object lblMAIL: TLabel
          Left = 25
          Height = 13
          Top = 183
          Width = 82
          Alignment = taRightJustify
          Caption = 'Почта (e-mail)'
          ParentColor = False
        end
        object lblOLD: TLabel
          Left = 447
          Height = 13
          Top = 182
          Width = 47
          Alignment = taRightJustify
          Caption = 'Возраст'
          ParentColor = False
        end
        object lblROOM: TLabel
          Left = 246
          Height = 13
          Top = 182
          Width = 50
          Alignment = taRightJustify
          Caption = 'Комната'
          ParentColor = False
        end
        object lblTicket: TLabel
          Left = 360
          Height = 13
          Top = 182
          Width = 35
          Alignment = taRightJustify
          Caption = 'Талон'
          ParentColor = False
        end
        object lblDOCSER: TLabel
          Left = 64
          Height = 13
          Top = 20
          Width = 36
          Alignment = taRightJustify
          Caption = 'Серия'
          ParentColor = False
        end
        object lblDOCNUM: TLabel
          Left = 258
          Height = 13
          Top = 20
          Width = 37
          Alignment = taRightJustify
          Caption = 'Номер'
          ParentColor = False
        end
        object lblGOAL: TLabel
          Left = 31
          Height = 13
          Top = 209
          Width = 72
          Alignment = taRightJustify
          Caption = 'Цель визита'
          ParentColor = False
        end
        object edLNAME: TEdit
          Left = 101
          Height = 25
          Top = 44
          Width = 264
          Height = 21
          TabOrder = 2
        end
        object edFNAME: TEdit
          Left = 396
          Height = 25
          Top = 44
          Width = 124
          Height = 21
          TabOrder = 3
        end
        object edSNAME: TEdit
          Left = 101
          Height = 25
          Top = 71
          Width = 130
          Height = 21
          TabOrder = 4
        end
        object edSEX: TEdit
          Left = 261
          Height = 25
          Top = 71
          Width = 40
          Height = 21
          TabOrder = 5
        end
        object edBPLACE: TEdit
          Left = 101
          Height = 25
          Top = 98
          Width = 419
          TabOrder = 6
        end
        object edWhDOC: TEdit
          Left = 101
          Height = 25
          Top = 125
          Width = 419
          TabOrder = 7
        end
        object edCODEDOC: TEdit
          Left = 346
          Height = 25
          Top = 152
          Width = 174
          TabOrder = 9
        end
        object edMAIL: TEdit
          Left = 101
          Height = 25
          Top = 179
          Width = 130
          TabOrder = 10
        end
        object edOLD: TEdit
          Left = 493
          Height = 25
          Top = 179
          Width = 27
          Height = 21
          ReadOnly = True
          TabOrder = 8
        end
        object edROOM: TEdit
          Left = 295
          Height = 25
          Top = 179
          Width = 45
          TabOrder = 11
        end
        object edTicket: TEdit
          Left = 396
          Height = 25
          Top = 179
          Width = 45
          Height = 21
          ReadOnly = True
          TabOrder = 13
        end
        object edDOCSER: TEdit
          Left = 101
          Height = 25
          Top = 17
          Width = 130
          Height = 21
          TabOrder = 0
        end
        object edDOCNUM: TEdit
          Left = 295
          Height = 25
          Top = 17
          Width = 225
          Height = 21
          TabOrder = 1
        end
        object edGOAL: TEdit
          Left = 101
          Height = 25
          Top = 206
          Width = 419
          TabOrder = 12
        end
        object DateTimePicker1: TDateTimePicker
          Left = 104
          Height = 19
          Top = 152
          Width = 87
          CenturyFrom = 1941
          MaxDate = 2958465
          MinDate = -53780
          TabOrder = 14
          TrailingSeparator = False
          TextForNullDate = 'NULL'
          LeadingZeros = True
          Kind = dtkDate
          TimeFormat = tf24
          TimeDisplay = tdHMS
          DateMode = dmComboBox
          Date = 43088
          Time = 0.885139085650735
          UseDefaultSeparators = True
          HideDateTimeParts = []
          MonthNames = 'Long'
        end
        object DateTimePicker2: TDateTimePicker
          Left = 424
          Height = 19
          Top = 71
          Width = 87
          CenturyFrom = 1941
          MaxDate = 2958465
          MinDate = -53780
          TabOrder = 15
          TrailingSeparator = False
          TextForNullDate = 'NULL'
          LeadingZeros = True
          Kind = dtkDate
          TimeFormat = tf24
          TimeDisplay = tdHMS
          DateMode = dmComboBox
          Date = 43088
          Time = 0.885139085650735
          UseDefaultSeparators = True
          HideDateTimeParts = []
          MonthNames = 'Long'
        end
      end
    end
    object tsTurn: TTabSheet
      Caption = 'Очередь'
      ClientHeight = 272
      ClientWidth = 699
      ImageIndex = 1
      object grdTurn: TDBGrid
        Left = 0
        Height = 223
        Top = 25
        Width = 693
        Align = alClient
        Color = clWindow
        Columns = <>
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
        Top = 248
        Width = 693
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
      object pnlTurn: TPanel
        Left = 0
        Height = 25
        Top = 0
        Width = 693
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
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

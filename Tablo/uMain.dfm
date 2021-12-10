object Main: TMain
  Left = 461
  Top = 281
  BorderStyle = bsNone
  ClientHeight = 567
  ClientWidth = 800
  Color = clBtnFace
  Constraints.MinHeight = 556
  Constraints.MinWidth = 800
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -35
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 42
  object grdTurn: TDBGridEh
    Left = 0
    Top = 0
    Width = 800
    Height = 517
    Align = alClient
    Constraints.MinHeight = 477
    Constraints.MinWidth = 800
    FilterEditMode = False
    DataGrouping.GroupLevels = <>
    DataSource = ds
    EvenRowColor = clWhite
    Flat = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -35
    Font.Name = 'Tahoma'
    Font.Style = []
    FooterColor = clBtnFace
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clBlack
    FooterFont.Height = -35
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = [fsBold]
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghExtendVertLines, dghHideFilterDoApply, dghHighlightNull]
    ParentColor = True
    ParentFont = False
    ReadOnly = True
    RowDetailPanel.Color = clBtnFace
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -35
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    VertScrollBar.VisibleMode = sbNeverShowEh
    OnDrawColumnCell = grdTurnDrawColumnCell
    Columns = <
      item
        Alignment = taCenter
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = 'NUM'
        Footers = <>
        Layout = tlCenter
        Width = 120
      end
      item
        Alignment = taCenter
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = 'INTIME'
        Footers = <>
        Layout = tlCenter
        Tag = 1
        Width = 130
      end
      item
        Alignment = taCenter
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = 'ROOM'
        Footers = <>
        Layout = tlCenter
        Tag = 2
        Width = 200
      end
      item
        Alignment = taCenter
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = 'TIME'
        Footers = <>
        Layout = tlCenter
        Tag = 3
        Width = 130
      end
      item
        Alignment = taCenter
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = 'CALL'
        Footers = <>
        Layout = tlCenter
        Tag = 4
        Width = 200
      end
      item
        EditButtons = <>
        FieldName = 'LNAME'
        Footers = <>
        Layout = tlCenter
        Tag = 5
        Width = 250
        OnGetCellParams = grdTurnColumnsGetCellParams
      end
      item
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = 'FNAME'
        Footers = <>
        Layout = tlCenter
        Tag = 6
        Width = 250
        OnGetCellParams = grdTurnColumnsGetCellParams
      end
      item
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = 'SNAME'
        Footers = <>
        Layout = tlCenter
        Tag = 7
        Width = 250
        OnGetCellParams = grdTurnColumnsGetCellParams
      end
      item
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = 'GOAL'
        Footers = <>
        Layout = tlCenter
        Tag = 8
        Width = 400
        OnGetCellParams = grdTurnColumnsGetCellParams
      end
      item
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = 'ORG'
        Footers = <>
        Layout = tlCenter
        Tag = 9
        Width = 400
        OnGetCellParams = grdTurnColumnsGetCellParams
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object pnlTurnAll: TPanel
    Left = 0
    Top = 517
    Width = 800
    Height = 50
    Align = alBottom
    Alignment = taRightJustify
    BevelOuter = bvLowered
    ParentBackground = False
    ParentColor = True
    TabOrder = 1
    object pnlTurnL: TPanel
      Left = 1
      Top = 1
      Width = 200
      Height = 48
      Align = alLeft
      BevelOuter = bvLowered
      Caption = '-'
      ParentBackground = False
      ParentColor = True
      TabOrder = 0
      OnClick = pnlTurnClick
    end
    object pnlTurnM: TPanel
      Tag = 1
      Left = 201
      Top = 1
      Width = 398
      Height = 48
      Align = alClient
      Alignment = taRightJustify
      BevelOuter = bvLowered
      ParentBackground = False
      ParentColor = True
      TabOrder = 1
      OnClick = pnlTurnClick
    end
    object pnlTurnR: TPanel
      Tag = 2
      Left = 599
      Top = 1
      Width = 200
      Height = 48
      Align = alRight
      BevelOuter = bvLowered
      Caption = '-'
      ParentBackground = False
      ParentColor = True
      TabOrder = 2
      OnClick = pnlTurnClick
    end
  end
  object mt: TMemTable
    AfterScroll = mtAfterScroll
    Left = 304
    Top = 48
    object mtNUM: TStringField
      DisplayLabel = #1058#1072#1083#1086#1085
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
    object mtCALL: TStringField
      DisplayLabel = #1055#1088#1080#1105#1084
      FieldName = 'CALL'
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
    object mtTYPE: TIntegerField
      FieldName = 'TYPE'
    end
  end
  object ds: TDataSource
    DataSet = mt
    Left = 349
    Top = 48
  end
  object Timer: TTimer
    Enabled = False
    Interval = 15000
    OnTimer = TimerTimer
    Left = 395
    Top = 48
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
    Left = 441
    Top = 48
  end
  object qReg: TADOQuery
    Connection = MSBase
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '  isnull(cast(a.Name as char(30)), '#39#39') as NAME'
      ', isnull(cast(a.HandlesTicketsWithoutOrg as int), 0) as T_ALL'
      ', isnull(cast(b.Number as char(3)), '#39#39') as T_NUM'
      ', isnull(b.TicketTime, '#39#39') as DT_IN'
      ', isnull(cast(d.Room as char(10)), '#39#39') as ROOM'
      'FROM [DigitalTicketQueue] a'
      'LEFT JOIN [DigitalTicket] b ON b.Id=a.CurrentTicketId'
      
        'LEFT JOIN [DigitalTicketQueueOrganization] c ON c.[DigitalTicket' +
        'QueueId]=a.Id'
      
        'LEFT JOIN DicOrganization d ON d.ORGANIZATION_ID=c.OrganizationI' +
        'd'
      
        'where (cast(b.TicketTime as date) =  cast(GETDATE() as date)) an' +
        'd c.OrganizationId is not null'
      'order by b.Number'
      ';')
    Left = 486
    Top = 48
    object qRegNAME: TStringField
      FieldName = 'NAME'
      ReadOnly = True
      FixedChar = True
      Size = 30
    end
    object qRegT_ALL: TIntegerField
      FieldName = 'T_ALL'
      ReadOnly = True
    end
    object qRegT_NUM: TStringField
      FieldName = 'T_NUM'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object qRegDT_IN: TDateTimeField
      FieldName = 'DT_IN'
      ReadOnly = True
    end
    object qRegROOM: TStringField
      FieldName = 'ROOM'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
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
    Left = 532
    Top = 48
  end
  object pgQry: TZReadOnlyQuery
    Connection = pgBase
    SQL.Strings = (
      'SELECT'
      '  coalesce(cast(a."Name" as char(30)), '#39#39') as "NAME"'
      
        ', coalesce(cast(a."HandlesTicketsWithoutOrg" as int), 0) as "T_A' +
        'LL"'
      ', coalesce(cast(b."Number" as char(3)), '#39#39') as "T_NUM"'
      ', coalesce(b."TicketTime", '#39'-infinity'#39') as "DT_IN"'
      ', coalesce(cast(d."Room" as char(10)), '#39#39') as "ROOM"'
      'FROM "DigitalTicketQueue" a'
      'LEFT JOIN "DigitalTicket" b ON b."Id"=a."CurrentTicketId"'
      
        'LEFT JOIN "DigitalTicketQueueOrganization" c ON c."DigitalTicket' +
        'QueueId"=a."Id"'
      
        'LEFT JOIN "DicOrganization" d ON d."ORGANIZATION_ID"=c."Organiza' +
        'tionId"'
      
        'where (cast(b."TicketTime" as date) =  cast(LOCALTIMESTAMP(0) as' +
        ' date)) and c."OrganizationId" is not null'
      'order by b."Number"'
      ';')
    Params = <>
    Left = 578
    Top = 48
  end
  object SpVoice: TSpVoice
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 624
    Top = 48
  end
end

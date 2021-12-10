object Ticket: TTicket
  Left = 620
  Top = 685
  Caption = #1058#1072#1083#1086#1085
  ClientHeight = 247
  ClientWidth = 370
  Color = clWhite
  Constraints.MaxHeight = 286
  Constraints.MaxWidth = 386
  Constraints.MinHeight = 286
  Constraints.MinWidth = 386
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcPGS: TPageControl
    Left = 0
    Top = 0
    Width = 370
    Height = 247
    ActivePage = tsTicket
    Align = alClient
    TabOrder = 0
    TabStop = False
    ExplicitWidth = 364
    ExplicitHeight = 221
    object tsTicket: TTabSheet
      Caption = 'tsTicket'
      TabVisible = False
      ExplicitLeft = 2
      ExplicitTop = 0
      ExplicitWidth = 356
      ExplicitHeight = 211
      object lblBarcode: TLabel
        Left = 33
        Top = 8
        Width = 296
        Height = 72
        Caption = '*000000*'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -96
        Font.Name = 'Free 3 of 9 Extended'
        Font.Style = []
        ParentFont = False
      end
      object lblDate: TLabel
        Left = 256
        Top = 111
        Width = 100
        Height = 25
        Caption = '01.01.2018'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblInTimeNM: TLabel
        Left = 289
        Top = 86
        Width = 67
        Height = 25
        Alignment = taRightJustify
        Caption = #1042#1088#1077#1084#1103':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblNum: TLabel
        Left = 8
        Top = 212
        Width = 58
        Height = 25
        Caption = #1058#1072#1083#1086#1085
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object lblNumber: TLabel
        Left = 33
        Top = 86
        Width = 88
        Height = 25
        Caption = '*000000*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblRoom: TLabel
        Left = 8
        Top = 111
        Width = 81
        Height = 25
        Caption = #1050#1072#1073#1080#1085#1077#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblGoal: TLabel
        Left = 8
        Top = 135
        Width = 44
        Height = 23
        Caption = #1062#1077#1083#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object btnPrint: TButton
        Left = 8
        Top = 212
        Width = 70
        Height = 25
        Hint = #1055#1077#1095#1072#1090#1100' '#1058#1072#1083#1086#1085#1072
        Caption = #1055#1077#1095#1072#1090#1072#1090#1100
        ModalResult = 1
        TabOrder = 0
        OnClick = btnPrintClick
      end
      object btnPrintSend: TButton
        Left = 218
        Top = 212
        Width = 138
        Height = 25
        Hint = #1055#1077#1095#1072#1090#1100' '#1058#1072#1083#1086#1085#1072' '#1080' '#1085#1072#1087#1077#1095#1072#1090#1072#1090#1100' '#1080' '#1086#1090#1087#1088#1072#1074#1082#1072' '#1085#1072' e-mail'
        Caption = #1055#1077#1095#1072#1090#1072#1090#1100' '#1080' '#1086#1090#1087#1088#1072#1074#1080#1090#1100
        ModalResult = 1
        TabOrder = 3
        OnClick = btnPrintSendClick
      end
      object btnSend: TButton
        Left = 148
        Top = 212
        Width = 70
        Height = 25
        Hint = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1085#1072' e-mail'
        Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
        ModalResult = 1
        TabOrder = 2
        OnClick = btnSendClick
      end
      object mmOrg: TMemo
        Left = 8
        Top = 160
        Width = 348
        Height = 46
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Lines.Strings = (
          #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077)
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object btnPrintAgree: TButton
        Left = 78
        Top = 212
        Width = 70
        Height = 25
        Hint = #1055#1077#1095#1072#1090#1100' '#1057#1086#1075#1083#1072#1089#1080#1103' '#1085#1072' '#1086#1073#1088#1072#1073#1086#1090#1082#1091' '#1087#1077#1088#1089#1086#1085#1072#1083#1100#1085#1099#1093' '#1076#1072#1085#1085#1099#1093
        Caption = #1057#1086#1075#1083#1072#1089#1080#1077
        ModalResult = 1
        TabOrder = 1
        OnClick = btnPrintAgreeClick
      end
    end
    object tsAgree: TTabSheet
      Caption = 'tsAgree'
      ImageIndex = 1
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 356
      ExplicitHeight = 211
      object mmAgree: TMemo
        Left = 0
        Top = 0
        Width = 362
        Height = 237
        Align = alClient
        BorderStyle = bsNone
        Lines.Strings = (
          ''
          '  '#1057#1054#1043#1051#1040#1057#1048#1045' '#1053#1040' '#1054#1041#1056#1040#1041#1054#1058#1050#1059' '#1055#1045#1056#1057#1054#1053#1040#1051#1068#1053#1067#1061' '#1044#1040#1053#1053#1067#1061'.'
          #1071', %visitor%'
          #1074' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1080' '#1089#1086' '#1089#1090'. 9 '#1060#1077#1076#1077#1088#1072#1083#1100#1085#1086#1075#1086' '#1079#1072#1082#1086#1085#1072' '#1086#1090' 27.07.2006 '
          'N 152-'#1060#1047' "'#1054' '#1087#1077#1088#1089#1086#1085#1072#1083#1100#1085#1099#1093' '#1076#1072#1085#1085#1099#1093'", '#1074' '#1094#1077#1083#1103#1093' '#1086#1073#1077#1089#1087#1077#1095#1077#1085#1080#1103' '
          #1073#1077#1079#1086#1087#1072#1089#1085#1086#1089#1090#1080' '#1080' '#1082#1086#1085#1090#1088#1086#1083#1103' '#1087#1086#1089#1077#1097#1077#1085#1080#1103' '#1059#1095#1088#1077#1078#1076#1077#1085#1080#1103', '#1076#1072#1102' '#1089#1086#1075#1083#1072#1089#1080#1077
          '%operator%'
          #1085#1072' '#1086#1073#1088#1072#1073#1086#1090#1082#1091' '#1084#1086#1080#1093' '#1087#1077#1088#1089#1086#1085#1072#1083#1100#1085#1099#1093' '#1076#1072#1085#1085#1099#1093' ('#1092#1072#1084#1080#1083#1080#1102', '#1080#1084#1103', '#1086#1090#1095#1077#1089#1090#1074#1086', '
          #1087#1086#1083', '#1087#1072#1089#1087#1086#1088#1090#1085#1099#1077' '#1076#1072#1085#1085#1099#1077', '#1076#1072#1090#1091' '#1080' '#1084#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103') '#1074' '#1089#1080#1089#1090#1077#1084#1077' '
          '"'#1069#1083#1077#1082#1090#1088#1086#1085#1085#1072#1103' '#1086#1095#1077#1088#1077#1076#1100'" '#1076#1083#1103' '#1086#1089#1091#1097#1077#1089#1090#1074#1083#1077#1085#1080#1103' '#1076#1077#1081#1089#1090#1074#1080#1081' '#1087#1086' '#1089#1073#1086#1088#1091', '
          #1089#1080#1089#1090#1077#1084#1072#1090#1080#1079#1072#1094#1080#1080', '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1103' '#1080' '#1091#1076#1072#1083#1077#1085#1080#1103', '#1089#1088#1086#1082#1086#1084' '#1085#1072' '#1086#1076#1080#1085' '#1075#1086#1076'.'
          ''
          #1044#1040#1058#1040' %data% %num% '#1055#1054#1044#1055#1048#1057#1068)
        TabOrder = 0
        ExplicitHeight = 211
      end
    end
  end
  object IdSMTP: TIdSMTP
    IOHandler = IdSSL
    SASLMechanisms = <>
    Left = 8
    Top = 8
  end
  object IdMes: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 48
    Top = 8
  end
  object IdSSL: TIdSSLIOHandlerSocketOpenSSL
    Destination = ':25'
    MaxLineAction = maException
    Port = 25
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 88
    Top = 8
  end
end

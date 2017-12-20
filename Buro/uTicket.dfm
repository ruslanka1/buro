object Ticket: TTicket
  Left = 793
  Top = 531
  Caption = #1058#1072#1083#1086#1085
  ClientHeight = 211
  ClientWidth = 364
  Color = clWhite
  Constraints.MaxHeight = 250
  Constraints.MaxWidth = 380
  Constraints.MinHeight = 250
  Constraints.MinWidth = 380
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblDate: TLabel
    Left = 244
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
  object lblNumber: TLabel
    Left = 137
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
  object lblRoom: TLabel
    Left = 8
    Top = 111
    Width = 112
    Height = 25
    Caption = #1050#1072#1073#1080#1085#1077#1090' '#8470
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnPrint: TButton
    Left = 8
    Top = 180
    Width = 89
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1072#1090#1100
    ModalResult = 1
    TabOrder = 0
    OnClick = btnPrintClick
  end
  object btnSend: TButton
    Left = 98
    Top = 180
    Width = 97
    Height = 25
    Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
    ModalResult = 1
    TabOrder = 1
    OnClick = btnSendClick
  end
  object btnPrintSend: TButton
    Left = 196
    Top = 180
    Width = 160
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1072#1090#1100' '#1080' '#1086#1090#1087#1088#1072#1074#1080#1090#1100
    ModalResult = 1
    TabOrder = 2
    OnClick = btnPrintSendClick
  end
  object mmOrg: TMemo
    Left = 8
    Top = 142
    Width = 348
    Height = 32
    Lines.Strings = (
      #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103)
    TabOrder = 3
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

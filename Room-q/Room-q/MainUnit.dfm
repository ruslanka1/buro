object DemoForm: TDemoForm
  Left = 1330
  Top = 319
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1058#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1077
  ClientHeight = 257
  ClientWidth = 590
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object mmLog: TMemo
    Left = 8
    Top = 167
    Width = 577
    Height = 85
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object gbBright: TGroupBox
    Left = 207
    Top = 8
    Width = 108
    Height = 45
    Caption = ' '#1071#1088#1082#1086#1089#1090#1100' '
    TabOrder = 1
    object seBright: TSpinEdit
      Left = 8
      Top = 16
      Width = 50
      Height = 22
      MaxValue = 10
      MinValue = 1
      TabOrder = 0
      Value = 5
    end
    object btnBright: TButton
      Left = 64
      Top = 16
      Width = 37
      Height = 22
      Caption = '->'
      TabOrder = 1
      OnClick = btnBrightClick
    end
  end
  object gbText: TGroupBox
    Left = 8
    Top = 53
    Width = 574
    Height = 108
    Caption = ' '#1058#1077#1082#1089#1090' '
    TabOrder = 2
    object lblDispNo: TLabel
      Left = 14
      Top = 19
      Width = 48
      Height = 13
      Caption = #1044#1080#1089#1087#1083#1077#1081':'
    end
    object lblFont: TLabel
      Left = 128
      Top = 19
      Width = 37
      Height = 13
      Caption = #1064#1088#1080#1092#1090':'
    end
    object lblAlign: TLabel
      Left = 231
      Top = 19
      Width = 78
      Height = 13
      Caption = #1042#1099#1088#1072#1074#1085#1080#1074#1072#1085#1080#1077':'
    end
    object lblSpeed: TLabel
      Left = 11
      Top = 47
      Width = 51
      Height = 13
      Caption = #1057#1082#1086#1088#1086#1089#1090#1100':'
    end
    object lblText: TLabel
      Left = 29
      Top = 75
      Width = 33
      Height = 13
      Caption = #1058#1077#1082#1089#1090':'
    end
    object lblColor: TLabel
      Left = 137
      Top = 47
      Width = 28
      Height = 13
      Caption = #1062#1074#1077#1090':'
    end
    object lblEffect: TLabel
      Left = 231
      Top = 46
      Width = 43
      Height = 13
      Caption = #1069#1092#1092#1077#1082#1090':'
    end
    object lblIterat: TLabel
      Left = 341
      Top = 46
      Width = 52
      Height = 13
      Caption = #1055#1086#1074#1090#1086#1088#1086#1074':'
    end
    object lblInterval: TLabel
      Left = 457
      Top = 46
      Width = 52
      Height = 13
      Caption = #1048#1085#1090#1077#1088#1074#1072#1083':'
    end
    object seDispNo: TSpinEdit
      Left = 68
      Top = 16
      Width = 50
      Height = 22
      MaxValue = 5
      MinValue = 0
      TabOrder = 0
      Value = 0
    end
    object cbOpt: TCheckBox
      Left = 399
      Top = 16
      Width = 76
      Height = 21
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 1
    end
    object seFont: TSpinEdit
      Left = 171
      Top = 16
      Width = 50
      Height = 22
      MaxValue = 7
      MinValue = 0
      TabOrder = 2
      Value = 0
    end
    object cbAlign: TComboBox
      Left = 315
      Top = 16
      Width = 73
      Height = 21
      Style = csDropDownList
      ItemIndex = 1
      TabOrder = 3
      Text = #1042#1087#1088#1072#1074#1086
      Items.Strings = (
        #1042#1083#1077#1074#1086
        #1042#1087#1088#1072#1074#1086
        #1055#1086' '#1094#1077#1085#1090#1088#1091)
    end
    object seSpeed: TSpinEdit
      Left = 68
      Top = 44
      Width = 50
      Height = 22
      MaxValue = 254
      MinValue = 0
      TabOrder = 4
      Value = 0
    end
    object edText: TEdit
      Left = 68
      Top = 72
      Width = 381
      Height = 21
      TabOrder = 5
      Text = '12345678'
    end
    object btnText: TButton
      Left = 457
      Top = 72
      Width = 108
      Height = 22
      Caption = #1042#1099#1074#1077#1089#1090#1080
      TabOrder = 6
      OnClick = btnTextClick
    end
    object seColor: TSpinEdit
      Left = 171
      Top = 44
      Width = 50
      Height = 22
      MaxValue = 7
      MinValue = 0
      TabOrder = 7
      Value = 0
    end
    object seEffect: TSpinEdit
      Left = 280
      Top = 43
      Width = 50
      Height = 22
      MaxValue = 2
      MinValue = 0
      TabOrder = 8
      Value = 0
    end
    object seIterat: TSpinEdit
      Left = 399
      Top = 43
      Width = 50
      Height = 22
      MaxValue = 10
      MinValue = 0
      TabOrder = 9
      Value = 0
    end
    object seInterval: TSpinEdit
      Left = 515
      Top = 43
      Width = 50
      Height = 22
      MaxValue = 254
      MinValue = 0
      TabOrder = 10
      Value = 0
    end
  end
  object gbTestMode: TGroupBox
    Left = 321
    Top = 8
    Width = 157
    Height = 45
    Caption = ' '#1058#1077#1089#1090' '
    TabOrder = 3
    object seTestMode: TSpinEdit
      Left = 8
      Top = 16
      Width = 50
      Height = 22
      MaxValue = 5
      MinValue = 0
      TabOrder = 0
      Value = 0
    end
    object btnTestMode: TButton
      Left = 114
      Top = 16
      Width = 37
      Height = 23
      Caption = '->'
      TabOrder = 1
      OnClick = btnTestModeClick
    end
    object cbTestMode: TCheckBox
      Left = 64
      Top = 16
      Width = 45
      Height = 23
      Caption = #1062#1080#1082#1083
      TabOrder = 2
    end
  end
  object gbCycled: TGroupBox
    Left = 484
    Top = 8
    Width = 98
    Height = 45
    Caption = ' '#1057#1074#1103#1079#1100' '
    TabOrder = 4
    object btnCycled: TButton
      Left = 52
      Top = 16
      Width = 37
      Height = 22
      Caption = #1058#1077#1089#1090
      TabOrder = 0
      OnClick = btnCycledClick
    end
    object cbCycled: TCheckBox
      Left = 3
      Top = 15
      Width = 43
      Height = 23
      Caption = #1062#1080#1082#1083
      TabOrder = 1
      OnClick = cbCycledClick
    end
  end
  object gbAddr: TGroupBox
    Left = 8
    Top = 8
    Width = 193
    Height = 45
    Caption = #1040#1076#1088#1077#1089
    TabOrder = 5
    object edAddr: TEdit
      Left = 64
      Top = 15
      Width = 121
      Height = 21
      TabOrder = 0
      Text = '192.168.0.11:5000'
    end
    object seAddr: TSpinEdit
      Left = 8
      Top = 15
      Width = 50
      Height = 22
      MaxValue = 65535
      MinValue = 0
      TabOrder = 1
      Value = 9999
    end
  end
end

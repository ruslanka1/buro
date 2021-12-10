object DemoForm: TDemoForm
  Left = 1907
  Top = 207
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1058#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1077
  ClientHeight = 386
  ClientWidth = 560
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 20
    Top = 48
    Width = 34
    Height = 13
    Caption = #1040#1076#1088#1077#1089':'
  end
  object SpinEdit1: TSpinEdit
    Left = 68
    Top = 12
    Width = 73
    Height = 22
    MaxValue = 256
    MinValue = 1
    TabOrder = 0
    Value = 1
    OnChange = SpinEdit1Change
  end
  object SpinEdit2: TSpinEdit
    Left = 68
    Top = 44
    Width = 73
    Height = 22
    MaxValue = 65535
    MinValue = 0
    TabOrder = 1
    Value = 9999
  end
  object Memo1: TMemo
    Left = 8
    Top = 232
    Width = 541
    Height = 113
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object RadioButton1: TRadioButton
    Left = 8
    Top = 14
    Width = 53
    Height = 17
    Caption = 'COM:'
    Checked = True
    TabOrder = 3
    TabStop = True
    OnClick = RadioButton1Click
  end
  object RadioButton2: TRadioButton
    Left = 196
    Top = 14
    Width = 53
    Height = 17
    Caption = 'IP:'
    TabOrder = 4
  end
  object Edit1: TEdit
    Left = 256
    Top = 12
    Width = 121
    Height = 21
    TabOrder = 5
    Text = '192.168.0.11:5000'
  end
  object Button2: TButton
    Left = 232
    Top = 44
    Width = 85
    Height = 17
    Caption = #1059#1089#1090'. '#1074#1088#1077#1084#1103
    TabOrder = 6
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 336
    Top = 44
    Width = 85
    Height = 17
    Caption = #1057#1095#1080#1090'. '#1074#1088#1077#1084#1103
    TabOrder = 7
    OnClick = Button3Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 76
    Width = 113
    Height = 45
    Caption = ' '#1071#1088#1082#1086#1089#1090#1100' '
    TabOrder = 8
    object SpinEdit3: TSpinEdit
      Left = 8
      Top = 16
      Width = 53
      Height = 22
      MaxValue = 10
      MinValue = 1
      TabOrder = 0
      Value = 5
    end
    object Button4: TButton
      Left = 68
      Top = 20
      Width = 37
      Height = 17
      Caption = '->'
      TabOrder = 1
      OnClick = Button4Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 132
    Width = 541
    Height = 89
    Caption = ' '#1058#1077#1082#1089#1090' '
    TabOrder = 9
    object Label1: TLabel
      Left = 12
      Top = 20
      Width = 48
      Height = 13
      Caption = #1044#1080#1089#1087#1083#1077#1081':'
    end
    object Label3: TLabel
      Left = 12
      Top = 48
      Width = 37
      Height = 13
      Caption = #1064#1088#1080#1092#1090':'
    end
    object Label4: TLabel
      Left = 252
      Top = 48
      Width = 78
      Height = 13
      Caption = #1042#1099#1088#1072#1074#1085#1080#1074#1072#1085#1080#1077':'
    end
    object Label5: TLabel
      Left = 424
      Top = 48
      Width = 51
      Height = 13
      Caption = #1057#1082#1086#1088#1086#1089#1090#1100':'
    end
    object Label6: TLabel
      Left = 132
      Top = 20
      Width = 33
      Height = 13
      Caption = #1058#1077#1082#1089#1090':'
    end
    object Label7: TLabel
      Left = 132
      Top = 48
      Width = 28
      Height = 13
      Caption = #1062#1074#1077#1090':'
    end
    object SpinEdit4: TSpinEdit
      Left = 68
      Top = 16
      Width = 49
      Height = 22
      MaxValue = 5
      MinValue = 0
      TabOrder = 0
      Value = 5
      OnChange = SpinEdit4Change
    end
    object CheckBox1: TCheckBox
      Left = 16
      Top = 68
      Width = 97
      Height = 17
      Caption = #1044#1074#1086#1077#1090#1086#1095#1080#1077
      TabOrder = 1
    end
    object SpinEdit5: TSpinEdit
      Left = 68
      Top = 44
      Width = 49
      Height = 22
      MaxValue = 7
      MinValue = 0
      TabOrder = 2
      Value = 0
    end
    object ComboBox1: TComboBox
      Left = 336
      Top = 44
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
    object SpinEdit6: TSpinEdit
      Left = 484
      Top = 44
      Width = 49
      Height = 22
      MaxValue = 5
      MinValue = 0
      TabOrder = 4
      Value = 0
    end
    object Edit2: TEdit
      Left = 176
      Top = 16
      Width = 281
      Height = 21
      TabOrder = 5
      Text = '12345678'
    end
    object Button5: TButton
      Left = 468
      Top = 18
      Width = 65
      Height = 17
      Caption = #1042#1099#1074#1077#1089#1090#1080
      TabOrder = 6
      OnClick = Button5Click
    end
    object SpinEdit8: TSpinEdit
      Left = 168
      Top = 44
      Width = 49
      Height = 22
      MaxValue = 7
      MinValue = 0
      TabOrder = 7
      Value = 1
      OnChange = SpinEdit4Change
    end
  end
  object GroupBox3: TGroupBox
    Left = 160
    Top = 76
    Width = 185
    Height = 45
    Caption = ' '#1058#1077#1089#1090' '
    TabOrder = 10
    object SpinEdit7: TSpinEdit
      Left = 8
      Top = 16
      Width = 53
      Height = 22
      MaxValue = 5
      MinValue = 0
      TabOrder = 0
      Value = 0
    end
    object Button6: TButton
      Left = 140
      Top = 16
      Width = 37
      Height = 17
      Caption = '->'
      TabOrder = 1
      OnClick = Button6Click
    end
    object CheckBox2: TCheckBox
      Left = 68
      Top = 16
      Width = 61
      Height = 17
      Caption = #1062#1080#1082#1083
      TabOrder = 2
    end
  end
  object GroupBox4: TGroupBox
    Left = 372
    Top = 76
    Width = 177
    Height = 45
    Caption = ' '#1057#1074#1103#1079#1100' '
    TabOrder = 11
    object Button1: TButton
      Left = 100
      Top = 18
      Width = 65
      Height = 17
      Caption = #1058#1077#1089#1090
      TabOrder = 0
      OnClick = Button1Click
    end
    object CheckBox3: TCheckBox
      Left = 12
      Top = 18
      Width = 65
      Height = 17
      Caption = #1062#1080#1082#1083
      TabOrder = 1
      OnClick = CheckBox3Click
    end
  end
  object SpinEdit9: TSpinEdit
    Left = 404
    Top = 8
    Width = 53
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 12
    Value = 0
  end
  object Button7: TButton
    Left = 480
    Top = 12
    Width = 57
    Height = 21
    Caption = 'Button7'
    TabOrder = 13
    OnClick = Button7Click
  end
end

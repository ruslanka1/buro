object Main: TMain
  Left = 2184
  Top = 166
  Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103' '#1087#1086#1089#1077#1090#1080#1090#1077#1083#1103
  ClientHeight = 336
  ClientWidth = 701
  Color = clBtnFace
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
    Width = 701
    Height = 41
    Align = alTop
    TabOrder = 0
    DesignSize = (
      701
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
      Caption = #1055#1077#1095#1072#1090#1100
      TabOrder = 2
      OnClick = btnPrintClick
    end
    object btnSend: TButton
      Left = 251
      Top = 10
      Width = 75
      Height = 25
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
      TabOrder = 3
      OnClick = btnSendClick
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
    object stStatus: TStaticText
      Left = 332
      Top = 12
      Width = 320
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BorderStyle = sbsSunken
      TabOrder = 4
    end
  end
  object pcPGS: TPageControl
    Left = 0
    Top = 41
    Width = 701
    Height = 295
    ActivePage = tsPerson
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 353
    ExplicitHeight = 392
    object tsPerson: TTabSheet
      Caption = #1055#1086#1089#1077#1090#1080#1090#1077#1083#1100
      ExplicitLeft = 0
      ExplicitTop = 32
      ExplicitWidth = 550
      ExplicitHeight = 364
      object imgPerson: TImage
        Left = 0
        Top = 0
        Width = 128
        Height = 267
        Align = alClient
        Proportional = True
        Stretch = True
        ExplicitLeft = 10
        ExplicitTop = 18
        ExplicitWidth = 113
        ExplicitHeight = 105
      end
      object pnlPerson: TPanel
        Left = 128
        Top = 0
        Width = 565
        Height = 267
        Align = alRight
        TabOrder = 0
        ExplicitLeft = 129
        ExplicitHeight = 228
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
          Left = 246
          Top = 182
          Width = 43
          Height = 13
          Alignment = taRightJustify
          Caption = #1050#1086#1084#1085#1072#1090#1072
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
          Width = 130
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
          Left = 295
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
      end
    end
    object tsTurn: TTabSheet
      Caption = #1054#1095#1077#1088#1077#1076#1100
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object grdTurn: TDBGridEh
        Left = 0
        Top = 25
        Width = 693
        Height = 223
        Align = alClient
        FilterEditMode = False
        DataGrouping.GroupLevels = <>
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines, dghHideFilterDoApply, dghHighlightNull]
        RowDetailPanel.Color = clBtnFace
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object sbTurn: TStatusBar
        Left = 0
        Top = 248
        Width = 693
        Height = 19
        Panels = <
          item
            Width = 100
          end
          item
            Width = 50
          end>
      end
      object pnlTurn: TPanel
        Left = 0
        Top = 0
        Width = 693
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
      end
    end
  end
end

object Main: TMain
  Left = 899
  Height = 336
  Top = 166
  Width = 701
  Caption = 'Регистрация посетителя'
  ClientHeight = 336
  ClientWidth = 701
  Color = clBtnFace
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  OnClose = FormClose
  OnShow = FormShow
  LCLVersion = '1.6.0.4'
  object pnlTop: TPanel
    Left = 0
    Height = 41
    Top = 0
    Width = 701
    Align = alTop
    ClientHeight = 41
    ClientWidth = 701
    TabOrder = 0
    object btnNew: TButton
      Left = 8
      Height = 25
      Top = 9
      Width = 75
      Caption = 'Новый'
      OnClick = btnNewClick
      TabOrder = 0
    end
    object btnPrint: TButton
      Left = 170
      Height = 25
      Top = 10
      Width = 75
      Caption = 'Печать'
      OnClick = btnPrintClick
      TabOrder = 2
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
      end
      object pnlPerson: TPanel
        Left = 134
        Height = 272
        Top = 0
        Width = 565
        Align = alRight
        ClientHeight = 272
        ClientWidth = 565
        TabOrder = 0
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
          TabOrder = 2
        end
        object edFNAME: TEdit
          Left = 396
          Height = 25
          Top = 44
          Width = 124
          TabOrder = 3
        end
        object edSNAME: TEdit
          Left = 101
          Height = 25
          Top = 71
          Width = 130
          TabOrder = 4
        end
        object edSEX: TEdit
          Left = 261
          Height = 25
          Top = 71
          Width = 40
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
          ReadOnly = True
          TabOrder = 13
        end
        object edDOCSER: TEdit
          Left = 101
          Height = 25
          Top = 17
          Width = 130
          TabOrder = 0
        end
        object edDOCNUM: TEdit
          Left = 295
          Height = 25
          Top = 17
          Width = 225
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
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
      end
      object sbTurn: TStatusBar
        Left = 0
        Height = 19
        Top = 248
        Width = 693
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
        Height = 25
        Top = 0
        Width = 693
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
      end
    end
  end
end

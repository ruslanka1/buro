object Main: TMain
  Left = 1357
  Top = 121
  Caption = #1055#1088#1086#1087#1091#1089#1082#1085#1086#1081' '#1087#1091#1085#1082#1090
  ClientHeight = 679
  ClientWidth = 1008
  Color = clBtnFace
  Constraints.MinHeight = 718
  Constraints.MinWidth = 1024
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 1008
    Height = 50
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 1050
    DesignSize = (
      1008
      50)
    object btnScan: TButton
      Left = 8
      Top = 9
      Width = 100
      Height = 30
      Caption = #1055#1088#1086#1087#1091#1089#1082
      TabOrder = 0
      TabStop = False
      OnClick = btnScanClick
    end
    object stStatus: TPanel
      Left = 220
      Top = 9
      Width = 771
      Height = 30
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
      TabOrder = 2
      ExplicitWidth = 813
    end
    object edCode: TEdit
      Left = 114
      Top = 9
      Width = 100
      Height = 31
      Alignment = taCenter
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Text = '555555'
      OnKeyPress = edCodeKeyPress
    end
  end
  object pnlDetails: TPanel
    Left = 0
    Top = 50
    Width = 1008
    Height = 629
    Align = alClient
    Enabled = False
    TabOrder = 1
    ExplicitTop = 41
    ExplicitWidth = 714
    ExplicitHeight = 250
    object pnlPerson: TPanel
      Left = 457
      Top = 1
      Width = 550
      Height = 627
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 442
      ExplicitHeight = 713
      object lblLNAME: TLabel
        Left = 53
        Top = 204
        Width = 65
        Height = 19
        Alignment = taRightJustify
        Caption = #1060#1072#1084#1080#1083#1080#1103
      end
      object lblFNAME: TLabel
        Left = 89
        Top = 240
        Width = 29
        Height = 19
        Alignment = taRightJustify
        Caption = #1048#1084#1103
      end
      object lblSNAME: TLabel
        Left = 49
        Top = 276
        Width = 69
        Height = 19
        Alignment = taRightJustify
        Caption = #1054#1090#1095#1077#1089#1090#1074#1086
      end
      object lblSEX: TLabel
        Left = 89
        Top = 312
        Width = 29
        Height = 19
        Alignment = taRightJustify
        Caption = #1055#1086#1083
      end
      object lblBDATE: TLabel
        Left = 275
        Top = 312
        Width = 113
        Height = 19
        Alignment = taRightJustify
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
      end
      object lblBPLACE: TLabel
        Left = 25
        Top = 346
        Width = 93
        Height = 19
        Alignment = taRightJustify
        Caption = #1052#1077#1089#1090#1086' '#1088#1086#1078#1076'.'
      end
      object lblWhDOC: TLabel
        Left = 31
        Top = 88
        Width = 87
        Height = 19
        Alignment = taRightJustify
        Caption = #1050#1077#1084' '#1074#1099#1076#1072#1085#1086
      end
      object lblDTDOC: TLabel
        Left = 24
        Top = 168
        Width = 94
        Height = 19
        Alignment = taRightJustify
        Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
      end
      object lblCODEDOC: TLabel
        Left = 275
        Top = 168
        Width = 144
        Height = 19
        Alignment = taRightJustify
        Caption = #1050#1086#1076' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
      end
      object lblMAIL: TLabel
        Left = 12
        Top = 551
        Width = 106
        Height = 19
        Alignment = taRightJustify
        Caption = #1055#1086#1095#1090#1072' (e-mail)'
      end
      object lblOLD: TLabel
        Left = 429
        Top = 551
        Width = 57
        Height = 19
        Alignment = taRightJustify
        Caption = #1042#1086#1079#1088#1072#1089#1090
      end
      object lblROOM: TLabel
        Left = 186
        Top = 423
        Width = 61
        Height = 19
        Alignment = taRightJustify
        Caption = #1050#1072#1073#1080#1085#1077#1090
      end
      object lblTicket: TLabel
        Left = 73
        Top = 423
        Width = 45
        Height = 19
        Alignment = taRightJustify
        Caption = #1058#1072#1083#1086#1085
      end
      object lblDOCSER: TLabel
        Left = 74
        Top = 52
        Width = 44
        Height = 19
        Alignment = taRightJustify
        Caption = #1057#1077#1088#1080#1103
      end
      object lblDOCNUM: TLabel
        Left = 273
        Top = 52
        Width = 47
        Height = 19
        Alignment = taRightJustify
        Caption = #1053#1086#1084#1077#1088
      end
      object lblGOAL: TLabel
        Left = 28
        Top = 515
        Width = 90
        Height = 19
        Alignment = taRightJustify
        Caption = #1062#1077#1083#1100' '#1074#1080#1079#1080#1090#1072
      end
      object lblEvaOrg: TLabel
        Left = 5
        Top = 459
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
      object lblDoc: TLabel
        Left = 47
        Top = 16
        Width = 71
        Height = 19
        Alignment = taRightJustify
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090
      end
      object lblTime: TLabel
        Left = 392
        Top = 423
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
      object lblInTime: TLabel
        Left = 27
        Top = 387
        Width = 91
        Height = 19
        Alignment = taRightJustify
        Caption = #1042#1088#1103#1084#1103' '#1074#1093#1086#1076#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edLNAME: TEdit
        Left = 124
        Top = 201
        Width = 410
        Height = 30
        Color = clCream
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object edFNAME: TEdit
        Left = 124
        Top = 237
        Width = 410
        Height = 30
        Color = clCream
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
      end
      object edSNAME: TEdit
        Left = 124
        Top = 273
        Width = 410
        Height = 30
        Color = clCream
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
      end
      object edSEX: TEdit
        Left = 124
        Top = 309
        Width = 130
        Height = 30
        Color = clCream
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
      end
      object edBPLACE: TEdit
        Left = 124
        Top = 345
        Width = 410
        Height = 30
        Color = clCream
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 11
      end
      object edInfo: TEdit
        Left = 124
        Top = 584
        Width = 410
        Height = 30
        Color = clBtnFace
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 20
        Text = #1057#1077#1075#1086#1076#1085#1103':'
      end
      object edCODEDOC: TEdit
        Left = 425
        Top = 165
        Width = 109
        Height = 30
        Color = clCream
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object edMAIL: TEdit
        Left = 124
        Top = 548
        Width = 299
        Height = 30
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 18
      end
      object edOLD: TEdit
        Left = 492
        Top = 548
        Width = 42
        Height = 30
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 19
      end
      object edBDATE: TDBDateTimeEditEh
        Left = 396
        Top = 309
        Width = 138
        Height = 27
        Color = clCream
        EditButtons = <>
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Kind = dtkDateEh
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
        Visible = True
      end
      object edDTDOC: TDBDateTimeEditEh
        Left = 124
        Top = 165
        Width = 140
        Height = 27
        Color = clCream
        EditButtons = <>
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Kind = dtkDateEh
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        Visible = True
      end
      object edROOM: TEdit
        Left = 253
        Top = 420
        Width = 133
        Height = 30
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 14
      end
      object edTicket: TEdit
        Left = 124
        Top = 420
        Width = 45
        Height = 30
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 13
      end
      object edDOCSER: TEdit
        Left = 124
        Top = 49
        Width = 130
        Height = 30
        Color = clCream
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object edDOCNUM: TEdit
        Left = 326
        Top = 49
        Width = 208
        Height = 30
        Color = clCream
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object edGOAL: TEdit
        Left = 124
        Top = 512
        Width = 410
        Height = 30
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 17
      end
      object mmOrg: TMemo
        Left = 124
        Top = 456
        Width = 410
        Height = 50
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 16
      end
      object edDoc: TEdit
        Left = 124
        Top = 13
        Width = 410
        Height = 30
        Color = clCream
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object mmWhDOC: TMemo
        Left = 124
        Top = 85
        Width = 410
        Height = 74
        Color = clCream
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object edTime: TEdit
        Left = 465
        Top = 420
        Width = 69
        Height = 30
        TabStop = False
        Alignment = taCenter
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 15
        Text = '00:00'
      end
      object edInTime: TEdit
        Left = 124
        Top = 384
        Width = 140
        Height = 30
        TabStop = False
        Alignment = taCenter
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
        Text = '00:00'
      end
    end
    object pnlImg: TPanel
      Left = 1
      Top = 1
      Width = 456
      Height = 627
      Align = alClient
      TabOrder = 1
      ExplicitLeft = 8
      ExplicitTop = 170
      ExplicitWidth = 465
      ExplicitHeight = 455
      object imgPerson: TImage
        Left = 1
        Top = 1
        Width = 454
        Height = 625
        Align = alClient
        Picture.Data = {
          0A544A504547496D61676513190000FFD8FFE000104A46494600010101006000
          600000FFDB004300020101020101020202020202020203050303030303060404
          0305070607070706070708090B0908080A0807070A0D0A0A0B0C0C0C0C07090E
          0F0D0C0E0B0C0C0CFFDB004301020202030303060303060C0807080C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0CFFC0001108005A005A03012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FDFC
          A2B0FC47F127C3FE0DBA8EDF56D7349D36E255DE90DC5DA4723AF4C8527247B8
          158FADFC7DF0C58582B586ADA7EB57F3B886D74FB2BB8E4B9BA95BEEA05DDF2F
          A966C000124D7156CCB0B4AEAA548A6B75757FBB7BF96E6D0C3D59DB962F5F23
          A8D775FB1F0CE91717FA85DDBD8D95AAEF96799C471C63DC9E2B931F1035FF00
          192FFC531A1AC766791A96B45EDA1907AC7081E6BFD58460F626B375BF09EA9A
          7E8579E2BD6A1B7D7BC49A6C0F73A7E9EBB8D869ACA38112F57900CE6561BCF2
          176038AF18B1D735AF1E78A63FECBD6352F10788AE3ECFA8E9B736F70D1DA583
          9E678668D8ED5551C719E028FE222BE433EE26AD85AB4E8B84973ED156E76BD5
          A7ABD94629B4F979A70B9EB6072E8548CA49A7CBBB7B7E9A2EEDDB7B2763D23C
          55E28D52DFC4D79A3DEEBDE2CD4B52B4852E26B6D02CAD74FB5891BA132CC59C
          0E719F33AD5BF8A76163F0CBC2F67A935F78CF5492F2E52DA348FC413A331646
          7C8C1DA7014F6E6B86FDA9FC7DF0F7C1BE365D77C4DE3AF03E871AD80D3EE23D
          462178524DCCC0A20200703206791CF15E570FFC14E3F66AD2F45F09E8727C4A
          96EA1F09DD7DA12416BFBBBA6C30C37A2E1CE315E0E233270AD89C3D59C6F7B4
          2529C656F797D99394AFCADB7CCED78E8B53DDCBF20CC3194A15B0587A9517DA
          E4A726B6EF156DFB6BAEBB1EF2BE3CB5D3353D02CF4DF1878CA3BCF10436F3C3
          14F1DBEA36F0F9C708B29750E3383F7587009CD774DE25F1878418B6ADA3D9F8
          86C47DEB9D1331DCA0F536D2B1DC3D7648CDE8A7A57CF7FB3E7C5BF837E3FD4B
          416F0AFC51F0EEB0FA6EA46FEE12793CA99D163F2E08C0270A1327AF52DDB815
          DAF8B6D6CF51F899AF4DE289F59D3759D42E22B5F0CDD5A452C9143174492268
          CE1B2482C0FA9E3D2B039D62A9E1FDB4E4B99C925CB517245725DF337CF04DBF
          752B46F2D134B538B1B96BA75FD85584A2D2D54A0D4AF7B6D68CB45AF5D3A5F4
          3DC7C21E37D2FC75A635DE97791DD451B98E5500AC9038EA922300C8C3FBAC01
          AD60735E51F125749F04B68373AA6AD73A4F8B25856DD75EB7B43E54C500056E
          401B1E22C47CAC72339054FCC3AFF01F8FA4D7AE2E34BD52DE1B0F1058A09268
          237DF0DCC4785B8818F2F137E6A7E56EC4FDF60F3652ADF54C434AA2B6CFAB57
          49ABBE595B5B36D35AC652B3B7CFD6C2DA1ED69DF97CFEEBADAEBCF4F34B4BF5
          1451457B4719F187C5FF00F82A4FC10FD807C51E28D0FC6DAB5D7FC26175ADDD
          5DCDA6E95A6BDD5FC90C8FBE1791B850BB480BBDC70000302B8CF0E7FC1C2DFB
          2DFC58B85D3B5F6F1368F6D21C6FD7BC39E6DBFE2626971F88AF827FE0BE1E00
          D35FFE0A57E24BCBCB8BE1F6BD234E716F6D1A827F7382CD23703D000ADD39C7
          19F8E4F833C3330C15F115BFFB62E209BFF1D31A7F3AF5F27CCBC33C3E5F4F07
          9BE3AB2AF66A6A306E1095DA6BF852BF9D9CAFE5B1F5543C2BF13B358FF6A64D
          9742587959C1CAA42329AB6E94AAC5AF2BA5E5747F4B5F03BC79F0AFE3D682BA
          87C2FF001C586A1678CE340D6BCC587D9ADD8B04FA320AEA35FF00824BE26D1B
          FB2EEB5FD7134B662D25BD9886CFCFCF50ED146A483DC743DF35FCBCDB7C2E5B
          3D4A3BEF0EF8A2DADEF21E63FB58934BBC43FECC8A5E2FC7CD07D857A668DF1F
          7F69DD1F4A163A4FC46F89D7164A3005878A5EEA351FEF24CD8FCEBD8C3F87BC
          259B47FE11B39C3CE0FECCE4E8C92ECE1CD77E778C53EC7CA66D4F8C3239F2E7
          5946229497DAE4738B7E534B97D2D27EA7E8F7FC1C3FF0B340F851FB3A7C2FD3
          F41D3E1B185FC4D33CB8F99A43F639B0589E7D6BF2AA0F0EEA575A0CFAA47A76
          A126976B2AC33DEA5B3B5B40EDF751E4036AB1EC0906BD0755B7F174DFB2D6AD
          A878D2FB54D4358D43C79645A7D4B51FB6DDB05D32F7EF92ECCBD780D8F6AFB4
          BFE0955F112E2FBF622F16781FC4BA478775EF0EF88B5DB9D37C29A4DFC336DD
          67515B29351BB8A611C89E74616DA255079124AA338E2BF9B38DF87F09977116
          232BC1D584A9D3B28CA9A5C8DFB38BB2E56FED371BABEBBA4F45FDBBE1671863
          729F0CF0B9BD6C349CFDAC94A136E33517525792BAD5A8AE6B3B2E5BCAF65AF0
          9FF046CFD99EC7C6AFE34F89D36A7717175E14824D1A2D16C6DD2698ADC405DA
          EA7DC41481766D05413BB3D85763FB1F7FC14CBC7DFB35EB7A5E97712EA5E24F
          0CDE4703FF0064DE0F32F2DBCD447F2D7B9906EC638248FF0080D7D61FB2078F
          7F654F1AFC43F1A5BFC0AF0CE8B6BE2AD0FC16FA83EB1A7D84B6A278660CB2C0
          AB21DD94610EE04100BA8C920D7E66FC3AD0BC4525E6A96FA9F8A34D327F662C
          705DDBDA59C6D6B7B2BA43324F1B40CCD0C6B24ACCE0AEF54183962ABF53C16F
          0B95D1C455C461658C84A16FDCABF24D49F24DD5B7353B2E68DA29C669EBCDA2
          7F80F8C186C6718E7D1AFF005E86575E13A6E31C5B94272A2E3EFD285149C2B6
          B28D56E6E338D972D939497EC9785AEF54F8FBE1BBAD4FC0FA917D17C53742EE
          E85E5C34571A4B491949629213F2C91B21CAE06460742323D7B51F8562D7C17A
          3D9E9372D0EADE19897FB2EF26393BC2E0A498E4C720F959476C11CA823F23FF
          0060CFDAE2EFF63EF8F3A1E972395F06EA30C763736E58615A5959E49380AA08
          B86994855555DA00002F3FB3B657916A16714F03AC90CE8248DC74752320FE55
          ECE0F845E0A11AB8D5796229C2A45A95E3C93F7D72BB2B4A32F8BAA928B568B8
          25F94D4E20C362B1789C260A4DAC2D6A946578F2CB9A9C9C6EE3796924AEB57A
          5D36DA9328F81FC591F8D7C3906A091496CEC5A29EDE4FBF6D323149236F7565
          233DF823835AF5C7DA8FF844BE2CC8ABF2D9F8AA13363B2DE40AA1BF178707FE
          D81F5AEBF77B1AF5B035A73A6E157E38BE57E6D6CFCB99352B74BDBA135A094A
          F1D9EABFCBE4F43E2EFDA3BFE093DE09FDB7BF6BAD77C73E34D4355163A5DB5A
          6911E9D652793F687489646777EBD250B81E86B2BE347FC11C7F669F859F06FC
          41AF5C7836E562D0EC25BB697FB4A50E76293C9C8FE95F5FFC3F07FB43C4DBBE
          F1D664CFFDF9871FA62BCB3FE0A6E665FD817E2B7D9F3E67FC23F71D3D369CD7
          C763322CBD65F89C74A92751AAB2BBBBB3BC9AB6B656F2B1F7D93F1871054C5E
          132BA58EAB4E9274E11519CA2926D2D145AEEDDF73F9F88B5FF873E2A4592EB4
          1F14784DE4F9B3A4DE26A90283C8FDCDC947E075C4E7D857E9C7EC81FF0004CB
          FD983E2A7FC135CF8C35A6B7D62F6EB4FBBBCD4BC597172F6B75A34D197F97CA
          121487CB017F76DBB7772C1857E48C08D298D23479249084448D4B33B1E00007
          24938000EB5FAC9FF04B2FD8C3C69FB286A737827E2ED9D8DA7863F690D06F6C
          868C9297BAB1BAB6883AC739C6D4964B596E480A5B69840273C0FCEB8769C5E2
          5C674D4E325CBEF5DA8B96916DF4F7ACAF7EAEDAA3FB13C6894F0194539E0B30
          A987A919A9C6119B73A9186B5126DF3FB91BCF59385D24D5DA3F3A7C6961A2FC
          3AFD997FB023F18784BC49AADEF8A60D5CC5A1C9732ADBDBC7617113348D2C11
          2825E450154B1EBE95E99F1D7E2CDE7EC77E26F807E15D36448B54F83B656BE2
          ED563C8064D5F50952FA68D8772B6DF678483E847D4FDBC749F801F06BC4B6BA
          1FC1DD1FE21691E3AF07F88A4B7D763F15B09EDCAC1B80541BD95B32AA939037
          29F435F72FC24FF82BC7ECB7F19742B7D43C71F0B61B5F885A86D17D690F8422
          D59B52BAC63FD1E5456693760603ED61D0F4CD6783C0D39549D1A95A306ADABB
          D9F57AA5A34EDF8D85C419E637EAB85CD2865B5F17426EACA516A319A94A2A11
          938C5497B374E552CD5D6A9B6B4BF8F7EC51E08B6F82FF00F0582F88D61E1F60
          BE19F11F82756D7F472BF726D36F60B7BDB7C1F452FB78EF1915C968FF00B6B5
          9786BF619B8F899AB7C2EF8631EB1E26F1547E1BD06CC59B08AE6282DDA6BEB9
          9327710A5D22041EB2303D6BEB1FD96FC31E33FDB4BF6C9BBF8B5A6F806DFE18
          FC2DF0B785352F03683A76AB6BF60D5E679563612496EABF2C796E30C5555703
          2735CAFECBDF1BB49FD843E15DB7C1BFDA6BE143CFFF000ACE23F61F1869BE18
          3AE684F6B7044A3CC984598E505C2B36DC36D5DC430E7D9A3849C29A6AA3A74A
          529A52F7941FC36BDADDA4E2DAD1ABE8F6FC9330C460731C4AA98FC147198BA3
          0C329D3538BAB68AAAAA28B5F14A4FD8AAB18DDA5271D756BC2FC7FF00B6FD9A
          7EC6DF0E7E2A691F097E156A526A5AC6A3E16F114171A7168F4FBF89DEE6DFCB
          20E76CD6EE5CEEE7729F526BF4B3FE097DFB40BFED2FFB17F857C4D3410DADD4
          A26826B7898B470324CEA514B1276A9054679C015F9A7FF054CFF82A07C2DF8E
          7F061BE17FC19F09DBE9FA2EA1A8C3A86B1ABB68D169F1CE62C944822003EE2D
          80D2B2A90A0A8C86247D83FF0006F1B4CDFB040F333E58D76F8459F4F3DF38FF
          008166BD3E1FC54A19DD3A10ACEA4795C776E3F0DDF2A7DDC55DF5773C7F1078
          330785E0BFEDA7977D4EBCF12EC9BF7DD397B47153DB58B7CB1BAE6E58A6F56C
          FB23E2920B6D274DD43F8B4AD56D6E33FDD569042FFF008E4AD5D4E73DAB97F8
          C633F0BF59DBF7BECF95FA8618FD715D2D8963650EEFBDB1739F5C57E9549DB1
          B522BAC60FE7792FC92FB8FE7296B462FCDFE873DE1D6363E3CF11DA363FD20D
          BEA118FF0065A3111FFC7A1CFE22AAFC73F0043F153E0E789BC3970A64875AD3
          67B56503248642303DEADF8B3FE243E26D2B58C7EE493A75D9FEEA4A418DCFFB
          B2051F490D740BD7DEB1A7878D5A55B055366E4BFEDD9DDDFF0016BD5334F6D2
          A752188A7A3566BC9C7FE1933F0ABFE09CFF00B2BF87FE007EDADE1BD73E2A78
          DBC076BA1F831EE27945C5F984477B12EC80C9E6AAAAE2421864FDE0A2BA4F8B
          1E2CF1F7C41FF82865AFC6C93E23781265F0CEB8B3E8BA65C6AD24696BA746E5
          45A8010AAF99116DEC3396909E78AF48FF0082CB7EC5917857C6F79E3ED26DD6
          5F08F8B81B5D5DAD479BF60BA0768948E98DCAA08C81B940382C6BE1287C491F
          876D6DEC7C51BB4DBD8631145A9081E6B0D4A3518570E80B0700007E539C73B1
          B20FCEE178172EA2B0D4F32CC25470B55397B654D351C446C9D19D9DA2A2973D
          393B73466A5B376FD3E5E2BF19F102C766393E0E9E2F35A37A32C2BB294F0534
          DAAF422D5E6DCDCA9D68C2F283496DBFE807ED17FB7CFC3CF0D78CB49D4B5AFD
          977E1FF8FF005FF1ECF235BCFA65D47A85D6A132945E4BD98691DB7281B724E3
          15E59FF053DB4B4FD89BF6B5F83FF1EBE0EE99E1FD1345F1568515FE996D158A
          2E9FF688D36B8312E17F7905C479DA4364139079AF69FD90BE0FFC30F875F033
          E16FED1DF143C5DA5DBF86FC13A7DE4DE1EB50594DE5E3CA50481182BC922F94
          E238941259B71FBA2BC2FC5FFF000590F02EBDFB255CFC396F83F26B575FF139
          B2D2AE356B88445A0D8DDCB3FD9FCA701E4F3A3824443B4201B30188E6BE371F
          0F67ED69E26BC65EF4DD29A8C54A4A33F726F915D2A907757EA933F54F0E638F
          C443075B0596D4938C1D2C6529549285EA29A952B56938AF61CB0E6E55BB717A
          D8EBFF00673FF82D9FED1DFB4B7C4F8FC29A45AFC22D3EFA4B49EF04FA8E9D7A
          B0048802C098E566C9CF1C638E48AF42F8B5FB567ED01F1BFE147883C237DF13
          3F657D3B4FF13584BA6DD5C5ADD5DF9E90CA8524D9BCB202549192A719C8E6BE
          19FF008252A94FDAE6DD59B711E1DD4813EBFBB4AC3B5854DB47F2AFDD1DABF4
          3F09F82315C6BF5D86271F5292A2A9AB2F7B9BDA7B4BDEED6DC9F8B3F21FA527
          1FE0FC2ECFF0586C8F2BA138D5839FBD1D6328496AB7BDEFB3EDE676D07FC12A
          B549235C7C66F8168A38F9B5F9B8FF00C855FB15FF0004B9FD9E25FD987F62FF
          000B7856E6E6D2F2F613713DC5CDAEEF26E1E49DDCBA6E01B692C4824038C715
          F987FF0004E6FD8EAEFF006B0F8F1649359FFC52FE1F952F3559D93F7726D20A
          C00E392DC123FBA307EF0CFEDE595947A6D9436F0A88E1810468A3B28E057B19
          8787197F0D673EC709899579423EFDE2A2A3295AC959BBBE5BB92E8A51DEEEDF
          1347C7CE2BF10F234F3DA50A747DA2941456B271528B93D16976D2EED4BB230F
          E257FA568B6963DF52D42DADF1EAA24123FF00E388D5D27978AE6F6FFC243F11
          635E4DBF87E22EDE86E665C0FF00BE62DDFF007F4574D8A30AF9EB54ADD2EA2B
          D237BFFE4CE4BE47975348C63F3FBFFE024CAFAB6970EB5A6CF69731896DEE63
          31C887F894F07FFD75C9DC5B5F6BFE1BD43C37717D716FAC5BC585B847F28DF4
          59F95F7004A86FBAE57E6539C6320D769599E24F0F2EBB1C6F1C8D6B7D6A4BDB
          5CA0CB44DDC11FC4A7A153C1FA8044E3F0AEA2E782BBB34D5EDCD17BABF75BC5
          BEB75749B63A352CECFD5793FEB7FF0080786782F41B0D3ED6F3C0BE36FEC58F
          C3FAA5B4CA74F9E058C4CE5B0F70C5DBE54724A206E5C0076A8073F097ED99FF
          00049EF1A7ECFF00A95E6B1F0E5750F10784A67DED630333DE5975E36FFCB551
          D01E5C703E6EB5FA6DE21F0DE9FE3CBA8ADF56B2B4B1F1259FEF6D6478FCC866
          755608EBD3CD8D4B6EF2DB904723B9C6D220F1A7C398AD74FF00321D6EDE6BE3
          6B07DAC10BF6658DE492E279D4314666E00208C0000E49AF338573CC770DC9D3
          C2AF6941DA2D35CF1695AD0AB4DB4EE9BF75C6D28EDAA934FCEE2AE18C0F1042
          2F13785686B19C5F2CE2DEEE125D1F54EE9EFBA4D7E13FEDBEF7527C26F846B7
          FF0068FB5DBDA5F2347382B2447CC8C11B4F2A7DB02BE75AFE8A3E227C2BF81B
          FB5AE9B0B78E3C0FA75E61A2F265BFB75DD1899646465923625032C2C49254F0
          B9EA2BCBEC7FE08CFF00B25F89FC451DB59F86F7DE4D18B85B48B5FD41731950
          E0ECF38705594FD08AFCCF1B9254C762EAE330B3A6E35AA4E71519256E79CA4A
          294945E97B2D3A6C7F61F865E36651C35C3584C8732A35E5530F0E573518C94A
          CDBE6779A69BBDDEFAF53F2CFF00E0956E07ED7D0E48FF00917B53FF00D1695E
          E3FB1D7FC132FE20FED457B6771756375E16F0AE15A6D46F6131C932FA431919
          248E8CC02E391BBA57E817C09FD9D7E00FECF3AE6AB75E15F85B6FA4DD6930C8
          8F7EDB67B82567480C6D2348CC9B99948DEC015049E057B3C3E3ED63C65736D6
          FA4E977D63A3DCC725AB341146C639848F0CB99836C8C4780EACA1B7F4183C57
          DDF873C558BE19A18BA382A9173C4FB3D629CA5150735749A514DB9EEF9969A4
          5B6ADFCF5F481A394F88FC4185CDAB529C28E1E0E3CB2715CEE4D4BDE716DA5A
          6C9A7DE492D79BF08F85BC27FB1AFC3FD2FC09E0DB4782E66E1A48A037134790
          E5AE9D3ACD864F9803919CFA03D87C3AD0F50F847E018ED6FAE24D4357BE9DD6
          DAC96732C2B29772046CC03842B866DD9DB86A77863C1B6BF0D6C6CE1BE6B7D6
          B5681F769D05ADA2C2623B363BA2E4952FCB492336093DB815D5787BC3B3477A
          DA96A4F1CDA94AA630109F2AD63EBE5C79FA64B1E58FA0000D70D471788C53C4
          D66D55D5257BFB352B39393BB53A926AF7776EFCD2E897CDDA850A11A1452505
          6D9593B69151565CB14B4B2D16CBCE7F0A787FFE11CD2121693CFB8919A6B99B
          1833CAC72CDF99C01D8003B569D1457D651A51A5054E1B2D11C329393E661463
          9A28AD092AEADA35AEBB64D6F770A4D131CE1BF84F620F5047A8E6B16FBC37A8
          C1A7CD6B14F1EAB61708D13DB5EB9493630C10265193C1C7CC09FF006ABA4A2B
          92BE0E9557CCF496D75A3B767D1AF269AF2348D59474E9FD7DDF23CD75FF0087
          BA46ADA35B6973687A868FA6C53C735D5B5A5A472A5EF978DA1DD033F6C12304
          8241EB4697E14D134AF1C2EBEBA86B66FF00ED13CF2C725B4C6391644D9B026C
          F942AAC4011DA31EA6BD2A8AF29F0FD2E755172DD34D371D538FC36E59452B6B
          6B2EAFBBBF47D727CBCBAF5EBDF7DD37AFAF6EC8E474B1A5E9B06A115868DA9D
          C47AADC3DD5D46D6CFE5CD2380189F38850080381C7B55DB5B0D5AE6DE38628E
          CF41B38C0544855669947A018F2D3F00D5D0D15DD0CBECAD2959768A515DFA7B
          CB5D749194AB75B7DFAFFC0FC0A1A27872D741121863669A6E659E56324B31FF
          00698F27E9D07602AF81814515DD4E9429C7929AB2EC8CA52727761451456849
          FFD9}
        Proportional = True
        Stretch = True
        ExplicitLeft = 0
        ExplicitTop = 6
        ExplicitWidth = 498
        ExplicitHeight = 627
      end
      object lblMarker1: TLabel
        Left = 44
        Top = 17
        Width = 58
        Height = 33
        Caption = 'Test'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object lblMarker2: TLabel
        Left = 44
        Top = 42
        Width = 58
        Height = 33
        Caption = 'Test'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object lblMarker3: TLabel
        Left = 44
        Top = 67
        Width = 58
        Height = 33
        Caption = 'Test'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clFuchsia
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object lblMarker4: TLabel
        Left = 44
        Top = 92
        Width = 58
        Height = 33
        Caption = 'Test'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object lblMarker5: TLabel
        Left = 44
        Top = 131
        Width = 58
        Height = 33
        Caption = 'Test'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object pnlMarker: TPanel
        Left = 415
        Top = 5
        Width = 35
        Height = 44
        Color = clCream
        ParentBackground = False
        TabOrder = 0
      end
    end
  end
  object tmRefresh: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = tmRefreshTimer
    Left = 20
    Top = 64
  end
end

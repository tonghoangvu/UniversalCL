object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Test UCL controls'
  ClientHeight = 681
  ClientWidth = 1074
  Color = clWhite
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  StyleElements = []
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object symbolbuttonSaveVert: TUSymbolButton
    Left = 60
    Top = 430
    Width = 61
    Height = 91
    ThemeManager = UThemeManager1
    SymbolFont.Charset = DEFAULT_CHARSET
    SymbolFont.Color = clWindowText
    SymbolFont.Height = -16
    SymbolFont.Name = 'Segoe MDL2 Assets'
    SymbolFont.Style = []
    TextFont.Charset = DEFAULT_CHARSET
    TextFont.Color = clWindowText
    TextFont.Height = -13
    TextFont.Name = 'Segoe UI'
    TextFont.Style = []
    DetailFont.Charset = DEFAULT_CHARSET
    DetailFont.Color = clWindowText
    DetailFont.Height = -13
    DetailFont.Name = 'Segoe UI'
    DetailFont.Style = []
    Orientation = oVertical
    SymbolChar = #57615
    Text = 'Save'
    Detail = 'Ctrl+S'
  end
  object symbolbuttonSaveHorz: TUSymbolButton
    Left = 130
    Top = 480
    Width = 241
    Height = 41
    Hint = 'This is mini hint'
    ThemeManager = UThemeManager1
    SymbolFont.Charset = DEFAULT_CHARSET
    SymbolFont.Color = clWindowText
    SymbolFont.Height = -16
    SymbolFont.Name = 'Segoe MDL2 Assets'
    SymbolFont.Style = []
    TextFont.Charset = DEFAULT_CHARSET
    TextFont.Color = clWindowText
    TextFont.Height = -13
    TextFont.Name = 'Segoe UI'
    TextFont.Style = []
    DetailFont.Charset = DEFAULT_CHARSET
    DetailFont.Color = clWindowText
    DetailFont.Height = -13
    DetailFont.Name = 'Segoe UI'
    DetailFont.Style = []
    SymbolChar = #57605
    Text = 'Save file'
    Detail = 'Ctrl+S'
    ParentShowHint = False
    ShowHint = True
  end
  object symbolButtonOpenDisabled: TUSymbolButton
    Left = 130
    Top = 430
    Width = 241
    Height = 41
    ThemeManager = UThemeManager1
    SymbolFont.Charset = DEFAULT_CHARSET
    SymbolFont.Color = clWindowText
    SymbolFont.Height = -16
    SymbolFont.Name = 'Segoe MDL2 Assets'
    SymbolFont.Style = []
    TextFont.Charset = DEFAULT_CHARSET
    TextFont.Color = clWindowText
    TextFont.Height = -13
    TextFont.Name = 'Segoe UI'
    TextFont.Style = []
    DetailFont.Charset = DEFAULT_CHARSET
    DetailFont.Color = clWindowText
    DetailFont.Height = -13
    DetailFont.Name = 'Segoe UI'
    DetailFont.Style = []
    ButtonState = bsDisabled
    Enabled = False
    SymbolChar = #60739
    Text = 'Open file (disabled)'
    Detail = 'Ctrl+O'
  end
  object textTitle: TUText
    Left = 60
    Top = 40
    Width = 186
    Height = 38
    Caption = 'This is title text'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -28
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    ThemeManager = UThemeManager1
    TextKind = tkTitle
  end
  object textHeading: TUText
    Left = 60
    Top = 80
    Width = 166
    Height = 28
    Caption = 'This is heading text'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ThemeManager = UThemeManager1
    TextKind = tkHeading
  end
  object textEntry: TUText
    Left = 60
    Top = 120
    Width = 74
    Height = 17
    Caption = 'This is entry'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI Semibold'
    Font.Style = []
    ParentFont = False
    ThemeManager = UThemeManager1
    TextKind = tkEntry
  end
  object textNormal: TUText
    Left = 60
    Top = 150
    Width = 106
    Height = 17
    Caption = 'This is normal text'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ThemeManager = UThemeManager1
  end
  object textDescription: TUText
    Left = 60
    Top = 180
    Width = 105
    Height = 17
    Caption = 'This is description'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 6710886
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ThemeManager = UThemeManager1
    TextKind = tkDescription
  end
  object linkConnected: TUHyperLink
    Left = 60
    Top = 210
    Width = 146
    Height = 17
    Cursor = crHandPoint
    Caption = 'Embarcadero homepage'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 14120960
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ThemeManager = UThemeManager1
    URL = 'https://embarcadero.com/'
  end
  object linkCustomColor: TUHyperLink
    Left = 60
    Top = 240
    Width = 161
    Height = 17
    Cursor = crHandPoint
    Caption = 'TUHyperLink (custom color)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 8951296
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    URL = 'https://embarcadero.com/'
  end
  object linkDisabled: TUHyperLink
    Left = 60
    Top = 270
    Width = 135
    Height = 17
    Caption = 'TUHyperLink (disabled)'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ButtonState = bsDisabled
    URL = 'https://embarcadero.com/'
  end
  object buttonReloadSettings: TUSymbolButton
    Left = 220
    Top = 380
    Width = 151
    Height = 31
    ThemeManager = UThemeManager1
    SymbolFont.Charset = DEFAULT_CHARSET
    SymbolFont.Color = clWindowText
    SymbolFont.Height = -16
    SymbolFont.Name = 'Segoe MDL2 Assets'
    SymbolFont.Style = []
    TextFont.Charset = DEFAULT_CHARSET
    TextFont.Color = clWindowText
    TextFont.Height = -13
    TextFont.Name = 'Segoe UI'
    TextFont.Style = []
    DetailFont.Charset = DEFAULT_CHARSET
    DetailFont.Color = clWindowText
    DetailFont.Height = -13
    DetailFont.Name = 'Segoe UI'
    DetailFont.Style = []
    SymbolChar = #57615
    Text = 'Reload settings'
    Detail = 'Detail'
    ShowDetail = False
    OnClick = buttonReloadSettingsClick
  end
  object progressCustomColor: TUProgressBar
    Left = 290
    Top = 160
    Width = 220
    Height = 5
    Value = 45
    Orientation = oHorizontal
    CustomForeColor = 2469894
    CustomBackColor = 13421772
    Color = clBlue
  end
  object progressConnected: TUProgressBar
    Left = 290
    Top = 140
    Width = 220
    Height = 5
    ThemeManager = UThemeManager1
    Value = 20
    Orientation = oHorizontal
    CustomForeColor = 2469894
    CustomBackColor = 15132390
  end
  object progressVert: TUProgressBar
    Left = 270
    Top = 140
    Width = 5
    Height = 141
    ThemeManager = UThemeManager1
    Value = 45
    Orientation = oVertical
    CustomForeColor = 2469894
    CustomBackColor = 15132390
  end
  object check3State: TUCheckBox
    Left = 530
    Top = 170
    Width = 200
    Height = 24
    ThemeManager = UThemeManager1
    Text = '3-state checkbox'
    AllowGrayed = True
    CustomActiveColor = 14120960
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object check2State: TUCheckBox
    Left = 530
    Top = 140
    Width = 200
    Height = 24
    ThemeManager = UThemeManager1
    Text = '2-state checkbox'
    CustomActiveColor = 14120960
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object radioA1: TURadioButton
    Left = 390
    Top = 230
    Width = 150
    Height = 24
    ThemeManager = UThemeManager1
    Group = 'GroupA'
    CustomActiveColor = 14120960
    Text = 'Radio 1 in group A'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object radioA2: TURadioButton
    Left = 390
    Top = 260
    Width = 150
    Height = 24
    ThemeManager = UThemeManager1
    IsChecked = True
    Group = 'GroupA'
    CustomActiveColor = 14120960
    Text = 'Radio 2 in group A'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object radioB1: TURadioButton
    Left = 580
    Top = 230
    Width = 181
    Height = 24
    ThemeManager = UThemeManager1
    Group = 'GroupB'
    CustomActiveColor = 14120960
    Text = 'Radio 1 in group B'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object radioA3: TURadioButton
    Left = 390
    Top = 290
    Width = 150
    Height = 24
    ThemeManager = UThemeManager1
    Group = 'GroupA'
    CustomActiveColor = 14120960
    Text = 'Radio 3 in group A'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object radioB2: TURadioButton
    Left = 580
    Top = 260
    Width = 181
    Height = 24
    ThemeManager = UThemeManager1
    Group = 'GroupB'
    CustomActiveColor = 14120960
    Text = 'Radio 2 in group B'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object buttonRunning: TButton
    Left = 280
    Top = 50
    Width = 101
    Height = 25
    Hint = 'ABC'
    Caption = 'Here we go'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object captionbarOldStyle: TUCaptionBar
    Left = 0
    Top = 649
    Width = 1074
    Height = 32
    ThemeManager = UThemeManager1
    UseNormalStyle = True
    Align = alBottom
    Alignment = taLeftJustify
    Caption = 
      '   This is NORMAL style TUCaptionBar (use 3 spaces for left alig' +
      'n)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object buttonNoFocus: TUButton
    Left = 60
    Top = 300
    Width = 150
    Height = 30
    ThemeManager = UThemeManager1
    Text = 'TUButton no focus'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 3
  end
  object buttonDisabled: TUButton
    Left = 220
    Top = 300
    Width = 150
    Height = 30
    ThemeManager = UThemeManager1
    ButtonState = bsDisabled
    Enabled = False
    Text = 'TUButton (disabled)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 6710886
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 4
  end
  object panelDisconnected: TUPanel
    Left = 580
    Top = 330
    Width = 185
    Height = 61
    CustomTextColor = clBlack
    CustomBackColor = 14145495
    BevelOuter = bvNone
    Caption = 'UPanel2 (disconnected)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
  end
  object panelConnected: TUPanel
    Left = 390
    Top = 330
    Width = 185
    Height = 61
    ThemeManager = UThemeManager1
    CustomTextColor = clBlack
    CustomBackColor = 15132390
    BevelOuter = bvNone
    Caption = 'UPanel3 (connected)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
  end
  object buttonAniStart: TButton
    Left = 280
    Top = 90
    Width = 191
    Height = 25
    Caption = 'Start Button3.Left animation'
    TabOrder = 6
    OnClick = buttonAniStartClick
  end
  object buttonRandomProgress: TUButton
    Left = 290
    Top = 180
    Width = 221
    Height = 30
    ThemeManager = UThemeManager1
    Text = 'Random TUProgressBar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 7
    OnClick = buttonRandomProgressClick
  end
  object buttonAniInverse: TButton
    Left = 480
    Top = 90
    Width = 201
    Height = 25
    Caption = 'Inverse Button3.Left animation'
    TabOrder = 8
    OnClick = buttonAniInverseClick
  end
  object buttonCanFocus1: TUButton
    Left = 60
    Top = 340
    Width = 150
    Height = 30
    ThemeManager = UThemeManager1
    Text = 'TUButton can focus 1'
    AllowFocus = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 9
    TabStop = True
  end
  object buttonCanFocus2: TUButton
    Left = 220
    Top = 340
    Width = 150
    Height = 30
    ThemeManager = UThemeManager1
    Text = 'TUButton can focus 2'
    AllowFocus = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 10
    TabStop = True
  end
  object drawerNavigation: TUPanel
    Left = 0
    Top = 32
    Width = 40
    Height = 617
    ThemeManager = UThemeManager1
    CustomTextColor = clBlack
    CustomBackColor = 15132390
    Align = alLeft
    BevelOuter = bvNone
    DoubleBuffered = True
    FullRepaint = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 11
    object buttonOpenMenu: TUSymbolButton
      Left = 0
      Top = 0
      Width = 40
      Height = 41
      ThemeManager = UThemeManager1
      SymbolFont.Charset = DEFAULT_CHARSET
      SymbolFont.Color = clWindowText
      SymbolFont.Height = -16
      SymbolFont.Name = 'Segoe MDL2 Assets'
      SymbolFont.Style = []
      TextFont.Charset = DEFAULT_CHARSET
      TextFont.Color = clWindowText
      TextFont.Height = -15
      TextFont.Name = 'Segoe UI'
      TextFont.Style = [fsBold]
      DetailFont.Charset = DEFAULT_CHARSET
      DetailFont.Color = clWindowText
      DetailFont.Height = -13
      DetailFont.Name = 'Segoe UI'
      DetailFont.Style = []
      SymbolChar = #59136
      Text = 'Menu'
      Detail = 'Detail'
      ShowDetail = False
      Align = alTop
      Constraints.MaxWidth = 40
      OnClick = buttonOpenMenuClick
      ExplicitTop = 10
    end
    object buttonMenuSettings: TUSymbolButton
      Left = 0
      Top = 82
      Width = 40
      Height = 41
      ThemeManager = UThemeManager1
      SymbolFont.Charset = DEFAULT_CHARSET
      SymbolFont.Color = clWindowText
      SymbolFont.Height = -16
      SymbolFont.Name = 'Segoe MDL2 Assets'
      SymbolFont.Style = []
      TextFont.Charset = DEFAULT_CHARSET
      TextFont.Color = clWindowText
      TextFont.Height = -13
      TextFont.Name = 'Segoe UI'
      TextFont.Style = []
      DetailFont.Charset = DEFAULT_CHARSET
      DetailFont.Color = clWindowText
      DetailFont.Height = -13
      DetailFont.Name = 'Segoe UI'
      DetailFont.Style = []
      SymbolChar = #57621
      Text = 'Settings'
      Detail = 'Detail'
      ShowDetail = False
      Align = alTop
      ExplicitTop = 10
      ExplicitWidth = 250
    end
    object buttonMenuProfile: TUSymbolButton
      Left = 0
      Top = 164
      Width = 40
      Height = 41
      ThemeManager = UThemeManager1
      SymbolFont.Charset = DEFAULT_CHARSET
      SymbolFont.Color = clWindowText
      SymbolFont.Height = -16
      SymbolFont.Name = 'Segoe MDL2 Assets'
      SymbolFont.Style = []
      TextFont.Charset = DEFAULT_CHARSET
      TextFont.Color = clWindowText
      TextFont.Height = -13
      TextFont.Name = 'Segoe UI'
      TextFont.Style = []
      DetailFont.Charset = DEFAULT_CHARSET
      DetailFont.Color = clWindowText
      DetailFont.Height = -13
      DetailFont.Name = 'Segoe UI'
      DetailFont.Style = []
      SymbolChar = #57686
      Text = 'My profile'
      Detail = 'Detail'
      ShowDetail = False
      Align = alTop
      ExplicitTop = 10
      ExplicitWidth = 250
    end
    object buttonMenuSave: TUSymbolButton
      Left = 0
      Top = 123
      Width = 40
      Height = 41
      ThemeManager = UThemeManager1
      SymbolFont.Charset = DEFAULT_CHARSET
      SymbolFont.Color = clWindowText
      SymbolFont.Height = -16
      SymbolFont.Name = 'Segoe MDL2 Assets'
      SymbolFont.Style = []
      TextFont.Charset = DEFAULT_CHARSET
      TextFont.Color = clWindowText
      TextFont.Height = -13
      TextFont.Name = 'Segoe UI'
      TextFont.Style = []
      DetailFont.Charset = DEFAULT_CHARSET
      DetailFont.Color = clWindowText
      DetailFont.Height = -13
      DetailFont.Name = 'Segoe UI'
      DetailFont.Style = []
      SymbolChar = #57605
      Text = 'Save document'
      Detail = 'Detail'
      ShowDetail = False
      Align = alTop
      ExplicitTop = 10
      ExplicitWidth = 250
    end
    object buttonMenuOpen: TUSymbolButton
      Left = 0
      Top = 41
      Width = 40
      Height = 41
      ThemeManager = UThemeManager1
      SymbolFont.Charset = DEFAULT_CHARSET
      SymbolFont.Color = clWindowText
      SymbolFont.Height = -16
      SymbolFont.Name = 'Segoe MDL2 Assets'
      SymbolFont.Style = []
      TextFont.Charset = DEFAULT_CHARSET
      TextFont.Color = clWindowText
      TextFont.Height = -13
      TextFont.Name = 'Segoe UI'
      TextFont.Style = []
      DetailFont.Charset = DEFAULT_CHARSET
      DetailFont.Color = clWindowText
      DetailFont.Height = -13
      DetailFont.Name = 'Segoe UI'
      DetailFont.Style = []
      SymbolChar = #60739
      Text = 'Open document'
      Detail = 'Detail'
      ShowDetail = False
      Align = alTop
      ExplicitTop = 10
      ExplicitWidth = 250
    end
    object buttonMenuRate: TUSymbolButton
      Left = 0
      Top = 205
      Width = 40
      Height = 41
      ThemeManager = UThemeManager1
      SymbolFont.Charset = DEFAULT_CHARSET
      SymbolFont.Color = clWindowText
      SymbolFont.Height = -16
      SymbolFont.Name = 'Segoe MDL2 Assets'
      SymbolFont.Style = []
      TextFont.Charset = DEFAULT_CHARSET
      TextFont.Color = clWindowText
      TextFont.Height = -13
      TextFont.Name = 'Segoe UI'
      TextFont.Style = []
      DetailFont.Charset = DEFAULT_CHARSET
      DetailFont.Color = clWindowText
      DetailFont.Height = -13
      DetailFont.Name = 'Segoe UI'
      DetailFont.Style = []
      SymbolChar = #57806
      Text = 'Rate this app'
      Detail = 'Detail'
      ShowDetail = False
      Align = alTop
      ExplicitTop = 10
      ExplicitWidth = 250
    end
  end
  object boxSmoothScrolling: TUScrollBox
    Left = 824
    Top = 32
    Width = 250
    Height = 617
    Align = alRight
    BorderStyle = bsNone
    DoubleBuffered = True
    Color = 15132390
    Padding.Left = 15
    Padding.Top = 5
    Padding.Right = 15
    Padding.Bottom = 15
    ParentColor = False
    ParentDoubleBuffered = False
    TabOrder = 12
    ThemeManager = UThemeManager1
    object UText1: TUText
      AlignWithMargins = True
      Left = 15
      Top = 5
      Width = 220
      Height = 28
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 5
      Align = alTop
      Caption = 'Settings'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ThemeManager = UThemeManager1
      TextKind = tkHeading
      ExplicitWidth = 71
    end
    object UText2: TUText
      AlignWithMargins = True
      Left = 15
      Top = 278
      Width = 220
      Height = 17
      Margins.Left = 0
      Margins.Top = 10
      Margins.Right = 0
      Margins.Bottom = 10
      Align = alTop
      Caption = 'Account settings'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      ThemeManager = UThemeManager1
      TextKind = tkEntry
      ExplicitWidth = 102
    end
    object UCheckBox1: TUCheckBox
      AlignWithMargins = True
      Left = 15
      Top = 443
      Width = 220
      Height = 24
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 5
      ThemeManager = UThemeManager1
      Text = 'Auto sync your data'
      CustomActiveColor = 14120960
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 50
      ExplicitTop = 330
      ExplicitWidth = 200
    end
    object UCheckBox2: TUCheckBox
      AlignWithMargins = True
      Left = 15
      Top = 501
      Width = 220
      Height = 24
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 5
      ThemeManager = UThemeManager1
      Text = 'Send me email'
      AllowGrayed = True
      CustomActiveColor = 14120960
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 50
      ExplicitTop = 360
      ExplicitWidth = 200
    end
    object UText3: TUText
      AlignWithMargins = True
      Left = 15
      Top = 585
      Width = 220
      Height = 17
      Margins.Left = 0
      Margins.Top = 10
      Margins.Right = 0
      Margins.Bottom = 10
      Align = alTop
      Caption = 'Account type'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      ThemeManager = UThemeManager1
      TextKind = tkEntry
      ExplicitWidth = 81
    end
    object URadioButton1: TURadioButton
      AlignWithMargins = True
      Left = 15
      Top = 612
      Width = 220
      Height = 24
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 5
      ThemeManager = UThemeManager1
      IsChecked = True
      Group = 'AccountType'
      CustomActiveColor = 14120960
      Text = 'Free user'
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 100
      ExplicitTop = 230
      ExplicitWidth = 150
    end
    object URadioButton2: TURadioButton
      AlignWithMargins = True
      Left = 15
      Top = 641
      Width = 220
      Height = 24
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 5
      ThemeManager = UThemeManager1
      Group = 'AccountType'
      CustomActiveColor = 14120960
      Text = 'Professional user'
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 100
      ExplicitTop = 260
      ExplicitWidth = 150
    end
    object URadioButton3: TURadioButton
      AlignWithMargins = True
      Left = 15
      Top = 670
      Width = 220
      Height = 24
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 5
      ThemeManager = UThemeManager1
      Group = 'AccountType'
      CustomActiveColor = 14120960
      Text = 'Developer'
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 100
      ExplicitTop = 290
      ExplicitWidth = 150
    end
    object UText4: TUText
      AlignWithMargins = True
      Left = 15
      Top = 699
      Width = 220
      Height = 34
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 10
      Align = alTop
      Caption = 'Upgrade your account to Developer and get more features'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6710886
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      ThemeManager = UThemeManager1
      TextKind = tkDescription
      ExplicitWidth = 195
    end
    object UText5: TUText
      AlignWithMargins = True
      Left = 15
      Top = 793
      Width = 220
      Height = 17
      Margins.Left = 0
      Margins.Top = 10
      Margins.Right = 0
      Margins.Bottom = 5
      Align = alTop
      Caption = 'Free storage'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      ThemeManager = UThemeManager1
      TextKind = tkEntry
      ExplicitWidth = 76
    end
    object UText6: TUText
      AlignWithMargins = True
      Left = 15
      Top = 815
      Width = 220
      Height = 34
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 10
      Align = alTop
      Caption = 'You are using 3.2 / 5 GB free storage'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6710886
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      ThemeManager = UThemeManager1
      TextKind = tkDescription
      ExplicitWidth = 171
    end
    object UProgressBar1: TUProgressBar
      AlignWithMargins = True
      Left = 15
      Top = 859
      Width = 220
      Height = 5
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 10
      ThemeManager = UThemeManager1
      Value = 64
      Orientation = oHorizontal
      CustomForeColor = 2469894
      CustomBackColor = 15132390
      Align = alTop
      ExplicitLeft = 20
      ExplicitTop = 410
      ExplicitWidth = 100
    end
    object Image1: TImage
      AlignWithMargins = True
      Left = 15
      Top = 305
      Width = 220
      Height = 128
      Cursor = crHandPoint
      Hint = 'Click to change avatar'
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 10
      Align = alTop
      Center = True
      ParentShowHint = False
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000800000
        00800806000000C33E61CB0000001974455874536F6674776172650041646F62
        6520496D616765526561647971C9653C00005E884944415478DAECBD079C6D7B
        55E7B94ECEF99CCA55B76E7E1150320F50D1A6DB1947403F82A260C230D3FD69
        53DBDAFD90B6ED56677A1075044C888ED8A382A020B46000454111F03DB82FDE
        54399C9C739ADF6FEDBD4FED3AB7EA06DE2B18750ACBAA5BAFEA9CBDF7FFFB5F
        EBB7D67FFDD7DF215FBC0FC717F1BDFE297C8CBF186F72528372BBAFFBFF4361
        7CDCEE603FED503C9D03E0B8CD9FD96FC2F974DFD03FD28F91EDFB5B3DB39BFD
        EC8E3F9E2A008E3BF8F7F836FEFE9FEBC7AD9ECDF816BFFF05C3F0850EC07103
        7DD4CFC747FCB75B81F3CFE5E36603697F6EC7FDDE5306E14E1FFCAD06DEFA3A
        36BFB77FCAD4F7377BBD7FEA1FB71AF8F1D4F7B702607C93D7BEE9C79D3CF0E9
        81BBD9AC77CA8D004CC360FDEE588E06E89FE2C7F4FD59F77E1400D39F23397E
        C04753FFBEE30BBADDDF9B9EC9D383E99483C1B77F7FDCDF4DBFC69D5ED73FB6
        8FE3C4DC71339E5F877230C8D6E7AD00B86D086EF5A08F9AF5C79976971C0CBA
        D3F66FEBBF4F03711C44FF1C3E6E35E3ED03CDCF8118208CA63EEDD6C3FE77D3
        EF71EC87E336FFDB5183363D986EF3D365FBB45B83E97F1F05D1ED5EDB3FC68F
        9BF9F16933CFAF43DBD7E33EADC11E4D7D7F9C48BCE1C3711B3F3F6EE6DB0795
        9F1C7C0F3EBDE6CF2D201CDFFBC2E8F39792E1D3996426E11AB517FA83AE2311
        CD48A55171B870BD0EA7C7E1743824934C48ABD3947AB32DE3B15346E3918C47
        2349C42212F005A5D56E4AB6989568242141BF5706FDB6BE45BBDB9390CF839F
        47F1B72D29D6EA9208C7A4D5AB4BB3D510B72B20A9585C9C2E97381D23D92FE4
        241A4D4BB351905824299DFE1017DC93F9D979A9D5EBB29BCFE3C93925134B49
        7F3090702824FD5E53F68A7971399DB89EA4783D21198EFA52A915F09807E2F7
        45F55A4618975EAF25DD5E4F5289A4F8BD3EC997F2F89B387EB7210EC758A2A1
        840C8763F1073CE372AD2CA54A717C6AE99C74FB83D67EA9BA2E4E77F58F3E97
        FFE4A7D7AA2573A007726005F8B53F05C2B48BB86D4D702BFF3B3D3BAD01B77F
        7599036F01E0E3D71FFE1767BEE6DC4CE865E9B0EBC5FD760D4F7F84015E9456
        AB8A87DA9174624ECAD5A2389D04C02B6EA743E6D21969B61B3A082300301C8F
        01C0503289B804024169341BB29BDD9538062618F0C94801F0E06FBA1209788D
        878CDFC9162B928927F1F30A80A88BCB1592D954125F09C058B6B23B928CCF4A
        AD96C3D7B4B47B03718DBBB2BCB022956A4D36F7F73040002091D1019DC1FB37
        5B1559DBDD118FC723E9784A7CDEB08C706DC5EA3E7E7720A1405CAF6534EE63
        F09BD2EB762593CA000CBFECE577259DCC48A95AC5831C4B3C9A9461DF21BEA0
        07BFD793EBDBD7E4DCE9BBF0B7A27FD7C7A7DBEB9762A3FDF7B58E7CE2B73F71
        ED039FDEEAE4F0063DF3D30E846509A6DDC4B496F88200B0FE6DF7EBF6D9ED99
        FAEAFDA17F71F6A5F7CEB87F30100C9EF760B6B85C63E97730A0982D99D4221E
        2400E813807929D530A370AD4E974F01983D0400FE8B09400A03100C844C0076
        0C00FC0060D03200E80080200088008006002857317B01408700D40C00928701
        E0B50CBA1571B9FDD21D8C0C00E60140DD0060307262E033E282C59849C6307B
        0D00BC1E37AE3D235E6F442D40A96203C04100063700B09FDF9114002857AAF8
        1D00104909FE447C010FBE8EE4CAE693726ED500A08BBFABD7CB12A665EAB424
        168CC8F6DE7A7BA73E7AD7BB1E6AFFD6E5FD46C5B4007D9B35B0BE3F4A27DC54
        14DE8E05B00FBEDBF6E9B57DFA5E7C26B4F2DD2F39F5A66828F4DC26679D3720
        0480D7D0ACEFE24184300BE6A70028980078615A1D326F02500100E36900FC00
        00E67C2F670010820518F45B872D40F428006801825300ECC2222CE0E1D76165
        DCFAE01DE38E5A802206696B6F0F4FCC052B92118F7B0CCB15D5D9BBBEB30B00
        5C060070011CEC6A3DAB00182E00033A1E1E02C0E7F1C22515F03769D9C9EE63
        F6C39AF9C2D2EDF4E902F03C5A006E1D00DC8D7B16E974DB52AD9625919C030C
        6D09D1851477E11EE0E6620B95CF6E54DEFCDF3EB2FE41BC59D7B406160076CB
        70DB101CA7019C72D8EC5B836F7DB54C3D3FFDDFFEA2C5673F6F51FECFD9642A
        397078A58719EFF2041500070168EC8A8F00244C0006260070012EB800A7D300
        602E0D73DCAE038096BA0043031CB6007BD99B0060BA805CB10A337DE002DC00
        602695320118C93600C800804EAB049D3090643481075F97530BA760D201002C
        8063E452B3EDF18CF15A06006BBBB80F020030DCEE20FCF910FA03F7D3EBE21E
        026A01C626006D00309F9ED5E7DF00D433F8FEEAFA55DC4B5AC2C19874DA7DF1
        C26A55E1E6B3853D397BFA1E1B002549240E0028980044E1427B83A16C16EABF
        F3637FB8F60B78F18E09821D06BB7B98D6043740E0B8CDC1B7FB7AAF39F0417C
        067EF86BE65FF9C2B3B3FF0E42C6978A2770151E9856021032011848A9B4A5C2
        8D7E7F1A00F714004D00509D02207D840B78BA00A000E475375A7559A505A81A
        1640204F5371D305A4E002EA0060E70E01C8CCC13AF4A4D6A8CBE2DCA25CDBBA
        26695C7B381C97760B4F0AC275BFB083D771481AD77318805900D004002100B0
        730880315E33D7E87FF2673FBCF91FB2B53E5D42DB84E18E2138CE054CFB7C97
        6DE0FD1C7802F06F5F7EF181E72C0CDF1C0C849DC572511FBA02400BE00D992E
        A02FD9EC35F8D1594926EC2E6041CAD0004ED305D835405535004D33AE7F34C0
        AC49992EA03671010153048E6D00D0BC56E102F2700129B880964D03CCD85CC0
        B6A9013AED92F400402699C2005764750916A05C510BE00400190CC210EF1F8F
        45F1BBD0067BBB7009740133070074AA50FD00009186C3020003D7E974640E51
        C570D0951A209C9B590458EB70534944150000D7EC76B9E5EAD663B290390541
        1852007A881E5A80D183994F28E7E03673B90D190C4712894344F73AB04E7DE9
        E1970BB5CE477FE4BD1B6F3401B020B0836007C08A166E0A80630A00A76DD6FB
        CD4F9DFDFFCBB3E6CFFFEB97DFFDABF9DC66241008E3C19501401CEFE2817F3B
        0A803949264D0BD0FB0244A00250977D0010B301706B0D70A308CC9519FEA515
        802E66D402DEB7CA599A99972266FA262C80D3E981099F910E06241C88C860D0
        90EDDC9E86811900E001006300D0829519F4BBAA3308A30316A3DB6DE07D9BB2
        30BBA0E2B705919AC4F56CED6DAA0B88460C17D0E9B46527BF2EA797EE16A7C7
        29FD2180C2FDBB005F1B96A0816B3FBD7001D05FC77BB924165F004C35E89511
        00E0B00E65ADDCFFAD9FFCC0DAAFE15F4D1B00965B380A824356601A80E954EE
        24ACB3CFFC44D09DF8EDEF7BEE3B03FEE0F2DEFE06444D482AADA62442118474
        3EA9D6B250B83100E0C60BF5255FD8C08C4C1B00B46D00540BA606B000305C40
        ED580D0000B23701002EA00C004A951AFC6C58FD3A8172D302982EC0ED76C0C4
        6286F9A1FE11DA75F1D0573050ED764BA2E1A854317006002E08459AE13E0008
        222A68C98E026088408F87337600CB91C32CEF4BC01FC5BFDD1AE675E19AEA78
        BDB9D41C666E5BC35C2ACD3AAC45021140301840A83742F8771996685E7CB01E
        2EBF47612B9776A149E660C5F6F4FE57E62FC8EEDE1500E094446A19EEC40825
        7B2AED861A967EEC72E3C77FFDAF36FECA06417B4A17D8934AE3E300989EFD76
        A56FCDFE103EC36F7EF5F9EFFDB23373DF3686E0DB070054F8550C423C04B308
        739E2FAC4B24322B1E97C71081758AC03044D5DC541400118819E9717B313305
        8394D119509958000B808409005C40761B26392D210CE040C3402F667A671206
        2A00B5265E13EA03EFD3E976D45CCF240D005CF879057EDEE70F4A0FB3B78327
        39AB03D5427896D099BBB9BF8B27E1D49F77D50284D50228002E03009FD74804
        1510068E1105840309FC0D1E192C00C3B70600984DE375076DFC0D2605062E1C
        F44B10D1828FC2AE52D43CC8CAF2395C072C88D7ADD62A57D896A5CCAA5CDFBD
        2299F4B2A4A36929020A5A43AF3F260DBCB617D7D01D1949328F1773D3E5DFFB
        81DFB9F43DF97AAF8007D2C0676BCA0A4C4330B102370BF9EC615EC0147D917B
        E6038BFFF595A77E3B1A49FB05333797DF54008A953266790AD878215A362512
        9E511F6700B067440104A051C643EDC86C66197171160FC7A1FF6D3CEC4B1262
        AC0F735AAED56E04C06F009085680A87F96F3F2E728057776BF62F028B400B90
        872B2AD71A9A2718406CB661665DEE030D70004008D10A011848228E6BC564A1
        69E66B6D01006602E70100676510D66438040059CB02A4C5EB0DE3DA06B86FE6
        0C8600300188DDFA8C99CD6CB7DBD016B36A0DDC6EFA73439730EF40FFFED8D5
        87211257F1DAB02EB006435893ADFDEB00D7232144503BE55D3977EA9982CB95
        56B38A571D63E49CD28116F07B7C7A5DA3510FCFCE275E5F501EDE28BFF3A7DE
        7FF55DB880BA0981DD0A744D51685F5CBA0180A3FCBE25FC38F3239CFD3FFBAA
        95EF7FD66AEA9BBCBE0806C80385BF830B0863D6EFAB587362B695CA5BB8B1B4
        5A00BE6FB9B401F39A54175003F51D688495A50B5228EDEB4CA575E8F61A9A61
        A339E5EC70B8FC7A899C5D4900409DD1C42CCAE36FBCDE204CAE4FC27E3766A1
        0B16A3A100A4F1FE1BBB5BD2C0036594E071324E6F6232FB0F89C07CB9040B95
        9461AF8ABF77881FE6DBEBECE167370760376BB806C3023011D483BBD9C35703
        008A405A8076A7A12E2585FB655AD8EBF3E33A60FEE1623CB01CFCF7E3D70040
        EAB404437EE97587B8E72C5E7F5D5616CFE17965C509485697EF936EB30CEBD4
        53703AFD81F43129E85ADB9828B4703E7F00CF2F00313B287DFB3B3EF7BA6E7F
        54352168999F3DDBE7F038008E9BFD96EA0F13009FDB11FBEDEFBEF8DBA9582C
        49B3D6C72CAD56F23A203900C0194C00EAD52DF1040080D3A31A2097BDA2614E
        223E0BFF5B80486CCAF2E279D9CF6F2900E150120FADAE6A9C2155AE98D70745
        333CC643E6C0063063EB8D9A14F03E1E98EFA0CF0BB3EB4148E9500062E12000
        4A2056DF943142B2E1A02731B885122C8213AF958AC670772E0D3BB7E1466652
        4B0830A80F7C30A730AF2EE60366A58E488300F031CCA666705D5D090523B88E
        96868F6ED3051C6402F7341114095900303268E21E3B781EF87B44044168884A
        AD8A2825A2E2D1E3F5CBE5EB9700E592842210D0A5A26C6C5DC660FA6461E1AC
        ACAD3D2AA756EFC5734948BB5E845119415345A5D66EE23DC9584F35C0183078
        61017C5E18687CFFE78F577FF66D7F7EE52F6C56C0D204F614B20581BA01C711
        B3DF6D1B7C6BF61380E86B9E3BFBFCD73C3BF1D37E5CA81FFE089725C5C2165C
        002C00666D2246007C52295E934064010FDBA379805A6507B3288A19310F00F2
        2600E7647B7F5DBC6EA7C4F1A018FA10002AEA5C01E121CC20CD9E0BA691DAC0
        07335787052894737AC37EF8BE28C414D3C0F57607E63586CF843C71FDB25AA4
        361E560CB3AB50A94838328308210858603E01DCE6DEB6CC65163513C8D8BD07
        009CE3AE2CCDAD60A06AB8AE5DCD04CE261995C0BD206C1BE339121CB7D30803
        E9021822962ABBFAF5C0020CF5BDE9E65200BE054D1382362AE33A62D1A8BA3B
        070CECE6CE65003227C17048D637AF6032ECCBFCEC22441D9E1FACE485F35FAE
        3981219E157DBD1BF75C83D066C4341A76F49A5D2E270478400790D6A8D2F57F
        F27B7EE3D33F8D7FD6CCCFE6942BB0ACC0243B380DC074B2276033FFB19F7ED5
        9937DCB7E0FF0637FC14CDA66A80DCA68A9A4A0B22301251C55B2D5C173F0180
        066098D76C62D662406912ED00EC10000FC21B081D3E280A35C6D4FBB400F8FD
        2174818CFB1A4EF960659AD000957A093E157E14DA21060038F82DA65D31FB23
        10818F5F795C5D0ACDF0C24C46D6763611822D603042F8BD21DC8613EA7B0BFE
        970034F004E0FD752DA0836B5AD5C52075018842E61805F46901A280A7297BF9
        1DBDA7642CA3F7CF10AF0017480B10362D003D750FB39E899B78740600D5A02D
        22B044255DADA496190D9DB257D804A01909840380E18A542A25593D758F3E4F
        46064168A82EDCC700AF35C2737023EAE0A2951380F43A35D85507268F5B5FAF
        07ADC3E45A3098A9BEE2E7FFFA3B3156551300CB151C65052600388E0120607E
        72F6C37E4AFC975EB3FC53CBA9F0FD21847B6E98D55E8F26B00C5182D00A716D
        2C1CD119D5AEEF838D38668B7B920AA6954826A0012A05F8D5067CDD792E7260
        2639CD98BCA116A083079E8505F062A6D01AF4075D0CE4126E34A809164280A7
        808B1D6366FAF1803B1A67335BC814EBB5ADEBD00B3168851DCDEC6DEE6DA920
        CD2422B032033C74975CDEDA90C599650C5C53D71C7AB0AB4E5D0B38A502916B
        0563688BB9F4BCCE6E3F1E72070F3D57DA53179082C5F243030D3030C5F20EC4
        26000826F5BA1C6224823823F9BE74293198F952C5008011055702776139E300
        C017F6EB44180D86323B774AF676D76475E92E69C1858D87082911CA0E0113DD
        467BE8D0E7D845F4A2560B7A26A4114A5FFAC32E2C70467EE20F3EF7037F7FBD
        7205E355312168C9E14CA13D43786CE867F97ECEFEA805C06FBE6EF5EDB19037
        1541B8E4C30CA8D52B884B61E220C64A8D8EC42172980760D8E70E24A1600D00
        5A8D3DD509860804001D03801DD305C462195D0320005C0D330008EA03EE767B
        8818E6F180B9268FF08A7130C34BAEAB23AC6AB44C0B00A118C64C5DDB5957C1
        B9B1734D166139AAB58A04A03192B130D4346665D82B4F6EAEC1AA2C2316AF69
        1692164001983FA509A1DD7C0EB3DBA1C91B9ADF0300F6D50230114437D303A0
        D4008C54EC16801A6004E1168B6634B48B61E0395122E130AE11E0F41CB20F61
        1C0B01A420978B010326C108EEA35EAD6884D4025463803982D0A37FEFC1CAF4
        28588371E922A2E8E1D93865A859C5C170A8A17502DAE45D7F7DEDE77EE793DB
        7F6D5A818A6905EC09227B2DC1B1593FBBF92700097EBEF7FBEFFA2D846DAE10
        547100039C477CDA6A0F24E4734AB90917108E61700C0002A1B49A5105A09985
        A9F7991A8022B0A122D070010600D400960BC8160A6A61FA788854BA33109014
        523DFC5D13338A3AC30D5B95C4032D415C356005E63319CCAEA83CB176050F3E
        AE0B2C8CE3B9DE10C6B5A4E200A0CDA48E43AE6E6DCAD2EC1204ECBEB1EC3A60
        80D595E59915052057A2F2E6B22D80C613A2E660522957DE17C7D8AD1A805149
        17D75A2CEFE9B3B44420D3D7743F63B8070B8078D400201C320000379287508E
        04320A4016D680A29489B141BF8F89308F706FA8CF02D31F132C2C3584823D4C
        288AE376B388D07300733DC6F5A7B4B8A48F703381EBFAC06736DEF9B6BF58FB
        135C54D906C0B41B984403D3004C877E1300BC2E47FAF7BFEFC26FF08970A671
        5665731B885F7D50A56D5C20D39D694D04118050380D3368005027103E6A8045
        0090D3815CA20B00003EAF0BD1010068D6350CEC41E0E48A05CDB4312F4EFF46
        71C4BFA7F5A0C0A220F4FB3D5AA8B18FDFADC30A2D00804020218F5C7D54416C
        E13D52002B57CE029E94A46101DA08A39CB8D65D00B638B3A8FE3BC3DC440761
        96A3078B610250C4031E8C615201B4D3A10030BD4D0BC00C25D7082600C00238
        1480241E8D1B9663A079000380190520118FE1BD8AB000118845580E5880DDFC
        1A229339A87BBFEC430FA420082BF53224CF0011D3B2749842865584B9D0E824
        8FE73684BEA2EB69360B981C03AD3F220023580A0210C7757DF8E1ADF7FCFC47
        AEBD0F635634AD407D2A1AE8DA0018D98B39ADA55EBBF90F9B0024E763DEA5B7
        BFF6EC2FF281500304608A72B96D193AA04AE1D3EBEDAEAE92191660472DC0C8
        B400F5EA3606210217B0A061630FB36969F1022CC09AF83C30A9B8E146B38407
        16517F5628E5357BD7C36CA0695B9E5F561F58C460763B6D55D2213C382ED3E6
        4A25B801A65D93F89D885C59BBAA6ABB054B11C1C329E3C1050040321684F680
        A9ECD5016B1BF0A4A1F8B36A6E993C72E1B99C5A3C03B7565300FA9855892801
        10CDFA713128A7B3DDA5099E80DFB200BB9A9A8DE1BD18390CC6860B18C327C7
        633378BDAAE631F6B3FB2A06A3B04EC3BE53AE6D3E068DB182E714926C115112
        5CCA18FF6BB71AFA3C3A00A9D1288B835953848B59589F1101C0736CD6010023
        038705C0810500001F79CB87AF312154B289C1E9C4D0A49CCC0E80B5DEEF9F32
        FF6A01E600C02FBFF6EC5B0C00E002207A1400188C51BF8918954A7C0648B9A4
        53DF4318985117A0EBE1B51D8DE393306D8606A843035C500BC0706E36B38259
        8C1912A2421E4ABE90D530B007184603966A1900144A3955D86E4F0083E251E5
        5F4478D50214B3E90462ECB05CDF5AD755C1221E6A04E11F178482FE2466B301
        C01000B47A1830846655BCE7FCCC2AAE635B0B42EE3A7B1F446019030217D01F
        224C8B6B88C4F76B018052358BC176C205D002444C007614F2287D38FE1B9776
        7BBDB6EA15BA805AB30290125ACBE8F37884B5900237B29905A8C19444B8845D
        E180D262A4708F59994FAD481BFFA6601EE37566674F4B11D1D308FA8AB98C6E
        BBAA59416642A701F8D38777FEF6CD1FBEF22B3617509583F470E76600D8977C
        ADD4AF8A3F02301BF52EFECAB79E7DF38105482800CC050CFA7558801E7C3842
        97212E0B615F209236011848A5BCA926524560256744010B06003E9F1BFE6F45
        1A75AA640300231114D408600013B8440BE0616144563581B08208573E9F4E4B
        B9DED0B42B0170BB438802D6B4E62E9F0308F1795D7C0A02D6441451C560A8D6
        A7D5A57F476C5E2BC85CE6144CF09E8AC0F308C3AA8D0ADC4A11E273ACAB9BFC
        7079FCBAEC5BC2B53BF1BF941D80CA8E8AB44838AD95453E8466039A6F5A2026
        B8BA2D0C5214835C5681C84176337C06386EFC8F0B5B5CE46A4190D242E6106A
        2EA456A58DF0B75E2BC1BA36E13A97142427DC6217F74FB846D01B4EFC0E339A
        A3110168E37E33F29187771EFAB90F5F79AB69014A3600DA362B700800B71C94
        75FB6C2160D88CFF55002EC6FDAB6F7BED999F9EB60023E8C67EBF0121D6D30C
        9938BCD2AEEDDA2C40CF580E466C1B879FAB56B29A1E5D5A305D809755B6F35A
        74C9C28CC1A06B6A803000E8E9BF97E7970C006001140087B1ECBA9099D17503
        E610E6D2332A1CAF030056FAE6F3EB98110BB02C50DF987551B88CB1D6DCD570
        AD2C320903A83C66D73206B1241EC74016E7567435325B2863C01132C2643B9D
        4C1523846C1380ACCE155A80A0094009003023170E2735726009184340AE5B84
        1096D22270FDA1D16CA9350C8762F81DBFE48B7BEAEE92782EBD6E1FFAA40E50
        6352048CF3E955E9C095E81A40B7AD42B58128C4EDE17BB675B60F2700C0028C
        460A00D7343EF2F0F6E7DEFC278700B09242D60251470ECAC626004C97755BC9
        9F0900CB49FFD95F7AED999FE40D31351A80EACD217C198DBC26007D5D24618A
        B85185C90F5B00F425BBFFA4CCA49714801A1341DD86A101F6D630B00ECCC619
        230CC48CEE6180F39A084214800744007AAEA4FCDAC7B6CCC4D0581F2A2F9C0B
        217DC4C8CCC57BBD5E5D8CE13A3A43352E2AB9DD5E4DD2B8DC1E5DC7D7DC277E
        77381A6B6107F3185EAF4FE3F8D5145C5132AED0355A780DCCD77373215C875B
        9E776E49FD71992E00A28019BE00220E0E46B1B2ABA9DA4838A500F03A08401D
        2132F312BE800F11440BB37608CBD083768909A3A82A6677B90217B4781ABA06
        F7803171C3B2954A00402DC040F5C018834DBDD5E8D4350220748605708B0B00
        A80BC033E1CFE2D400FFB0FD795880B74D0150373FA797882700D8EBFE2CF36F
        094002905400BEE5CC9B0EBB802DC4113EF5E94D00C0942DE36AF5F9A18C1906
        F6A598BF2E31D0C98AA05A390F1770A0016E008066150030F3D5A305E0EAE020
        263FFEEEC7613A9D3A23B987809F4FCBD691F151DF8ED55AE87763FD97AC24FD
        723A3996975D08C885A5791300430310807008030138E8E7FB8864EA55C6FD49
        88369F4239EA8FA1476A5A0E168B2434A145974600B8BEC1052717D3C0E51C40
        5C56000C0BD0C22C4F4B1D7F4B91DBE9C105740D009C62B7002D4DA9FF090078
        CB87AFBCDD1C7C7B28D89483C5A149F1E834001E39C80046EC002CC5FDE7DEF6
        AD67DE380DC0080070F05A1D03009709807F02C04817878C28C0080309CC3200
        D823009A089A51139B496674E65A168000B0A4AA3488CB83EF795CB37076089E
        CEAD4387F66A8D6D289800E857FC3FCEB6975E8CCBB7BC7045127EA716BF7051
        28A8E6DEA3750D5C02663491C47D85427E2D71A3356A22D261F938855FA36E00
        B0B8745AAE5EBFA4FA883AA2090D1265B207EF59834619209C4D4323559B65F1
        F88E01C01606FEC967B72EBDE523577E19975EB813002C17602D004D03900200
        67DFFEADA7DF88A76F02909C588036E86C5204A6666101DCD2AC220A081B61A0
        CB4C057BBD21230C04004622E8A2ECEE5FC340BB345E6EB5ADC5A0833C00CD31
        C3C0F230213FF1074F888700B89C6ACE1580A779F3D8F888C2E9B1CD1A8C4C00
        28BA58ABF0FA0796E42BCF3AD5B433026119196B025B00BC85D0349D9A935838
        04ADB3837B4C422857B420847507951AA20D3CBF45849E8F3FF9599941349249
        2F62D6433B30DD8BF765D26C0477994A9D920A2216AF3F6A000073CF350C87A5
        012651C0ACFC8FCF6E12805F3101B0878247AD0CDE1280D8C402246001BEEDF4
        83F481860648AA06188F4D00E0C766111F739355B7B16FD3003065AC08F2732D
        80A9592311B4080076F6AEEA62502236A7AA99004C340057DBE09BB9C8511C44
        E54D7F7059BCF0DB84C0655980A79B00D314D85DC1E4FF9B96C00E01B5C40317
        C3F2FAE784356F610030D228A7D50600D00A9170503677B9C033A383CE245A98
        00948BB257609D444AB676AFC9FCDC19B5900DC4F80908E80EB44AAD568405A8
        210A58962A2C245720ED1AC039A5011806FE8FCF1080AB1600651380EA9D0240
        0D4021183F04C0B79E7DF0280D60B800868130E18871FB1A061E88C072E1BA44
        A3B36AE6341388DF5F5ABAA805101CD4086FB86301D0854FCCABA2E707CBAAB3
        AD80BCE9BD4FEAEA978716809F2700C0F8C81F8C0FFD37CB0D58100CE07F1FB8
        1894EF7CC11CC0F46A410B2D40AF6F5844BF3F207B784E294C8E52B980D91FC7
        E441545167E1C9550C5C1BC0B4656EF62C26C80C7E671FCF7145338155B8801E
        C467267D4A3A78BDB1D3AD6ED1EE02AC3CC0101620460068013EAC00144D00F8
        69B9002B0CB44AC76F0AC0610D700B00B8413389288095B1BDC661000AD92B6A
        FEB9D9A1060058FC716AE96EC917B8D7CEA999BD8E1684CCA84ACF970A462125
        1FF868207B2DDF81058066704F5CC0177703B1C1C3D858471D1B168020B064FB
        E5CF8ACB6B9F33AF358D2CDC6494359B610A9B5BC3B67570B9CE1F0927B48A07
        D2462EAFFF037441552B95664D008A8802E61805C0AD70E9BC030008072B867B
        5CF44154D3875BD03C801C7601F103007E550E5C805D033C3500DE6E02100400
        41BB08C4E07510CB6A3A1417366CED8B3F721005147257D4FC27125C0CCA9A25
        617723AEDFD38A20C6D99C09CC98118052B5AC6955AB2670B7E991FFF4DE2B77
        04C0F8C87FD87FEAB8D5B7B70481891F5E2341E000BDE9351764DED585002CA9
        3EE15E00BF0D8072C5B00034E5A381431EB9FCB7BAE64F71CB41A6092F95F665
        163EDFB0000899211CE766CEEB6A60972E9100F41AB644901D8059D3055C3919
        007EF975675403040F6900AF02D0EEB11E0017C3D470674F35C0E828002A5958
        0B5880E57B10EEEDEAAA1EFD3D670C53AF5D98B72A14F2D8DC184200761A1EF9
        C9DB04C03E4BCD6FE508E33EF561BC8EF5729357BD49A4310D01AD4022E2919F
        FD86450C625E5F8455477EAF0100976A6BB52A062C0ADD13D4F58047AE7C42D3
        C6AE690092B706606C0230D1001481B159F9D08902F06D674C0B10850B4869F5
        0A4BC30D17D0977834AD640E5B5C0B98B1B980CB92D49AC079A955F2BAB4BA0C
        0DC0A5541676B8CC8D21DC3FC70A9A838D217706C0B4891E8D0F42BAF1B1101C
        0CB2F1724674A185121600C780700081E10E08C11B5E3E2B67FD0DFDEF73334B
        12F0FB857B2712708F6D84CA4C02B95C7846FDB13CFCF8DFE8AAA1E5020840B1
        0817C04C2001A00B80285C98BFA08B3F6DE800BE87E102DC875C40CF6E013E7C
        4200BCFDDBE802EC61E0A6A9016A860B00004C518EA601C85D9E58009685B3D9
        4206614FB9B2AF001C6C0D9BBB01003101B81D1760C5EC2F7D664A9E8FF0CCE1
        86AF856AF64175D314336132E854308B1CEA873B8D129E4A463677B25A5CB157
        F5CA4357F218A8A1BEB6156A1A201C1D764E6033056122EC92377E6D50BAEDA1
        CC03008FCFABAE8ED53AF55A4D278FC7E347B8D78008BC02ABC012370B807944
        07BBD042C66A202D40AF5595F9CC596961D673D7952502350C9C88C091290261
        013E7D8216E03000072290A95D96657145CCE9F24304EE1C12814500108F2F6A
        4D60AB55D1644F8A375BCB29000E05C00900668F00600400DCB70980311BBFF1
        A5F3F2B2F3EC4BE09076AB297108D0582CA47BF1F9A0589C41555EAB676576E6
        ACAEF279BD18B0B973D2E837E4837F735DDEF7B70529358646D6D196783AD2ED
        8CC5B4022385E08DAF8848185FE766010022178AC2443C25F9FCBE660259CF50
        A954A4D92A4A0E42784CC1080032E9054052D522D4EE78A88920168566341154
        12A72F6AAE343631725EB880DE0D1AE0439FDE3829007CE77EE5F5E71FE40308
        D8D702C63ECCB28656E74623DC4F0F8BD0B067020D0B90482C6A2AB80D0058E4
        914A184921C76477B0535D40CB04603CD91C3A946D5A805B4401F699F80D00E0
        6BEF094AA7C69DB954DE7CEF201EDE50FC1E91B59D0DAD33ACD673B2307B5A5B
        C6789C7D599A5FD5AC5DBE54941666D5FB2F35E4138FD58CC4D30482A32D813D
        2CFCBA6707E52B4E79708F334606B05593782C29D9FC1EAE25A645ABD572451A
        9DB2EE24AE54B82875462325AE0026A33388020600200F3D6500506996C5E58B
        68B5F1711A201E9B0300EB2767017EE575860508681460640229FAECAB812EDB
        5AC044049A612001A00560B2276526851CA60B70991AE0A902C059F8AA1767E4
        95CFCE486EA7A009A66462056635AC3E38E873EA92F15C7A491AAD1CCCF469C9
        160D00166757A5D20000C522375AE8E6939FFF685E2EEFB6F43D798D0EF37DA7
        19B0ACCF00109C5FF0CABF795948C25E3E0F3CF9561DD7908118040021130058
        807ABBA005AC1B9B8FC8E2C25D128D260F470166263063A6829D16005D13005B
        1EC0CA047E9016E0A4348001002C00FC58D014810460D06F683D8001800F006C
        E377A634407C410B426E0EC09C0D80C322F0B6003067E037BC242DAF7AF6AC64
        B7F7A14D7ADA106A2E19D715CB70C02DD7B7AE4B1A00B45B791380ACEE22B203
        C0E6507E9F4F8A8D91FCD70F717FFE50D3D04EC7D16968FBFB27224EF9E96F4A
        88DF99D1D54CDE533ABD2885E2BE1671B2409600F4876D88C2845CBEF6593975
        EA6ECD8770357036B53A49040D3B0DAD97B000E899004CE7012C11F8A1BF3F31
        17C030F0DC0D22D02A08312CC08C0C30737B8DDD1B45E01100581AC002C02E02
        BF10008CF4EC485EF9A2A4BCFAC5AB925DDF96A1F6E274E916708ABB48989B32
        D675AB75A70D00E002B2051300B800BE77AE000B00000200C081BF7DD7A72BF2
        F1C70B4616D2797C1672A203E03EDEF1FD33E21DA58DFD895CD30F47A5D96C6A
        3D00F73C70218C42348CC9B4B5735952E965B819BF944BDB80F2AC8AC066B322
        23F87C96CD37F0DCA8013AA60BD09A88F174267056FE1800FCFC8901F0EDE7A6
        D6023671C33E190F8C9AC0949684B911BA0080F0CC611188014FA90B286BA58F
        02000DE0748E275DC26E1605BCE93D7706C06B5E7256F6D737F033A75EC7C26C
        5A3A08BD021EA7EC6437204A170C0B00007200C06D07A064BA000280C7F264DE
        29FFED434F98EFED3A700537D101EFFCDF66C4D54F03A4965A138FC78BC800A2
        2D0A0B802880F9FF60200C2059310C9D124B695D421E602CAFDCA7FB231AF522
        5C4053F5534D2D404CDA006208DDE0B003A01A00623776C200FCEAEBCF4D3480
        650186FCF5217BFB197BE1A8E85BF56D88C0990311988508D454301F7A5957FC
        92B829C3020C75BBD38D2EE0A043C8F69D02F04052BEE94550F7BB2C2271C00A
        38642E85C118B2644B6437BBA95149BB6D68801C3480DBD40075B32AB867BA00
        02B05DF7C84FFCC123FAFE7C6F7ED2151EA503861600FF1A000CD2BAF2E97233
        ADED00FC4DB8A3845A80ED9DAB700BB3B86F1F842AAB9692BA278299D219D305
        34AA7919C0DCA7D3A7F03B257178A36A4D14004C1A87F40E698078624EFEF853
        6B270D80A1019808CAB32CDC04A036050035C0680A80A40980E102164D0D3032
        011000306F03C068106189C037BDE7C9DB06E0152F4AC8AB1F382765003018AA
        CA303679E0AB5701D84058660030377306039E350138ADFD7CB81CDD9F02E08D
        EFB9645B8D34A2825B0390010035DDE5C4F6360E7169BDA20B91D2E5AB0F6B69
        BCCBE99642615B52332B52C78CEFB6A9FA4F6951A805001783AAAC10F6460040
        070034D85CD39607186BBF2402F081FFAF00E00D66F486BF14007CFD0BE2F2CD
        2F3D2FE51D00805BE46BB1BBA7B53DFC4B0200FCB9CB1994583486FBF50080CF
        9900B8249B5B9799B95575890388D6A702002DC08988C04500F06B3600820AC0
        265EC57B0800A7EE0BD816973FA5DBC30D11F824FEDBE23151C0E81817F01400
        787E42BEE52B2E4809F13E4BB5E9069226000E1300BA800E5D00E26F43040280
        F9D3DA9D245FB0A200AF6EF6F8F8B5AEFCE65FADAB08BC7D00E600404A97B9D9
        40A36E0380FE7B6BE70A62FF45FCD134007D0DFBE802583FC930300D20340A30
        0160D44500C4B6183430A3803FFED409E6017EF53BCE998920001062660B008C
        4C0BD02200190380DA61008A00208E199FB2F200871241E3499BB8A3C24005A0
        FE3400103F00600F1A20169F978E8AC023008008EC4F44A04B7EF8DDD7A5DCEC
        6B6B16AB22E96622905D5BDEFA068A4000D0AB6978C7AA67A79800C0026C6D5F
        913900309E0080F7AE00801E2C80590F30D100D004D56651A38036A20026DE74
        2B3A00889A2250C3C09801C0094601E71FE4CD078F1081B40029D305D002B8FD
        29ED0FA00064014072711205F4FADD8905B052C1370D03EF1480171080F35284
        0BE0AD0DD40224A60030C3C09BE40108C0872F55E5773F95D52A62CF544DA21C
        0100DFFFFCA24F7EF4EB11EE0DD3BA52AA0034AB1AE6450180CBE1D12DE13700
        6073011D96964F44E0AA6E62717A633611E83145605AF7060E1105300CFCC0DF
        9D10007401BF0E00EC5180E1028E8E025C53002400C0D151C04893477CA819B5
        001500D0D028606C46015B770C4012009C9B022039691479BB5140B631969FF9
        E08E6E13F39811C071E568562692398057BC302EFFEA3EB7049C33BAA7D0AE01
        A2D128FEDE72014BA60B585300B88D6D0800D26626D000A07E0B00326614D034
        44E0DF5D3F69006E4F04BAFC69B33F80A10128BA28048F074000C0BCAE2C4E6B
        000380276E3B15FCF5CF4FCA3703801200189B2EE05811081760E4010C1750D7
        4450413EF4F9927CF0F3550D1D69F6B5F1B5E5FB8F4C051F1487FCF8ABE765C1
        DF956860FE0611480B600070F906002C0B7003007001B5A62D0CEC9B008C0F00
        189800BCFFC400880380EFF8C201482696F402B9186407806DE21C0EAFE6CC8F
        04005660AB7627008CE5157001AF79E99D0390EDC4E4D25A41DEF7E95DF8FC81
        91F573396D33DFA965DFC7650169811251B7FCFCF72C4B7EBB24A9D8E21D0140
        4DD487064827BF700068014E260A2000DF757E2202032A02373413782002CD28
        A0B6A5005822B05CB82CE9CCAA848249ED78C1AE57142C8D46490784FDF5F880
        D3DA20A2ADDBBDB93F9F15B6ECBAB55176C99BDEFDC42D9783AD624DAEC9A7A2
        3EC4D41D736070836EB7B99C2BBAA0C2D66D6CBDE2F5FAE5F31B7C46467EDFDA
        74C2996EA57D9DB6C13FAA38C45A07188EB910352B5FFF9C80ECAF97642EB38C
        F7B2F20000404C004C117810051080B32A905BDC1D1C5F9E84814313006B2DE0
        B008EC6941AD2E425103C44ED2051080EF3C3F15066EE055FC00A03115061E06
        A052B82299D973BAA59AB57FACF4E5562ADE304DBFF6D9D52DD661DD5FCFCE9F
        9D6E57BB6C7090372ACEDB02606C2BD1523D30A9E11F1F5B11E4B09583594BBD
        563188F569FCFB26836F82C75639BFF46FEF9301B77DE56B3237B33CB100CCEB
        3B5D88022206006BD71FD55D418C3276F7AEE1FBF3BA1BBA56CD2A00B4007505
        C02E02A3461808009CB63CC0D00C036310D90AC0872F9F0C00BFF69D8C020EBB
        000B004304CE9A2E60CB7401661E20FB84A410DB726F20451157C8583B50ABE7
        D5F4FBD86B1F83C64E1ADC07506F34216A465A62CDB5024DC4FCFE6D00600E86
        BD1C6C6495848D8FAF0BB45E6752063605C34DCBC2CCF7A2F6F891579F97E79C
        0F4B7E7D4FFB041200EE99F0990078DC215D14E2E2D793973F2DCBCBF7682670
        63F3315959BD57BBA8B2FF412AB670872270A44BF25C6F5117709200386D3581
        B71B0514724FC0E72E00026346B00E8E7904FA3CB78B71734C1342C9445C6BEA
        1905B0032837767AF1DFB7AA6EF98FBFF7F8ED15859A6561D6468EC91EBFDBA8
        0914AB16D0FCE666036F0DBEB6DEC4E03FFB424C7EF43577493D579566B5A22D
        DE5813D8D644505813412C066541881311CE13D73E232BCB77EB4CDEDD853B58
        382FE5CAAEB00167C41FD156B07513808C9507B0016034CA325CC0F0501470ED
        64EA019E0A00E5C2554DBC1002A3C5FB40DC7818EC094000D8589A8E3A0EFFC8
        B8B9D9C2352266E62652976320BB353F0078ECB6CBC2AD62CDC9F7B7F1E1B07F
        778B7DA793E253B3146C31ED92FFFC1DF788976D6B7335E9C1441F0F405CFDFE
        D5B57F90A5C5BB00805BF2C57544482B9283168845E7347338C0EB723570D8A9
        4A32754A178C1CDEB09E43C054B005002DE9606402103F6100DEF1DD176E1081
        562690DDBA121600B503009CDA2B784BBB7EF146B8850914689F3DD6BC419B69
        550C67137BE8B083187719B1556CABC12365FAB2D78ADE110027F971B059D470
        2F4B198FFCC757A7241E9E9146AEAF5BD8BB13009635AA6197B17AEB0080F1C8
        29D7D61E92A5A5BBD4056C6E3F2E0BEC99B4FD84CC67CE890BC2B48FF0B7D580
        6E80BB0C86D2BADD4C601D6AAD9AF60C20382C082100FDC972F04903F05D176E
        19064E8B4097B68861E998033779514F0D1B0DBB207DD67401227E5A80F148FB
        E8B15B1861626FDC16FD9EA327D976FCB65DC0890CBA35E32D00CCC1FFAA67CF
        C96B5EEC161F42D54123642E610F0E01C0CD9E01763A6F030077501B5DB303F9
        E6D6A3B2BC74B702707DFDF3B272EA1ED9841638BDFA1C3D0EAF03F7C76E605E
        FC7782C396792E44516C15C3CE610C69057A891B6BFB5A1164BA80BF3D410D70
        1C00ECB9DB6875B57182910A3E00C0A9DBC3D75591AFACDCAF9B1FB9E73FCDB6
        6895AC7828026901407C1C0AB9D1307A0FF2671D3C34F6EED96BC5E4C13B04E0
        D63B836E73E0E560738965F2D371AFFCE0373F53EE3B1D96C2D693D22C7624E0
        4BD84E0D6B68383B3FC3E65755DDFBCF56353CBA86F500EC75B803BFBFBC7C2F
        00F02800CB2B77CBF6D66372E6ECF3A4D7694A0702B8D9C8890FCFD3E70EC022
        400F8566140026A5F83E74059CF57DB8805ECF02E08BE1026C008C1005F47B55
        35DB8CEDB9D6CD2880CDA25D0E1B006CB2B07C3F6EAA689E17B024E5EABEB68B
        D7AE9BA099C91A1EF458AD56B5E28831B4830735346288026E5304DA66AB7DF0
        EE74D0C5261E2DB3BF9CF6C8BFFCF288FCCF5F7911F7169566BE2485FD35ED6B
        C45674130010BAF11EB92F808D207CECECD52A690F23167EB2EB3913412B2BF7
        6A526867FF09C9644ECBFAC6C372D7F99768E97767C092B0BCF81C2E6D53D767
        CE22382365E8269FCBA93B84065DB6A09B931EF453577707CFCBFB3F79F5E4F2
        00EF78C38106308A423764EC80588350E1CE20165FF294CE6E634B7CF089143B
        2E0B00BCD3CA2200681635D44BC697A40200DC1850F60E604FDC4432ADFDFD2B
        50D16C44D9ED55B407E14E1300DC8605F8C27606DD38FAFCC2EAE1D579BFA423
        6E39BD1897E7DD7F4A62E31DCCCE9EF8BD29710C02DAB4B95CD9B601E0352D40
        5D7BF6CCCF9ED27D826C1EC1F305B907527B22C2C26DC2DFAFACDCA72D6E1AED
        82B695BD7EF53372DF3D5FADDBE3B44D1CC2641F5C80CFE7D776393E58801284
        A11BF7CDF719E07D52B1798D18D89E9661E0FBFF16009C9405F8755800230A88
        192230BBAE00B0BB47470130AA82FB8D6DF147E6349D6B588035ED48B4BC6402
        808793E49E77EBC00813807892859B2D58808A6E3CE976AB188D0E2C400400DC
        4E22C818E817DF1F95973DFFB4F45B3C02160F0BF40522493D088AA77D363168
        A1C432DEB3ACA9D7506C49FADD82FEB7AF78EEF3F4D816FE8E97A792F4DC3A4B
        A3B89ECDF5AB18BCBA716A5990E15717566C53010859008C069AEDECE11E17E6
        4FEBF637EE08E6492011F3CC84065E635B01B85FCBD6BBFD3AE2F959B97EE5D3
        72DFBD5FAD83D9C5B510006A001F44E1806713863252AC17353BC95D4E23C4FE
        EC42D2B134409C16E0DA09E601A00198080A860F03D02600BDBE1E12C1C30B68
        0102E1230098B8800300D8F59B670C323F906177EE1E1E6AA57C08802D00F0A6
        DB02C01067AF7C714ABEE92B2E4A2DBBA9B7C6B580783CADC26988C12A16D624
        3D7B1162AA267BFB5B726AF55918D85D69B75AB208BFBCBBB5ADE55921BF47BB
        A0B110369D9CC120E6A45ADBD7668F7140C35472A9BCA1E084E0F298D21EE9A9
        610D8D7616E6CF4A4E4F4F4968B97788ADF2F4E8BCBA6C4D00A8E3D9552582F0
        EFFA95BF07005F7373006A3C6A4FB4D2793C68498C670AC05DB01E20A661E0DA
        A5B7FCC94900C0D5C0EF325C406802C0860940057E0BB1BD3F211128DE667D13
        BF33AF0B3196061839E0434D17A08B41C9450C744EBCACB537FBE7703F3DD700
        CAE5A276C6520046B000CD5B5B00FBCEA0573C909457BFE4825476376C8B41A9
        090039C4DDB3B3E7C5396EC1176FC9EAE9FBB4C339BB7AAC2034DB2FE4B54397
        CFEB5085CD86D15CA8AA54AA522CB1962021F1E892CEF65205EF4117104C1B4B
        D832D4AC1C45202D40AEB0650050DED73D00AC8AA208DCDE2100CFD07E023C7B
        3082A8687DEDB372F7C5AF921E5C409799C07AD10640FF10000EFC9CE70746E1
        8EEB6DC3E2A4D22B270880E902F8CC43E1F8610010E3F2C13ABC718986C2522F
        AF4B38BA707B00B84D0010F3CFB0873F06EBA900609485A7E4D52F3D1E806269
        4773126E69C9267EE7CCE9674AA3BA2D4DE88FD3A7EED37D011D2871B76B04DF
        3BD6E360D9FDA48150B754DE46281741C8BAA0F50AC701D05100CE68D514BBAB
        5B00B04906CD3E5DC0322C800100B78ECD43173C8A6B793E5CD314003ED30204
        337A0CED01007D890423DA44B23F684348AECA1FFECDD54BBFF067D74FC602BC
        E3BBEF7A908F9A1680A9DC5C1E373F362C007DD2D81D954434220D0010082DAA
        FF55115833A380C5671C88402E0757735A68C1A4460B16400118D1029470B370
        019D0A5E9F5140547EE2760030EBF15EF9404A5E031750D9E1F539B46975C22C
        0963BEA1562BE3F5931058702FFBDB3AE88D1A5C40BB23A756EED18A20AE188E
        011F2D00758F71A095E0BF6DEA495D89F88AAE64164BEB6A0982818C3E422B0C
        54113807000A9B802589AFDBBA00C6338187BDB15CDB7848D702B879B503D063
        10703B3B4FCAEAEAB365D06E9ABD820B2A02B962D9570066F4AC45EEA12000C2
        45B590911C62D4914A9F92F7FDF51397FEAF3F5F3F9992B05F7F0301900900D4
        0023D302E892A4232CE95814E674537CC10555E1AE4322F0593AD3FBF05DC924
        A280B2110672F70D0B45E63163588BC7068A461EA08C87DC95ED7A4CDEF4FBB7
        06E0605F80090066370520EB022D0BC0DF6476CEE54128EBEECB5E212B0BB367
        A40B25CEF381E6E64E41D835B546BFDFAF696918570293C9B436C3D8DFBF8250
        D78DD976567F5E285ED71C465035801905740FA200EEEFA366623B1C6E0B632F
        3F19B9E5EAF54F436FDCA3AE862230129997DDED4700C0736101DADA29B4D130
        A2002F42EB0E5ECF1F9A83B9AFA9559D0010E45942552DB4CD6400C0C79FBCF4
        8B7FB676421A00168035757401D30038F5549DB0A42200A0B9859B9E87D912C3
        0554D6B431FDF2D23331FBB27ADE1FE3DE7C6ECD586B77B1C944595697EFD6BE
        BF6C09CBDDC7AC7E753B87B2510DC3023CF6050170B02FC00060ACDBAE4B9A5E
        F57B067A3ED1ECCC29589B92F6ECCD6496700D23D503C351D3E8D98F414DA717
        B423DAEEEE13DADA2E9339AF4BD9B70280E71CF903616D86CD4DA1D4039A0ABE
        FE1959020014840CA3E38925D9DEBC244B0BF769A9384F0C69340BE2C740B376
        A105911C04244DC0E1C03D1C0900DCDAFBFEE60900700216C01081175503842D
        0D903300E0BABE1793AB3D8AC02441D1377760F6E6B59CCA6102C0BF5B2200E5
        1DCD6B2F2CDE23FB7B97B5E72F8F45EDE1219C3FFBE5DA63970D14FD81387C5C
        5BDBC8AD55FCF2C6DF7DF40E004803800B4702400D40339E499EC66BF7B52298
        7B03BA9D82F6EB9F8190EAF79D1A8E8EF1AC78BC2B9B55D23D8DC75CB97B52DC
        36008AC5358D020EE5011480D604003DF2AE55D54DA1A1507C02806101EA7079
        7B32BF7851F6762F6B6B789F2FA26704DB01689B00342600B81480285EAF86D7
        66222D955C91F77CFCD14BBFF4175B27650100801C0F400B00C4C201E9D4E0EF
        A28BD21FD9017080F86748A9B0A1E67EF5EC730D00701D34FB7C68F7DEFD224D
        9CB05D3C93437C886100B5510DC883FFCF23B70FC08B01C04B8F0780ED5D5389
        5378BD9E6E0D9F8578EA758A7A80F44C7A5901E089A34E581F56E870756F7666
        F98E0060366F7E764553C104801541BCA7B01D80A5BB3587B083815F82202CE4
        AF4B34CCD672008600C05D065CC701E016C7B0ABE71AD30250872413CBF2EEBF
        BC74E9AD1FDB393900F88B41138042CEC803346D00242341286A285F84498391
        E902AA8CC787B8E1676ADF60A6452F9C7F1144CF1378185DED083A1AF4E5EEBB
        5FA84D9473855D843E613CF01E1E5848AE973DF2E07FBF7D005EF592B48681D5
        63002855F7B4F9228F8ACBB13FFFEC59D500550090310168755B1A81D0250DA1
        B0676696844729D0051C0540682A13682C06AD68BFDF40D0B0006E77C0580D1C
        BB2600B81C6E59A7E95700D634234800B839B4AE2290E5E86C82DD90109E691D
        D1C901003D0978035261AD005C692AB52ABFFF979FBFF4B68F9E1000EF000062
        5980704A5BB28FC701DC5CD900601C960C344015A22F1259D6430E8D7A802B50
        CE0159847F2B16AE635695E4FC85076467FB313DC183871E716BD8DD77BD40EA
        7860FBFB5B080DFD6A3D6291B8AC959CF2E3BFF3F93B030016A0BA6303206E00
        C0440DCFEC8DC767C5091FBFBD8728E0F433A4D3CCE901531975012EDC135D40
        4B53B5D4006CF3361AD1023C0E01E98258BCA8D7903735802682C4580BE8E19E
        980798850568DA00F00080B02E07038035688025A320E4FAF58764E5F4B330A1
        AE0380593D1584AABF8DBF11AA7F8F4FB3ADDC6ED762C774FC4C4BC20070800D
        A6112E3AF05CD2A9D3F2FB1F03002765016E05407B1C9178382CADFA06005852
        11A800140180E728001EC7C3AAE8C031C378FEDCB3B5290245208F7B65A68DCD
        23D7CA4EF9B1777DEE8E005017700400FCCD7A9DE63426E37E53B676AECAC50B
        2FD083AD687DD2F0A3030C347DBFD3D9875EE9EA00736751AF47D1B7AE277627
        13AB10AF0803F1EFD170608AC029006801CC9230BA49EE0AB600B872ED53C662
        90D30B17F0A42C2C00D872564F23F3F9231ACEB26896EDE263E18C946BFBE2F4
        27B409179781ED005479BAE8170380DF78C3C507C7130D9006B1307F8EC0C405
        B447614304362002A30BA058F440A55AE59AEEB15B5CBA5F5D0063FE73175E24
        5B5B8F4807F030871FF007E4F4EA7D522AE73043CB7A4C8B2E1B2733B25171DF
        1100AF0400AFFDCABBA4B4BDAE10321FC1C31E2D002834B99EC185269E46CE45
        19EE12A2BF9F4953B8F5F4E04797B38B19DCD0F5854C7A16D7E38275DB550BC0
        B0CDE524001B5A047214003300A06302D068629278C2FAEC64EC94F5AD473121
        CEEA82D9E6E6A3B2BC7A9FE645C6B86096AC1B358139A32A18D7A447D3F8E27A
        6E9040F1B38E800078F19C582FC87B4BA501C0471F0200BB5F4A0020DE9ADB12
        8E1C0050AF5CD7DCB50500934167CE3C4FB6B62F499F072372310503727AF55E
        29954C00BC01CD18B2EBC846C503001EBE2300BED504A03F050019E0EE1F9A59
        2E35EFE57665056A9CFB0459A8C190305FAAAAE9F7E359B3EB37AB8CB96BA95A
        6FE8EA5F241495587449750DD70258BC7A6B002ABA52CAAC20077D170278062E
        82DF6F6C3C021770BFAE8E7267506AD21FC00020993CA547D3B802096DC02108
        31290C9D782F9EE25AAD17B4F7602ABDFAC5022061E4014C000EA200E60122D2
        6E6C4228DA0158D305150B8006883D7DE63920FF12C45F533500C3235A807269
        0F22ADA40746F0A2D844E14A6E203FF6DB770AC0DD00E03AAEC1794804328FC1
        03A55883371AD4657BF7BA9C3BF71C98DF2D157CA7CF3C43B2B99C56E7FA7D2E
        4D08F14278F8752EBB2B85F2A69E7FC8C653DC9C4900D8D9C31E05F47A355DD2
        9D014C1DDD1B183400700280E88D00ECED5D91B9C5F300206B6E0D5B35CBC273
        3202000900C0338A9D6A013CB0126D0D293DDC588BFBE649263C15250900DEFD
        D187BFB400C44350B0CDAD290BB08E87EF96B9F97B10061E07002CC0A9FB1106
        16E18B793CAC53D3B633A9457932D77D5A01D8CFAE6170CEE10FDADAC97B45E3
        F182FA7DA66F0BA5B29E59C85DBE74015E8F17AA7F5176F73760A10800BB9DAC
        EAC68CA703801CC45F06EF7B330078348D8B554730FD8C4A789E8257B7298DE0
        96F6D512244E1A80776826F0667980B02415806D8D59ED16806BF10B4BF74D5C
        C0EA690B80B6FA5016999C3BC313B31BF077452D80A07CCB0080CB7708C0AB4C
        000A006068F6084A1C02605D174E06BD2AE2F3A6FAD8666D4F8F9F3BBD7ABF64
        F379B5006E8F711238CFF9E13AFECEEEBA2667580F108B2EEAE1D15C0C3AAA20
        A4678A40635FC06100B8AB8779FF99D9651B00674D00BA13002C17300D006B06
        B9D9C4EF72E8EE295656790000F70FFCEE971A80B4BA802DF185E6F0F01D8701
        58BC1F267E5DA380E5E567CA2644E02100CE3E5B674E514F07EBAB11E0AAA101
        C0437794082200C51D680F9EAE675B0DB400E0291CCCFE757B437CBFA41A80D0
        71AF60B154D6BA04B77B24ED6613D71693582C86415BD74D2DC92463F5846E71
        2B57368DD5C02F21001513809402F0B9130C03DF70D7412208616041C3405B22
        0861601A6120D702BC81D9498FA062EE712D869845EC5CC58D5018CDCF9E937D
        DCF870D0D264098F463B77EECBF4D4CD4221ABC2901B33D95CF24AB627FFFE4E
        0078C08802CA98B1E34941486AB239740F00703978DC479CCDC31821AC86B006
        3E7F50CFED29962B3AF33D040096201860014842D6371FD713CA78DAA83F9030
        8EB3A91A00187900634B3BF733707D9E671212000F01C033724B40BB84B141C4
        CEF68D00B04086BD8DD3491B003D36993C25051300075CE9C00C03796A180FD4
        D43D9618184D04210C7CEB47B7BFB800703998FD6EFBE3A8A4A3911B00C8671F
        D3CC5B343AA7E7DEB282687EFEBC5A106E6AACD78D2E59E7CE7DB96EA1DA4768
        E6D07268AF1ED27839DB957FF77F3F34E9D1E33EA2458B0260750A7D20736B00
        E24BD26AEC4B2892912E42AF61B7A2CD1CF9600BC5924601C1904F7BFB05FC31
        09043CB2B57B15EF0F539B9A870F8E6806532D8099083A5410D26BEB89A84F19
        00588014E2FB3ADCA678A35A2DCC9E094EB6AB03002CA96FE2F9432CE812F5EF
        33157CA20038A653C101CDED3356EE8FB91C1CD328C01B9C9BF409CCEF3FAA8D
        2283A1B8F6086C35CB06000068D86B69FE9F009C3701D883DA76BBFD50BA1EED
        B17B79BF2B3FF25B0600468B9683BEBDF60F0B806F7869465DC02100620700D0
        054409407D07A67D010F10B1FEB021AB2A422BB000256DF410F4F9D412C458ED
        EC1AC9CEDE35BC3F004014E0C1607096972B5B88C747664188C704E0200CE4D2
        3337C534757B7840CBC9E802B68F70016C11379888C0DE0100E933526B14C4E9
        8901D6BE6EADE319892EE9890FEE8989382E0C31B2F9BD8F5DBAF4B69302E037
        BEE72E2D09B36A020BD90300F4740F570CBE1616A07A3B009C83A9DFD4BC36B3
        7F2C7DBE70E1B95ADF5E2C1754BC0D7800732426EB25A7FC3000609326A35DAB
        C3B400476C0F871BF8C6AF9891D77DD5CD018831D9D2CA19CBD245F629E8EA19
        062C1661BF00A6B1C37AD2775701188D5B5A05CD4329E996DC1EA373B7020025
        1E0CDC2100DB8FCBCCDC2913806B00E09CD60EE8265908E82F1400C3059C9006
        78E7F7DEFD20957990E7DE008052D60A03CB7AE10E775C176F2802FD4700A06B
        FC00A00B9335337B5ECAE54D3D13885DB199D8B878E1797AAC6CB19CD705132E
        C372376D3C9A124F1097141949690F7A22B5AC5BCD87F0E1BA2FA1CBD335218A
        7C6969C194372A79F1E2B24B5A12E6304BC2D287C2C0182C00BB84B15D7CAE88
        30CAD99305E8927AA3A6075772AB364BB11CC2EA1F16AB16B5B29700B0D791C7
        06803886470060848104C06702E0540012BA3DFCDA95CF222A32F606EEC21ACC
        2F5F54005854EB7587F4089A7A2D2B0E88E47862591B441C0D40425AEDB28AE9
        64F2B4BCFB2F3F7F72CBC1EFFC9EBBB520641A001673B072C6ED4DC2173215BC
        2DFEF00100E5FC159D45CCBEB16EAFDFAD491A71380F47E8768ABA1BE8300005
        BD9C116601073A114B68D1086BE9D8502982D70A070246DBF4B157CBB7C2A180
        1ECA58E7FA7AB5AC0734349BB9A700C0C004C0A57B1EBBBDB209800B267A5101
        60DE801AC06102602D0619CBC12DCD2AB6CD3CC0010071DD3E77F9F2DF694918
        D7020A8575894394968B9B3AD8544E6DB8970642D39037641C180971ECF42701
        78D3D0002600DE605C21230089D48ABCF7E38F5FFAC53F3DA18AA0777E8F1106
        4E03C0D2AD4E6FA06E21E00D4A8716C004C0E518A928743A7C128270746A2283
        276ACF68751057032902A9F82F5E78BE2A5CEE0CE231F4B4003E8F4F1F9A56C5
        E046B334DF311EDEFCA505C0EB350028956F04C048051F4E044D0370E5F2A7B4
        22484567610D00AC4A8DCBD489332A2279EA3835410C6E93828FDAC6139CD745
        21972680E00A21FC68555B66DB1D86810AC0D3541276E8DC400B00D1B2705304
        9A00F43B1590D9D766053E0F5C024420EBD78C5EC1435D1DF4B81162C5E6F5E2
        B9CECF737059F5CAC24B964B8DA0A8EFBAEB01CD0970B58E0B893DD0CEBD73F4
        DF348DDC589AC57BB2843A0497C092B1910940E42900902FF2A1DE0100C945F1
        233220002C0A2500012D0A3D1E007B1E80A7AB6EAC7D4E6621843993F30020C1
        1E000020193FA593A0D9A94A1D51017B2BD1E4B358D605A1A97D9598227388EE
        0B0823B26238CAAE2171445AEFFB9B272FFDC2D3706EE00D27871E0B007EB50F
        5FDC622F7EC4D05E3F34407D7DA201D80CBA59DDD0D53DB68961750D4D188F41
        654A984517D55A5167FB3D773FA0B574150C208F8FE7691A0CC79885E3614BDC
        2EBD9F5BD7B386837035C34153CF29EC763A12FA2200C0CA5EA6B4B916E0F3C5
        14BC72715D35C0ED039054C859519DC918A960038053B0263B92499DC1606252
        B44AD2ACB393E95DC682199EFBD015D66216AFDBAB96943B9BA2B1452DB86538
        1D8DCC02802B977EFEC34FDA01A005B8E393436F383B18009C7DE7F7DEF54626
        772745A17900300E4C3687D2343B60DEBAF5C316A051E721D17E3C900BD2C303
        E161CB5CFCE1EE1B5E4BA35ED181BF78D70BF56679C2662098D14C1BFD5B2C9E
        D1B6EA9D168B450C171008062002793A971F03D9D6439AF5351B0DDD59C4416B
        36F7F4FC4105209EBA110044013CAB275F3001406442EB532CE5B55DBCDF0420
        1EB35B00B736B9A45FD64450794305F06100CCB580CC294D0AF96C798028AEA3
        49C84A3B32BF70C606C0AA2E35A7E24C51B7A5DA2A02F8922C2FDC8FAF593D35
        74E80A49BEB2A76E9196D10060419B53D11AC601C37BFFFA49F608B200B05CC0
        2DCF0EB68E8EF7E8133DE2F4F058C073EA3D3F70EF7F3636879A1600000C46F8
        D541554F0CE1B627B6316FD5EC000C70035B9AB0E076AA4EC7E813C8F8BB0673
        06998B8168E28137E4DCD92FD7FC7A951640E3EC1666774BF71C321A60850C3B
        6A71734590A76FF6B956FFC502A0225984AD5614E0F545756F201787B87328C0
        54B0786F0B00EE05C817B600C069AD0DC817D6D53DF294B059D30210804EBBAA
        55C215581987DB234E6F4A72E56DF102009E4534EA56D5050C46437D167CA6EF
        FBEB8905B89906181C0780DB04605A03247C2EE7E2FB7EE8193FE3F3B053680C
        263EA5F50043B232AC234CE9DA9A441979008718C7C75303B0D29539ED7623AF
        B17E6AE68C54403301E9C197B233C8B973CFD205A01A44A138FC3AC3D856361C
        4E4A4C4FDCA8C174AEE9F62A6A02EE8E1588CB4EA78BC1F7A90B68B41AEA0238
        682D1B00F1A9D5C0B8E902664C174011383FE5022C00789E5FB74BF7B369B800
        0B0044296500C082CC50303D01A06B02608F022C1710C57574DA0020BF257300
        A00FF14CD3CFF506A6C1E99206DD8EF60422F0CB0BF7205ADAD2ECA1D34700B6
        D405B0C054060D58E2A49E533C84056597B0DFFBD8930FBDF5CF747770598ED7
        00C71E1FEF315D40D804206207E05DFFEBBDFF7B32E2B92D009CFE59F1385DEA
        029AB50D6D0993804869F0F47098F9D9B9BB317B36B4F2763018AB923D7BE699
        2A122B1526828CC1E29A803F105517C0DFC94103701F3CFDF3100FC0213EDDD0
        F1C50680164A01D0C5A081B939F4CE016836EAAA853C7AAEA143572609003B8A
        B0A31A81A8B21AC80200C07900007B2A38862DB5AC9C2443760BC175FDEA072F
        FDEDBB3EB9F15BE6EC2F99E6DF02A06533FF3700E09AD20021D305C44D0096DE
        F2DA0BFFC7C5A5E061001C417501B566EF10002EFFCCA45368257F19266E0E00
        2C494D178340F6F29769193453AC9CC5DC35BCB272514D2CCBC28643A7A683C7
        8EB19ABC7028AC61201B29692AD6E3D770C9E964BAF61F2F008D7A5D2DE200AF
        150A65B45FD20833BAA93B8C6129719D7568033904804F1B4939864D5D94B203
        F0E06F7EEA4FFFEA4AFE3DE6E05BC7C7376C1AC0B2000CB486D316C07201019B
        05B0DC40EA3F7DDD99B7BEE4FEF80480627E5DBA439778E0C76B0DA35DB9266C
        60F20D00CC3671FB972409B2F9D06B30FBDCF4C912F17CFE9AB68A75B9032AF0
        1697CE688AB7C25430C411CBA8B9CCC3620702C019A12E001A803D84061600B4
        004100006DD268DE1A80AC6A80650C44D60480AD62BB8700E84FA200B7094009
        FA634B01481E0940C6561276B820C448059761DD420020A9001400C0AC5A8086
        EA1EA67A138915F1F9C332EEF735114417188FCC4803CADF02200F00E802B8CB
        480E01D0164F7056FECDDB3EFE47970B8D3FB60150B301D0BD19004E9B08F41F
        05C06BBF6CEE17BFEB5F2D7802105BDC5C59829069365B9A9461ABD8287C352D
        407B0A8062F651A8DCE509009D4E0516E059522CD0058C3419C29CFBC2C2AAC6
        BCD56A495D80DBE3C5430500882C989767868D0B4886D8F4C17534F03BD000B0
        003CE38F750A7502502EEB1EBCA70500C4E91A063E8D00703F208F8951170041
        C833028A7087B49009086516C376C788FDF135E48FC085E66E0B80B582577EEE
        0F1FFEEF6B95F69F1F0140CB16050CCDCF81C334FD4E9B15B02C40D074013113
        82D4F31763FFE5C7BF7179662633233E00C01C7EAD5AC0CD87140076C06014D0
        A96F4103A46F01C09761A076F05046DACB978A7A6E6E550555AD5A844974E9CC
        570030DBB9ED9C26912E808D91D8278F00B0368E0919F6F60F47121A0594CA25
        BC5706001CE4016E1F80BA1400C0C05A0BC0FBD002745A04005180DBAD1AC4FB
        0503C028A00600760C00DA2DE9773A5A6ECEE217969BB3E0A3371E6AB12933AB
        AD464E0B419CBEB40270A0019AE283DBB300F8A34F55E5830F6DBF75AFDEF9FB
        A910D00E40DF06C0F028007CB648C00E40E21933E11FFAFAE726EF7BF97356B4
        594187D53BB0023CFB4E01D0B4254F0E5D134F606E024029F7A8C461DE786A48
        A3965511380F755B2AED2A009CA5A34117C2F094E6FFB93C3C1838270D9E2820
        63D1A89E4F98E3E0018031DE87790096457317CEAD01484F01703815ECA106E0
        8A5CBD8AC1C8E939C37E849ACCDA31F1C49AC1FDEC96EED2B100186332550100
        3B9A064C00C6472482ECAB813C1E8E339B2B92B300BE0577D0830B636D21CF38
        4EC64E69DFDFDE8800F4705F61CD032006540BC0A2542F2686D74B00DABA8B9A
        00D41A4DF9C5F7AFCBC3FBB5FFD8EC0DD7CCC1B742C0BACDFF1F0B803D17E033
        5D8025043512389708BCF274D2FFAA1FFB960BDAD2847BFA72D92BF83E23F556
        57CD3401A8959F145F68E5C002E41E81193DA5A786B431934838172EB8114245
        207F6F34C6602CA8B0ABD5B92DDBA91B2E986409861218C098AE1BE474299700
        78B44DDA040075014F1580B3260079FCCD484520336E3C92B50500F6F60080C7
        AD1D39E9029CD03E0480D6C20F001C3701401B633B8C8210EA166E8BCBB08FA0
        0940B1BCAE5BE613B115BC5E1B1AA0A3D9D148802EA3A816403C512D4BA76B64
        E369072C20CBF35998F2A79FD9928F7EBE5400006F3493405606D01E02F64D08
        38F8232B0AE0E08B4D045A0058B9002B148CA702EE7BCFC4020F7EEDF366E57F
        7AE0A256C0ECEF5D9570346D14752026E54247BD764DBC81850300F61FD15427
        57BA78338C59F97D15D6C0E518AA3F67CE6036330F055DD5644CAF6FF4C2E375
        8608001E1C7710330C5400842E003E501F6E0BE6DA8B999AD2064C2CE86037AE
        3B4F059B0094F230EB23CC32AFAE5EEA31B308CB76F7D6C5C7E610314303389C
        03CD04F6755F8001C0B18B416C176F03801D425810D22400F8645D5F14962699
        3432811D9E128E81E5A9A13C429EFB2A7AF8BB0A04210FA1E4190B43B8D2487C
        5ECA08C1DFF29EC7A4DCEA7DE28962EB9DB6F8DF8A005A260056083834BF9ABD
        910F5C80CB04C03B1509586E20FEACD9F04F053CAE8537BEFECB259348CBEECE
        635ACF57AE6461A6F1105C21E9347660AE921300AA85CB6A31E2C91505801680
        75F515AE6C6116391CC611AD130020C47AB40030832C18614B741686B4614619
        0530DC61C8450DE057F30A103058B1784AA38062E90B03809B44B93FB0542A6A
        BDA10F6EA5CB763678C80CD576F7AEEBCF5816CEE5E031845AA5B2A116207848
        031CB71610344AC2B428F4092D0B673552139387D5452E3C83B9A5FB6588BFED
        0D7B1A8A46E0FEB87CCEE6D9033C4FAE10721388C3960A7ED79FAFC9A5B5926C
        D63A6F2EB4FA9FB3997F0B002B01640760680120C700605F169E40703AE6FFFA
        94CFF34D739990FCFBD7BD58F23B0FC302A430682D330AF04D89C081B4341114
        0300A78E06606201160E00183AB5DC9AF5763C1A8D8DA4594994D328605E6740
        1F003023C848C4EFF56150934F19804AA5A265E95E987ABF3F286DF62FD45470
        4B7676AF4B10AE86EDD85C9E88BA804AF97601A8E279840040F406006A953CCC
        BAC748FD9E7AAE0C3A0DE9300B0A0B900CCF68AB1C5D1EC7736AB4CA5A09C5D5
        C151BF260FAF3BE5437FB723FDF168F7F3B9C64F4E0DFEB4F9EFD9348076D599
        06C012825E9B1508CBC1BA40CCE570CC3C231DFA1987C319FDB28B73F22FEFE3
        22505A9AFDB1362CE260560B8F8B3FBCA2F96A6B39986702DC1100031300E800
        9AF6783CAE2962169272358E7FC3162E7E2F4FE3800B8005883F0500AC4450A9
        02B59FDFD1D78BC0FCB6DB755D596441C63E7E1E0AFA217AE1EADC614033BC6D
        00B8E1859D42635A16EE9D00504744C0554E2EB0312C5E597D0100A86B6BD90E
        E09BCB9C9376A300CDE3D2C5201EAAC59A0C5A87CB1B0579EF274ADA2E7EBFD9
        FBCD9D46F76353833FADFE278B40D30038A60070DB00B06B0142905C0AFBBE3A
        13F0BE9E25DACF3EE39357BC046AB63F0200611D98E2DE43128E5F54AAD91F80
        F5015E6FD8580B68997D0201007BEE396D00CC64E63584A21FE78E1EEEB86158
        9888A7D502303F400BC06D5A024BC3B500B650ABD305C034B3F69F30144B052D
        E3E28E5F0230184E6F0C59336A02DB050070C606C0795D89DCDB07B07EBEDE82
        6EEB264C8C787208DD4281800483F0E3184C463095C9CEA0C399C0DE2413C866
        D151CDFCB10682DBCC5D2EAF6C6D3D66440100AB093822F105D9DE7C48CE9DFF
        4AB5004DFC1DB38869EAA66641F704BA037471251DA4AB7B0D79F75F6D432B8C
        602D46EB8F141A3F33A5FC9B7238FD6B9FFD4373DCC7F6AA4ABB1B985E190CDA
        2C816A81BB93A11F0CFBDCF73AA1D24FCD87E4150FCCC94C22AE8359DA7B5842
        F10B0A80AE06D636F140635AB478A700B066309148AB0864FBB83C66492A352B
        C331C2C461176199576BF71981842371EDEDC3923276D16E36F6B5E67F603B34
        6A02004FE5E81415805C615F0F8D5A40186800B00EE51E404836AF333191C868
        99377FAE5A03AFEDA6089CB8805B011047E40161EC8DE1DAE7268744300A6021
        6B919DC46091B6B61E96F3E75F2AFD36071F10B46A9A5DA50618F2DCE3D0AC36
        8DF8CC9365F9C867735AB98CFFEB5C2FB7DE5CE9F69F3067FE74EEDF9AFD5611
        8815018CED1AC06E052C1D300D41D80641CCE37264EECB44FE835BC673EC049E
        8C78E5752F3F278B998494F63F27A1D8790540CF0CCA3FA962858B4137034045
        206E96C998FEC8899B8305181C580036762816B6310049DD73E0839F66CB396E
        E0E4CC0A8578147B010FAEA305247401865894497F007625DBDEBDA6D7D3EF16
        4D0BB0A7C7C7CFC31D142B4558991D4D0231AAE140F0B5B9656D777FCDD01A31
        230CBC130058F9EBF5C4155E2AFA5289AA3FADE55ED9EC556D12C5DDD2A7CFBC
        10EABEA97FC76DDFC9C82C7EC7A9E7070C9C61F9C027AEC8672E973579361A8F
        463BF5EE3BF61ADD4F4E99FD69E53F0D801C0780058105C051AE60A209A23EF7
        D9F371FF8F8EC411D232351894E7DF3B2BCF5DA96BF18705407EFFF35AAF168F
        5B51404BF3DE06004618C8DAA10C2D40B7AA00B02C9C510053B2495A0044016C
        1F57286EC10447B5942A1209C38C73B6B0F1E4AC6EBDA6501B0CBDC265EBF1A8
        AD8B432CE1A605E0C3E633D8CF6EE0E217A5DFCBC30F9FD559EF738FB5F376B9
        5AC3BFF312F07BB5A103EB11980924082C48A50588461106FA08405F01180E06
        531AC09E09648FA004FEF6FA2100AA107EA14842774D67B39775A7D2CEF623B2
        B8F80C71E239B6E0DE582FC11E4041FCFDDF3D99933F7F28279546CFDC013596
        42ABF781EBD5F6FB6DB3DE1AFCE9F2AFE9D97F2400762BE0961BF30247598248
        D2EFBEB814F17F9FC7E94869676E2814F6FFBD6F3521F79D49C985C5A0540A8F
        6A13C3DB02801B361B6C1BE3D207ABCD8F92293D6BA7522903823D5D09648228
        114F00988EF6F3A1508B221AD9D87A1CAF1781782B491282AB5CDD954068494F
        23E1CDB12085CBCDD1F8322C005BC49DD3E65001CF58D7D62BB53A6627D3DB5E
        6D7CCDD62CA9D4A2967FEDEF5F53AD117B5A00C80180A40240F1174564938325
        E0EE1ED655320F707D7757AE6CF7E5E18DA694EA1DDD5FC98FD17034CAB57A7F
        7CBDD2FEE01183DF92C3619F7DF027EADF3EE0D30058D9416B91C8238717892C
        4B30B1067EB773F65C22F0FD1E87F38C75DECEC83C5387AD604FCF3864653626
        F31998696F4FFCEE816E13E33AB8430140B4C01DBC899456FAD28F8FB82F0011
        007BFAC43053989665070F9688F1F278FC5C22CE76B21DFDFD4432A399C07DC4
        EA0E57586AD57D688A25AD3CF621240D06037ADB9D6E5D77FBB019F5A05F9114
        4456A30531893B64CAB9DE6C69455230E0D32C2073F83C88818733164BDBDA23
        301C4488CB820C3C57EA0C462B3E6F7CD22C9AC7B770252F8168A50FD7C183A0
        5802C63A4746341C489E97E4679712FC8FC5A041847B4F5C5F1737C0CA95FA72
        79A72265CCF681794C896BCC3396353DDE43BCFF9BBBF5CEA76D836E7DB66D9F
        7DDBA735F30F99FFA30098D602D6A73D376041604F1485101EC656A2FEAF8BF9
        DC2F833BF0D2448D55838B56D2D26C799CC6316C23C350184A643436BED75E3E
        23E3F0469ECE2DC6695CBC52FD9B91711298C3E5D01D423C2A8D90F170472E18
        71270FB508CBB3D81ED63939E3D7B8A1A1D9499CADD6DDFA20C71348B9D79027
        A1E87B984F4005A39E053CD406D6FCA16E4B3326A1F1B7784F6D76CD5DBAE6C6
        54E3571DB6DD4BA2D734397D8CEFEFB44E45D50CB8F603E2EB398D5F3066A0CB
        31B927875E37E01DC9931B95F6BBCB9DFEDA94B9B74C7E470E56FC8E1AFC43B3
        FF38009CB69FDB4BC52C3D6041608160C1A055443E973305105EE5773B9ECBE7
        C88341DD6E97FA2C0F07D76500607D8C140087DEA8980FC169963D5B033236FB
        E3F3575831C40738D4E737D207C50FC6C223F3EBE404D0C9F631E390A7A1BEBE
        43F7185AC7CCF22B0756211C1D3C15A3AFF0181A64A8AF29FABEF874588DA98D
        AF6E974381353A958FCC7B3300705BD7A62F6C1D50E9302784364FD0D7A19AD7
        4659BADDDB34C178AF8109687730DAC935BB7F8858FF9239D0F610AF2D076ADF
        52FC56C58F1D8043BEFF5616E028776017861604768B10B281110AB89D9974C0
        FB82A0DB714FD8EB3E8D87EFF47050387BCDA7A7B5ED23635086E6818FD6A64F
        56028D47C6CCA31D188D8C333FD84ECEE5709AB377AC6D55B5746C649E10C299
        C81D819CAD16D16A758CFF4EC008806E246523682D3851D3A4FF3627F0E490E8
        7EDF00006F69346976184B27D6E114D6F55887475B707300B9D9C5619E5A3234
        FFC8691E424D58143AD30258F76E584D7E9572BD3778BCD0EA7F0A62EF097370
        FFDFEEAE6DA761188626ED68C50312BFC0FF7F19122F202198C61296A6A73DF3
        EC264502A158B292B95DD2F9F89286527F50CBA06BE0F3A26FD9F8B1C0B6649C
        0EF0F028D201AF0DEEC91886D918463A67781C0F4F17A5DC3D8C87F41AF13E26
        F87311A62E293A57FCCC0E8B50880A5D28D088FABE782D0094E66680DD52D1CB
        ADFF3E3EA700BC4D3CCD35A50DB75615CD05A13328D357524AF0D93DA73414B2
        167AA54611E6C775426D93F72005CCE0E3683F154C5E7E439853513C9EE3CBC5
        18DEDE4FE7E7CFAFF0EAD6DDBB2331877AC838DF57835F63009A11C83B041801
        B68F4762DE4F18DCF5B3073D4519AFCCFDF745017F97A2D20730819881440BA0
        B1A397FA72836797E7836A2200B76C04DC67A0197C702F18EB0CB47EE37A5A24
        CD00D0E24FB59CC701FAC9D9DE8E7335E0771980947B83AD8830B86B03B1C0D7
        2200CFBDAFC8DFFF27ED77C90880BEBC779720F30A1FF2A08C55D4A3AF3CE6DD
        B62168C6C006D039DBF32DEF6F2D1A44E37374B79180419706C072BEBDE33462
        CD79432525D74602F96C61A77C066B63D45E4F2BA44501690800973988633817
        64DEEE5954AB70AFB4CCECD956DFCAF9350BD156281AB2D29A407AB8043A18E3
        15698FA2B568C07DCD20A44C9EFF93EB6889AC489028383D3D5811431BB3487B
        156FE5692D9FFB0DB91CABB5055F2D693AD02242DC90F37765BF48DF2EB24A25
        3244913E0000000049454E44AE426082}
      ShowHint = True
      Transparent = True
      ExplicitTop = 75
    end
    object UText7: TUText
      AlignWithMargins = True
      Left = 15
      Top = 894
      Width = 220
      Height = 28
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 0
      Margins.Bottom = 5
      Align = alTop
      Caption = 'About this app'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ThemeManager = UThemeManager1
      TextKind = tkHeading
      ExplicitWidth = 130
    end
    object UText8: TUText
      AlignWithMargins = True
      Left = 15
      Top = 927
      Width = 220
      Height = 17
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 5
      Align = alTop
      Caption = 'App version: 3.5-alpha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6710886
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      ThemeManager = UThemeManager1
      TextKind = tkDescription
      ExplicitWidth = 131
    end
    object UText9: TUText
      AlignWithMargins = True
      Left = 15
      Top = 949
      Width = 220
      Height = 17
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 5
      Align = alTop
      Caption = 'Flash version: 32.0.0.136'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6710886
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      ThemeManager = UThemeManager1
      TextKind = tkDescription
      ExplicitWidth = 140
    end
    object UText10: TUText
      AlignWithMargins = True
      Left = 15
      Top = 971
      Width = 220
      Height = 17
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 5
      Align = alTop
      Caption = 'Chromium version: 71.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6710886
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      ThemeManager = UThemeManager1
      TextKind = tkDescription
      ExplicitWidth = 137
    end
    object UHyperLink1: TUHyperLink
      AlignWithMargins = True
      Left = 15
      Top = 1038
      Width = 220
      Height = 17
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 10
      Align = alTop
      Caption = 'https://embarcadero.com/'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 14120960
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ThemeManager = UThemeManager1
      URL = 'https://embarcadero.com/'
      ExplicitWidth = 154
    end
    object UCheckBox3: TUCheckBox
      AlignWithMargins = True
      Left = 15
      Top = 472
      Width = 220
      Height = 24
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 5
      ThemeManager = UThemeManager1
      Text = 'Keep my email in private'
      AllowGrayed = True
      CustomActiveColor = 14120960
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 50
      ExplicitTop = 360
      ExplicitWidth = 200
    end
    object UText11: TUText
      AlignWithMargins = True
      Left = 15
      Top = 48
      Width = 220
      Height = 17
      Margins.Left = 0
      Margins.Top = 10
      Margins.Right = 0
      Margins.Bottom = 10
      Align = alTop
      Caption = 'App settings'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      ThemeManager = UThemeManager1
      TextKind = tkEntry
      ExplicitWidth = 77
    end
    object URadioButton4: TURadioButton
      AlignWithMargins = True
      Left = 15
      Top = 75
      Width = 220
      Height = 24
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 5
      ThemeManager = UThemeManager1
      IsChecked = True
      Group = 'AppTheme'
      CustomActiveColor = 14120960
      Text = 'Use system setting'
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = URadioButton4Click
      ExplicitTop = 59
    end
    object URadioButton5: TURadioButton
      AlignWithMargins = True
      Left = 15
      Top = 104
      Width = 220
      Height = 24
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 5
      ThemeManager = UThemeManager1
      Group = 'AppTheme'
      CustomActiveColor = 14120960
      Text = 'Light'
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = URadioButton5Click
      ExplicitTop = 88
    end
    object URadioButton6: TURadioButton
      AlignWithMargins = True
      Left = 15
      Top = 133
      Width = 220
      Height = 24
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 5
      ThemeManager = UThemeManager1
      Group = 'AppTheme'
      CustomActiveColor = 14120960
      Text = 'Dark'
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = URadioButton6Click
      ExplicitTop = 117
    end
    object UText12: TUText
      AlignWithMargins = True
      Left = 15
      Top = 207
      Width = 220
      Height = 17
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 10
      Align = alTop
      Caption = 'Click to change accent color'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6710886
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ThemeManager = UThemeManager1
      TextKind = tkDescription
      ExplicitWidth = 163
    end
    object UCheckBox4: TUCheckBox
      AlignWithMargins = True
      Left = 15
      Top = 234
      Width = 220
      Height = 24
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 10
      ThemeManager = UThemeManager1
      Text = 'Color on window border'
      CustomActiveColor = 14120960
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = UCheckBox4Click
      ExplicitTop = 229
    end
    object UButton1: TUButton
      AlignWithMargins = True
      Left = 15
      Top = 535
      Width = 220
      Height = 30
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 10
      ThemeManager = UThemeManager1
      Text = 'Delete my account'
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 0
      ExplicitWidth = 203
    end
    object UButton2: TUButton
      AlignWithMargins = True
      Left = 15
      Top = 998
      Width = 220
      Height = 30
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 10
      ThemeManager = UThemeManager1
      Text = 'Check for update'
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 1
      ExplicitWidth = 203
    end
    object UButton3: TUButton
      AlignWithMargins = True
      Left = 15
      Top = 743
      Width = 220
      Height = 30
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 10
      ThemeManager = UThemeManager1
      Text = 'Upgrade now'
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 2
      ExplicitWidth = 203
    end
    object UPanel1: TUPanel
      AlignWithMargins = True
      Left = 15
      Top = 167
      Width = 220
      Height = 35
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 5
      CustomTextColor = clWhite
      CustomBackColor = 14120960
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Accent color'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
      OnClick = UPanel1Click
      ExplicitWidth = 203
    end
  end
  object buttonCustomColor: TUButton
    Left = 60
    Top = 380
    Width = 151
    Height = 30
    Text = 'Custom button'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 13
  end
  object captionbarNewStyle: TUCaptionBar
    Left = 0
    Top = 0
    Width = 1074
    Height = 32
    ThemeManager = UThemeManager1
    Align = alTop
    Alignment = taLeftJustify
    Caption = '   This is NEW style TUCaptionBar (use 3 spaces for left align)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object UThemeManager1: TUThemeManager
    CustomColor = clGreen
    Left = 720
    Top = 40
  end
  object ColorDialog1: TColorDialog
    Ctl3D = False
    Color = 14120960
    Left = 720
    Top = 100
  end
end

object FormDemo: TFormDemo
  Left = 0
  Top = 0
  Caption = 'Test UCL controls'
  ClientHeight = 662
  ClientWidth = 1041
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
  object textTitle: TUText
    Left = 60
    Top = 100
    Width = 132
    Height = 38
    Caption = 'This is title'
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
    Top = 140
    Width = 128
    Height = 28
    Caption = 'This is heading'
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
    Top = 180
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
    Top = 210
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
    Top = 240
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
    Top = 270
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
    CustomTextColors.None = 14120960
    CustomTextColors.Hover = clGray
    CustomTextColors.Press = clMedGray
    CustomTextColors.Disabled = clMedGray
    CustomTextColors.Focused = 14120960
    URL = 'https://embarcadero.com/'
  end
  object linkCustomColor: TUHyperLink
    Left = 60
    Top = 300
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
    CustomTextColors.None = 8951296
    CustomTextColors.Hover = clGray
    CustomTextColors.Press = clGreen
    CustomTextColors.Disabled = clMedGray
    CustomTextColors.Focused = 8951296
    URL = 'https://embarcadero.com/'
  end
  object linkDisabled: TUHyperLink
    Left = 60
    Top = 330
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
    ButtonState = csDisabled
    CustomTextColors.None = 14120960
    CustomTextColors.Hover = clGray
    CustomTextColors.Press = clMedGray
    CustomTextColors.Disabled = clMedGray
    CustomTextColors.Focused = 14120960
    URL = 'https://embarcadero.com/'
  end
  object progressCustomColor: TUProgressBar
    Left = 290
    Top = 220
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
    Top = 200
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
    Top = 200
    Width = 5
    Height = 91
    ThemeManager = UThemeManager1
    Value = 45
    Orientation = oVertical
    CustomForeColor = 2469894
    CustomBackColor = 15132390
  end
  object check3State: TUCheckBox
    Left = 390
    Top = 490
    Width = 200
    Height = 30
    ThemeManager = UThemeManager1
    Text = '3-state checkbox'
    AllowGrayed = True
    CustomActiveColor = 14120960
    IconFont.Charset = DEFAULT_CHARSET
    IconFont.Color = clWindowText
    IconFont.Height = -20
    IconFont.Name = 'Segoe MDL2 Assets'
    IconFont.Style = []
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object check2State: TUCheckBox
    Left = 390
    Top = 460
    Width = 200
    Height = 30
    ThemeManager = UThemeManager1
    Text = '2-state checkbox'
    CustomActiveColor = 14120960
    IconFont.Charset = DEFAULT_CHARSET
    IconFont.Color = clWindowText
    IconFont.Height = -20
    IconFont.Name = 'Segoe MDL2 Assets'
    IconFont.Style = []
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object radioA1: TURadioButton
    Left = 390
    Top = 290
    Width = 191
    Height = 30
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    ThemeManager = UThemeManager1
    Group = 'GroupA'
    CustomActiveColor = 14120960
    Text = 'Radio 1A'
    IconFont.Charset = DEFAULT_CHARSET
    IconFont.Color = clWindowText
    IconFont.Height = -20
    IconFont.Name = 'Segoe MDL2 Assets'
    IconFont.Style = []
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object radioA2: TURadioButton
    Left = 390
    Top = 320
    Width = 191
    Height = 30
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    ThemeManager = UThemeManager1
    IsChecked = True
    Group = 'GroupA'
    CustomActiveColor = 14120960
    Text = 'Radio 2A'
    IconFont.Charset = DEFAULT_CHARSET
    IconFont.Color = clWindowText
    IconFont.Height = -20
    IconFont.Name = 'Segoe MDL2 Assets'
    IconFont.Style = []
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object radioB1: TURadioButton
    Left = 390
    Top = 390
    Width = 181
    Height = 30
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    ThemeManager = UThemeManager1
    Group = 'GroupB'
    CustomActiveColor = 14120960
    Text = 'Radio 1B'
    IconFont.Charset = DEFAULT_CHARSET
    IconFont.Color = clWindowText
    IconFont.Height = -20
    IconFont.Name = 'Segoe MDL2 Assets'
    IconFont.Style = []
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object radioA3: TURadioButton
    Left = 390
    Top = 350
    Width = 191
    Height = 30
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    ThemeManager = UThemeManager1
    Group = 'GroupA'
    CustomActiveColor = 14120960
    Text = 'Radio 3A'
    IconFont.Charset = DEFAULT_CHARSET
    IconFont.Color = clWindowText
    IconFont.Height = -20
    IconFont.Name = 'Segoe MDL2 Assets'
    IconFont.Style = []
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object radioB2: TURadioButton
    Left = 390
    Top = 420
    Width = 181
    Height = 30
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    ThemeManager = UThemeManager1
    IsChecked = True
    Group = 'GroupB'
    CustomActiveColor = 14120960
    Text = 'Radio 2B'
    IconFont.Charset = DEFAULT_CHARSET
    IconFont.Color = clWindowText
    IconFont.Height = -20
    IconFont.Name = 'Segoe MDL2 Assets'
    IconFont.Style = []
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object symbolbuttonSaveVert: TUSymbolButton
    Left = 60
    Top = 490
    Width = 61
    Height = 91
    ThemeManager = UThemeManager1
    SymbolFont.Charset = DEFAULT_CHARSET
    SymbolFont.Color = clWindowText
    SymbolFont.Height = -16
    SymbolFont.Name = 'Segoe MDL2 Assets'
    SymbolFont.Style = []
    TextFont.Charset = DEFAULT_CHARSET
    TextFont.Color = clBlack
    TextFont.Height = -13
    TextFont.Name = 'Segoe UI'
    TextFont.Style = []
    DetailFont.Charset = DEFAULT_CHARSET
    DetailFont.Color = clWindowText
    DetailFont.Height = -13
    DetailFont.Name = 'Segoe UI'
    DetailFont.Style = []
    Orientation = oVertical
    SymbolChar = #57696
    Text = 'New'
    Detail = 'Ctrl+N'
    TabOrder = 10
    TabStop = True
    OnClick = symbolbuttonSaveVertClick
  end
  object symbolbuttonSaveHorz: TUSymbolButton
    Left = 130
    Top = 540
    Width = 241
    Height = 41
    ThemeManager = UThemeManager1
    SymbolFont.Charset = DEFAULT_CHARSET
    SymbolFont.Color = clWindowText
    SymbolFont.Height = -16
    SymbolFont.Name = 'Segoe MDL2 Assets'
    SymbolFont.Style = []
    TextFont.Charset = DEFAULT_CHARSET
    TextFont.Color = clBlack
    TextFont.Height = -13
    TextFont.Name = 'Segoe UI'
    TextFont.Style = []
    DetailFont.Charset = DEFAULT_CHARSET
    DetailFont.Color = clWindowText
    DetailFont.Height = -13
    DetailFont.Name = 'Segoe UI'
    DetailFont.Style = []
    SymbolChar = #57605
    Text = 'Save file (toggle button)'
    Detail = 'Ctrl+S'
    IsToggleButton = True
    ParentShowHint = False
    ShowHint = False
    TabOrder = 12
    TabStop = True
  end
  object symbolButtonOpenDisabled: TUSymbolButton
    Left = 130
    Top = 490
    Width = 241
    Height = 41
    ThemeManager = UThemeManager1
    SymbolFont.Charset = DEFAULT_CHARSET
    SymbolFont.Color = clWindowText
    SymbolFont.Height = -16
    SymbolFont.Name = 'Segoe MDL2 Assets'
    SymbolFont.Style = []
    TextFont.Charset = DEFAULT_CHARSET
    TextFont.Color = 6710886
    TextFont.Height = -13
    TextFont.Name = 'Segoe UI'
    TextFont.Style = []
    DetailFont.Charset = DEFAULT_CHARSET
    DetailFont.Color = clWindowText
    DetailFont.Height = -13
    DetailFont.Name = 'Segoe UI'
    DetailFont.Style = []
    ButtonState = csDisabled
    Enabled = False
    SymbolChar = #60739
    Text = 'Open file (disabled)'
    Detail = 'Ctrl+O'
    TabOrder = 13
    TabStop = True
  end
  object buttonReloadSettings: TUSymbolButton
    Left = 220
    Top = 440
    Width = 151
    Height = 31
    ThemeManager = UThemeManager1
    SymbolFont.Charset = DEFAULT_CHARSET
    SymbolFont.Color = clWindowText
    SymbolFont.Height = -16
    SymbolFont.Name = 'Segoe MDL2 Assets'
    SymbolFont.Style = []
    TextFont.Charset = DEFAULT_CHARSET
    TextFont.Color = clBlack
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
    TabOrder = 16
    TabStop = True
    OnClick = buttonReloadSettingsClick
  end
  object buttonCustomColor: TUButton
    Left = 60
    Top = 440
    Width = 151
    Height = 30
    CustomBorderColors.None = 15132390
    CustomBorderColors.Hover = 14120960
    CustomBorderColors.Press = clBlue
    CustomBorderColors.Disabled = clGray
    CustomBorderColors.Focused = 14120960
    CustomBackColors.None = 15132390
    CustomBackColors.Hover = 14120960
    CustomBackColors.Press = clBlue
    CustomBackColors.Disabled = clGray
    CustomBackColors.Focused = 14120960
    CustomTextColors.Hover = clWhite
    CustomTextColors.Press = clWhite
    CustomTextColors.Disabled = clGray
    Text = 'Custom button'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    TabStop = True
  end
  object buttonRunning: TButton
    Left = 280
    Top = 110
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
    Top = 630
    Width = 1041
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
    Top = 360
    Width = 150
    Height = 30
    ThemeManager = UThemeManager1
    CustomBorderColors.None = 15921906
    CustomBorderColors.Hover = 15132390
    CustomBorderColors.Press = 13421772
    CustomBorderColors.Disabled = 15921906
    CustomBorderColors.Focused = 15921906
    CustomBackColors.None = 15921906
    CustomBackColors.Hover = 15132390
    CustomBackColors.Press = 13421772
    CustomBackColors.Disabled = 15921906
    CustomBackColors.Focused = 15921906
    CustomTextColors.Disabled = clGray
    Text = 'TUButton no focus'
    AllowFocus = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TabStop = True
  end
  object buttonDisabled: TUButton
    Left = 220
    Top = 360
    Width = 150
    Height = 30
    ThemeManager = UThemeManager1
    CustomBorderColors.None = 15921906
    CustomBorderColors.Hover = 15132390
    CustomBorderColors.Press = 13421772
    CustomBorderColors.Disabled = 15921906
    CustomBorderColors.Focused = 15921906
    CustomBackColors.None = 15921906
    CustomBackColors.Hover = 15132390
    CustomBackColors.Press = 13421772
    CustomBackColors.Disabled = 15921906
    CustomBackColors.Focused = 15921906
    CustomTextColors.Disabled = clGray
    ButtonState = csDisabled
    Enabled = False
    Text = 'TUButton (disabled)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 6710886
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TabStop = True
  end
  object buttonAniStart: TButton
    Left = 280
    Top = 150
    Width = 151
    Height = 25
    Caption = 'Start animation'
    TabOrder = 3
    OnClick = buttonAniStartClick
  end
  object buttonRandomProgress: TUButton
    Left = 290
    Top = 240
    Width = 221
    Height = 30
    ThemeManager = UThemeManager1
    CustomBorderColors.None = 15921906
    CustomBorderColors.Hover = 15132390
    CustomBorderColors.Press = 13421772
    CustomBorderColors.Disabled = 15921906
    CustomBorderColors.Focused = 15921906
    CustomBackColors.None = 15921906
    CustomBackColors.Hover = 15132390
    CustomBackColors.Press = 13421772
    CustomBackColors.Disabled = 15921906
    CustomBackColors.Focused = 15921906
    CustomTextColors.Disabled = clGray
    Text = 'Random TUProgressBar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    TabStop = True
    OnClick = buttonRandomProgressClick
  end
  object buttonAniInverse: TButton
    Left = 440
    Top = 150
    Width = 141
    Height = 25
    Caption = 'Reserve animation'
    TabOrder = 5
    OnClick = buttonAniInverseClick
  end
  object buttonCanFocus: TUButton
    Left = 60
    Top = 400
    Width = 150
    Height = 30
    ThemeManager = UThemeManager1
    CustomBorderColors.None = 15921906
    CustomBorderColors.Hover = 15132390
    CustomBorderColors.Press = 13421772
    CustomBorderColors.Disabled = 15921906
    CustomBorderColors.Focused = 15921906
    CustomBackColors.None = 15921906
    CustomBackColors.Hover = 15132390
    CustomBackColors.Press = 13421772
    CustomBackColors.Disabled = 15921906
    CustomBackColors.Focused = 15921906
    CustomTextColors.Disabled = clGray
    Text = 'TUButton can focus'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    TabStop = True
  end
  object buttonHighlight: TUButton
    Left = 220
    Top = 400
    Width = 150
    Height = 30
    ThemeManager = UThemeManager1
    CustomBorderColors.None = 15921906
    CustomBorderColors.Hover = 15132390
    CustomBorderColors.Press = 13421772
    CustomBorderColors.Disabled = 15921906
    CustomBorderColors.Focused = 15921906
    CustomBackColors.None = 15921906
    CustomBackColors.Hover = 15132390
    CustomBackColors.Press = 13421772
    CustomBackColors.Disabled = 15921906
    CustomBackColors.Focused = 15921906
    CustomTextColors.Disabled = clGray
    Text = 'TUButton highlight'
    Highlight = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    TabStop = True
  end
  object drawerNavigation: TUPanel
    Left = 0
    Top = 93
    Width = 40
    Height = 537
    ThemeManager = UThemeManager1
    CustomTextColor = clBlack
    CustomBackColor = 15132390
    Align = alLeft
    BevelOuter = bvNone
    DoubleBuffered = False
    FullRepaint = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 8
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
      TextFont.Color = clBlack
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
      TabOrder = 0
      TabStop = True
      OnClick = buttonOpenMenuClick
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
      TextFont.Color = clBlack
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
      TabOrder = 1
      TabStop = True
      OnClick = buttonMenuSettingsClick
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
      TextFont.Color = clBlack
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
      TabOrder = 2
      TabStop = True
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
      TextFont.Color = clBlack
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
      TabOrder = 3
      TabStop = True
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
      TextFont.Color = clBlack
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
      TabOrder = 4
      TabStop = True
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
      TextFont.Color = clBlack
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
      TabOrder = 5
      TabStop = True
    end
  end
  object boxSmoothScrolling: TUScrollBox
    Left = 791
    Top = 93
    Width = 250
    Height = 537
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
    TabOrder = 9
    ThemeManager = UThemeManager1
    object UText1: TUText
      AlignWithMargins = True
      Left = 15
      Top = 5
      Width = 203
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
      Top = 277
      Width = 203
      Height = 17
      Margins.Left = 0
      Margins.Top = 10
      Margins.Right = 0
      Margins.Bottom = 10
      Align = alTop
      Caption = 'User profile'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      ThemeManager = UThemeManager1
      TextKind = tkEntry
      ExplicitWidth = 69
    end
    object UCheckBox1: TUCheckBox
      Left = 15
      Top = 426
      Width = 203
      Height = 30
      ThemeManager = UThemeManager1
      Text = 'Auto sync your data'
      CustomActiveColor = 14120960
      IconFont.Charset = DEFAULT_CHARSET
      IconFont.Color = clWindowText
      IconFont.Height = -20
      IconFont.Name = 'Segoe MDL2 Assets'
      IconFont.Style = []
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitTop = 99
    end
    object UCheckBox2: TUCheckBox
      Left = 15
      Top = 486
      Width = 203
      Height = 30
      ThemeManager = UThemeManager1
      Text = 'Send me email'
      CustomActiveColor = 14120960
      IconFont.Charset = DEFAULT_CHARSET
      IconFont.Color = clWindowText
      IconFont.Height = -20
      IconFont.Name = 'Segoe MDL2 Assets'
      IconFont.Style = []
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitTop = 169
    end
    object UText3: TUText
      AlignWithMargins = True
      Left = 15
      Top = 571
      Width = 203
      Height = 17
      Margins.Left = 0
      Margins.Top = 10
      Margins.Right = 0
      Margins.Bottom = 10
      Align = alTop
      Caption = 'Account'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      ThemeManager = UThemeManager1
      TextKind = tkEntry
      ExplicitWidth = 50
    end
    object URadioButton1: TURadioButton
      Left = 15
      Top = 598
      Width = 203
      Height = 30
      ThemeManager = UThemeManager1
      IsChecked = True
      Group = 'AccountType'
      CustomActiveColor = 14120960
      Text = 'Free user'
      IconFont.Charset = DEFAULT_CHARSET
      IconFont.Color = clWindowText
      IconFont.Height = -20
      IconFont.Name = 'Segoe MDL2 Assets'
      IconFont.Style = []
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitTop = 264
    end
    object URadioButton2: TURadioButton
      Left = 15
      Top = 628
      Width = 203
      Height = 30
      ThemeManager = UThemeManager1
      Group = 'AccountType'
      CustomActiveColor = 14120960
      Text = 'Professional user'
      IconFont.Charset = DEFAULT_CHARSET
      IconFont.Color = clWindowText
      IconFont.Height = -20
      IconFont.Name = 'Segoe MDL2 Assets'
      IconFont.Style = []
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitTop = 288
    end
    object URadioButton3: TURadioButton
      Left = 15
      Top = 658
      Width = 203
      Height = 30
      ThemeManager = UThemeManager1
      Group = 'AccountType'
      CustomActiveColor = 14120960
      Text = 'Developer'
      IconFont.Charset = DEFAULT_CHARSET
      IconFont.Color = clWindowText
      IconFont.Height = -20
      IconFont.Name = 'Segoe MDL2 Assets'
      IconFont.Style = []
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitTop = 318
    end
    object UText4: TUText
      AlignWithMargins = True
      Left = 15
      Top = 693
      Width = 203
      Height = 34
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 10
      Align = alTop
      Caption = 'Upgrade to Developer account to get more features'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6710886
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      ThemeManager = UThemeManager1
      TextKind = tkDescription
      ExplicitWidth = 201
    end
    object UText5: TUText
      AlignWithMargins = True
      Left = 15
      Top = 787
      Width = 203
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
      Top = 809
      Width = 203
      Height = 34
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 10
      Align = alTop
      Caption = 'Your are using 3/5 GB of free cloud storage'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6710886
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      ThemeManager = UThemeManager1
      TextKind = tkDescription
      ExplicitWidth = 174
    end
    object UProgressBar1: TUProgressBar
      AlignWithMargins = True
      Left = 15
      Top = 853
      Width = 203
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
      ExplicitTop = 294
      ExplicitWidth = 220
    end
    object Image1: TImage
      AlignWithMargins = True
      Left = 15
      Top = 304
      Width = 203
      Height = 72
      Hint = 'Click to change avatar'
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 10
      Align = alTop
      Center = True
      ParentShowHint = False
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000480000
        0048080600000055EDB347000000017352474200AECE1CE90000000467414D41
        0000B18F0BFC6105000000097048597300000EC300000EC301C76FA864000008
        2E4944415478DAED9A0970146516C7FF3D3D992B9923072831864384284B0A36
        1CD140C0C8E19AB8B05B2052E8A26C59BA5A78E0011E55C1F2C2C28896552AEA
        EEBA029607EE0202CAA19022501A02AB22A0820221971C93CC91C95C3DEDFBBA
        C34064263D81E00C93FE57A552F3F537D3FDFDE6BDFF7B5F4F7350D5A9B8785F
        40A24B05A42015908254400A5201294805A42015908254400A5201294805A420
        15908254400A5201292822205104B777614EBA1782C6A4E7C4785FE48594C727
        7206F0A1210BEB9A390E67AD3522A0EFCA7332F421EF6E9D46B405042435A014
        1E5C40E09A3D41D31FF317D536C70468DF73D9993A8FB7364D071301420A42F1
        5EC70551001A06086E3F5ABDBC29F70F4FD5D9BB00C87750CF8B361F01724127
        214A16C36229A1A13F33FCD013201F459097370E8C19504D799F2CABE03F98C6
        0BD626C1803F0B37C0013D4D4E8E4812098F0D5EACE137E012DE0B77906FB10B
        FA81A317359CEC12203301AA2740638529F088063A22C47B6DDD241EA99C17DB
        F8D5C82640AEF301D44080AE136E828333D2EC24F16B91834D6CC316FE13F4E9
        16408152386C9702563310BAC8D34C43EED3E282CDD1882D29EBBB11507A1F20
        DD9A1C80EC0ED85A1A2E00209BE5E200449D2E8201EA4F749101353B7B302051
        F6C9FCACDEF8B6E1A80C89415101B5CBD38AF9D796E0D9C2623C53B3032FEEDA
        0137BB668E5301A1AD15A58387626DE9F4F0D07D559BF1EACE2AC060ECE1807C
        5EE4F5BA14D5D36F8759A79786AA1AEB50BAFA3D3805E1749A253420E60F4290
        FA34EDE990EF0E0502B0EA0DA89E3107836C19D2509DDB85111FFC13BFB4BA3A
        9A75C20262DF22BDF74A32CF03277E91219D699EE7AA90207DF6A75367E186DC
        01D2909F5E8FFDEF3254D71D3E9D5A090DC8EB85C96040C5D8499873553E2ABE
        A9C6E3E40D922295E258C522D2EBC1920937E181FC91F26B8ACCD99FAFC5BB5F
        5703A6D4B3DF935080D85C6F1B0A73FBE3CD92320CCDEC153EF459EDCFB863D3
        1A34395BCEFE96631555AC3B0BAEC19BE3FF1486B3F8FF5FE1D12FD6014653E4
        344E184001BFF46FFE88223C53381EDA08E954EB7662F6C6D5D87AE840F40545
        539B07C5FD0761CBD499D070F267AF3BF213CA56AD00B429D1D337EE80DAC3BE
        5F666FBC71DD8D98DCEE0B4CCC38DFDE5383B9C30B91D91E35219AFF30A5DB92
        9AEDF2C2B45A65387E1F72C98C6B6E9E835E0C2CE987163B4691293B7D3E4ADB
        94E8EF8D2B2056A1FC7ECC1C321CAF8E9B1C86C0B4F6F041DC4DA15F7FBC0979
        97F5C5F2C953514065F99456FCB8573AEEA69484DE10FD1CC1200C3C8F1DD3EF
        C0F05E9748436E3AE7A895EF60FFB1C6CEDF1B5740B430B331154B8A27E2EF57
        0F0B0F0768FE633BB6A062D7763985588F42738DF4FFF5921B313B2F3F3C77CF
        C9E3B875E32A798B1029E5D8B929753F289B819B07E6C9B70669CA94F52BB166
        FFB7914D392100313FE87B05969694222F3DB3C382EFA48AF2D5D143B460763F
        E90C5F60D146FDCBFDE4512F8D99403E225F8A9BC6FEB1753D96EFD92DC3A468
        098B4C7961F164948F2CA24C16891F87C7BFACC4F3DBA9229AD294E1C405107D
        A34F8E2AC6D385E33A0C2FFD6E37E66DDB040F75B851C39EF915C11D4F66BB6C
        D214E4A499C3875EFE66271EDAB691DA1C3A9F9E40B5BA31636801DEA779A72A
        D67B07F661D6DA0FE5E35C8C3DD5EF0E880C73DE8831A8282A915E9EA0F499BB
        F533BCBFEF6B8A009DDC102A894C3DDB9A81FFD0E227E4F40B0F5736D44A55EE
        48533D0A060C46D55F6F83A1DDC4779197157DF46FF818C0588C3D6E80D8B749
        51B29C3688032C36CCDAF03F1C3A798C7A9B2E966DD616D0FC8AB113316FD8E8
        F07093C78D0514894F8C1E872BDBB711C729EA467CF82FD452E542FBBE2B7101
        31D19896BC422058225BE8B976C76CDB405DF7AD944AAC45488D50AE595B5042
        1BD0CA9F7F948DBCAB8A5B153B357EDEFB2B8A488F07C3B22FA756E02F189291
        2545A954B028C2EEA9DC80D76BAA6237E58401D4DDA2B4B55084BC757D1995F4
        ABA4A1D7C8F8EF254F92B626E77A3720690031B1FBCAB4337F967C6954EF6C4C
        A2D4926EA89E59FA7B342026312475CF52A5620541731E709212900489C58D18
        7BAF93908084187F9666DED11D37CA2E2640EC436C7AF67043E7C6C98E3A6863
        19F42BECB8930A10454E3A559B9A69B3914ED54514A3FF7ECFCAF4519713B7D0
        8674BFFD786C5D762202B22F1D606DA9731C366B055BBD60C4187F19DC19D951
        01D952D3D0F0B77B618CB1F26E6AACC7A48FDF8D4F14B5033237D7A34AB70ED9
        7C1B03D46CC94AEF9775FF41674C80D6CFCDC8C935897BD3F890457A3E283811
        4EF6F082C52C5795DF006211B473DAED946606889D3CB1C752F0A8DB81991B56
        E17BFB89AEEDA1BA4BCCE81D2E581D8D58A3DD2C3F1F24F08EBD2D183263A9BD
        BE5340E55743E7CFE4176B386E9A46C3B1BB59D2032F2EA440641F1CB13913A5
        855B084E2C01E4220F6A250F32C4CB83A44BA66BA62FDA8C8074CD221B09898D
        B4555AD9DF233C72D72E3A1009D0FC22FE158B91BBAF95B653BEA01C0AECC14F
        AD0441ECE47C2202A1F0FDABE8F3E88FA7095A4DFC1FE6632B0A4AAB92AF45AF
        0597465B4887577CF9852AE1C1B3009517C0D466D41ED16A90150C25F793ADD1
        446BE784108EF983C17E4BBE445B07400B462253D4697FA246D52AF450403C03
        24A03920040712207B0740E585C8F0F2DA5AB2865421417F7EFF1D002110848B
        92AFEFA22A347700B4600CD243A2B68622C816EAA111441D00476BB7FBF8E0C8
        572AD1D20110DBE92C98000BE78546CFF74C403E818A9B01A1459BE1E470AA48
        A9EA542A2005A98014A40252900A48412A2005A98014A40252900A48412A2005
        A98014A40252900A48412A2005FD0ACC37D794B0EDAE810000000049454E44AE
        426082}
      ShowHint = True
      Transparent = True
    end
    object UText7: TUText
      AlignWithMargins = True
      Left = 15
      Top = 888
      Width = 203
      Height = 28
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 0
      Margins.Bottom = 5
      Align = alTop
      Caption = 'About'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ThemeManager = UThemeManager1
      TextKind = tkHeading
      ExplicitWidth = 55
    end
    object UText8: TUText
      AlignWithMargins = True
      Left = 15
      Top = 966
      Width = 203
      Height = 17
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 5
      Align = alTop
      Caption = 'App version: 1.1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6710886
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      ThemeManager = UThemeManager1
      TextKind = tkDescription
      ExplicitWidth = 94
    end
    object UText9: TUText
      AlignWithMargins = True
      Left = 15
      Top = 988
      Width = 203
      Height = 17
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 5
      Align = alTop
      Caption = 'Flash version: 31.0.0.14'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6710886
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      ThemeManager = UThemeManager1
      TextKind = tkDescription
      ExplicitWidth = 133
    end
    object UText10: TUText
      AlignWithMargins = True
      Left = 15
      Top = 1010
      Width = 203
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
      Top = 1032
      Width = 203
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
      CustomTextColors.None = 14120960
      CustomTextColors.Hover = clGray
      CustomTextColors.Press = clMedGray
      CustomTextColors.Disabled = clMedGray
      CustomTextColors.Focused = 14120960
      URL = 'https://embarcadero.com/'
      ExplicitWidth = 154
    end
    object UCheckBox3: TUCheckBox
      Left = 15
      Top = 456
      Width = 203
      Height = 30
      ThemeManager = UThemeManager1
      Text = 'Keep my email in private'
      CustomActiveColor = 14120960
      IconFont.Charset = DEFAULT_CHARSET
      IconFont.Color = clWindowText
      IconFont.Height = -20
      IconFont.Name = 'Segoe MDL2 Assets'
      IconFont.Style = []
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitTop = 134
    end
    object UText11: TUText
      AlignWithMargins = True
      Left = 15
      Top = 48
      Width = 203
      Height = 17
      Margins.Left = 0
      Margins.Top = 10
      Margins.Right = 0
      Margins.Bottom = 10
      Align = alTop
      Caption = 'App theme'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      ThemeManager = UThemeManager1
      TextKind = tkEntry
      ExplicitWidth = 68
    end
    object URadioButton4: TURadioButton
      Left = 15
      Top = 75
      Width = 203
      Height = 30
      ThemeManager = UThemeManager1
      IsChecked = True
      Group = 'AppTheme'
      CustomActiveColor = 14120960
      Text = 'Use system setting'
      IconFont.Charset = DEFAULT_CHARSET
      IconFont.Color = clWindowText
      IconFont.Height = -20
      IconFont.Name = 'Segoe MDL2 Assets'
      IconFont.Style = []
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = URadioButton4Click
    end
    object URadioButton5: TURadioButton
      Left = 15
      Top = 105
      Width = 203
      Height = 30
      ThemeManager = UThemeManager1
      Group = 'AppTheme'
      CustomActiveColor = 14120960
      Text = 'Light'
      IconFont.Charset = DEFAULT_CHARSET
      IconFont.Color = clWindowText
      IconFont.Height = -20
      IconFont.Name = 'Segoe MDL2 Assets'
      IconFont.Style = []
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = URadioButton5Click
      ExplicitTop = 110
    end
    object URadioButton6: TURadioButton
      Left = 15
      Top = 135
      Width = 203
      Height = 30
      ThemeManager = UThemeManager1
      Group = 'AppTheme'
      CustomActiveColor = 14120960
      Text = 'Dark'
      IconFont.Charset = DEFAULT_CHARSET
      IconFont.Color = clWindowText
      IconFont.Height = -20
      IconFont.Name = 'Segoe MDL2 Assets'
      IconFont.Style = []
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = URadioButton6Click
      ExplicitTop = 145
    end
    object UText12: TUText
      AlignWithMargins = True
      Left = 15
      Top = 210
      Width = 203
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
      WordWrap = True
      ThemeManager = UThemeManager1
      TextKind = tkDescription
      ExplicitWidth = 163
    end
    object UCheckBox4: TUCheckBox
      Left = 15
      Top = 237
      Width = 203
      Height = 30
      ThemeManager = UThemeManager1
      Text = 'Color on window border'
      CustomActiveColor = 14120960
      IconFont.Charset = DEFAULT_CHARSET
      IconFont.Color = clWindowText
      IconFont.Height = -20
      IconFont.Name = 'Segoe MDL2 Assets'
      IconFont.Style = []
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = UCheckBox4Click
      ExplicitTop = 234
    end
    object UButton1: TUButton
      AlignWithMargins = True
      Left = 15
      Top = 521
      Width = 203
      Height = 30
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 10
      ThemeManager = UThemeManager1
      CustomBorderColors.None = 15921906
      CustomBorderColors.Hover = 15132390
      CustomBorderColors.Press = 13421772
      CustomBorderColors.Disabled = 15921906
      CustomBorderColors.Focused = 15921906
      CustomBackColors.None = 15921906
      CustomBackColors.Hover = 15132390
      CustomBackColors.Press = 13421772
      CustomBackColors.Disabled = 15921906
      CustomBackColors.Focused = 15921906
      CustomTextColors.Disabled = clGray
      Text = 'Delete my account'
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = True
    end
    object UButton2: TUButton
      AlignWithMargins = True
      Left = 15
      Top = 926
      Width = 203
      Height = 30
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 10
      ThemeManager = UThemeManager1
      CustomBorderColors.None = 15921906
      CustomBorderColors.Hover = 15132390
      CustomBorderColors.Press = 13421772
      CustomBorderColors.Disabled = 15921906
      CustomBorderColors.Focused = 15921906
      CustomBackColors.None = 15921906
      CustomBackColors.Hover = 15132390
      CustomBackColors.Press = 13421772
      CustomBackColors.Disabled = 15921906
      CustomBackColors.Focused = 15921906
      CustomTextColors.Disabled = clGray
      Text = 'Check for update'
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TabStop = True
    end
    object UButton3: TUButton
      AlignWithMargins = True
      Left = 15
      Top = 737
      Width = 203
      Height = 30
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 10
      ThemeManager = UThemeManager1
      CustomBorderColors.None = 15921906
      CustomBorderColors.Hover = 15132390
      CustomBorderColors.Press = 13421772
      CustomBorderColors.Disabled = 15921906
      CustomBorderColors.Focused = 15921906
      CustomBackColors.None = 15921906
      CustomBackColors.Hover = 15132390
      CustomBackColors.Press = 13421772
      CustomBackColors.Disabled = 15921906
      CustomBackColors.Focused = 15921906
      CustomTextColors.Disabled = clGray
      Text = 'Upgrade now'
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      TabStop = True
    end
    object UPanel1: TUPanel
      AlignWithMargins = True
      Left = 15
      Top = 170
      Width = 203
      Height = 35
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 5
      CustomTextColor = clWhite
      CustomBackColor = 14120960
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Select custom accent color'
      FullRepaint = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
      OnClick = UPanel1Click
    end
    object editAccountName: TUEdit
      AlignWithMargins = True
      Left = 15
      Top = 386
      Width = 203
      Height = 30
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 10
      ThemeManager = UThemeManager1
      Text = ''
      TextHint = 'Type some thing'
      MaxLength = 0
      NumbersOnly = False
      PasswordChar = #0
      Align = alTop
      BevelOuter = bvNone
      Caption = 'editAccountName'
      DoubleBuffered = True
      FullRepaint = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      Padding.Left = 5
      Padding.Top = 5
      Padding.Right = 5
      Padding.Bottom = 2
      ParentBackground = False
      ParentDoubleBuffered = False
      ParentFont = False
      ShowCaption = False
      TabOrder = 4
    end
  end
  object captionbarNewStyle: TUCaptionBar
    Left = 0
    Top = 0
    Width = 1041
    Height = 32
    ThemeManager = UThemeManager1
    Align = alTop
    Alignment = taLeftJustify
    Caption = 
      '                   This is NEW style TUCaptionBar (use 3 spaces ' +
      'for left align)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    object buttonAppBack: TUButton
      Left = 0
      Top = 0
      Width = 45
      Height = 32
      CustomBorderColors.None = 15921906
      CustomBorderColors.Hover = 14320921
      CustomBorderColors.Press = 14652211
      CustomBorderColors.Disabled = 15921906
      CustomBorderColors.Focused = 15921906
      CustomBackColors.None = 15921906
      CustomBackColors.Hover = 14320921
      CustomBackColors.Press = 14652211
      CustomBackColors.Disabled = 15921906
      CustomBackColors.Focused = 15921906
      CustomTextColors.Hover = clWhite
      CustomTextColors.Press = clWhite
      CustomTextColors.Disabled = clGray
      Text = #57510
      Transparent = True
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe MDL2 Assets'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = True
    end
    object buttonAppQuit: TUButton
      Left = 996
      Top = 0
      Width = 45
      Height = 32
      CustomBorderColors.None = clBtnFace
      CustomBorderColors.Hover = 2298344
      CustomBorderColors.Press = 8024305
      CustomBorderColors.Disabled = 15921906
      CustomBorderColors.Focused = 15921906
      CustomBackColors.None = clBtnFace
      CustomBackColors.Hover = 2298344
      CustomBackColors.Press = 8024305
      CustomBackColors.Disabled = 15921906
      CustomBackColors.Focused = 15921906
      CustomTextColors.Hover = clWhite
      CustomTextColors.Press = clWhite
      CustomTextColors.Disabled = clGray
      Text = #57610
      Transparent = True
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe MDL2 Assets'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TabStop = True
      OnClick = buttonAppQuitClick
    end
  end
  object popupboxDemo: TUPopupBox
    Left = 590
    Top = 290
    Width = 180
    Height = 150
    ThemeManager = UThemeManager1
    object USymbolButton4: TUSymbolButton
      Left = 1
      Top = 5
      Width = 178
      Height = 35
      ThemeManager = UThemeManager1
      SymbolFont.Charset = DEFAULT_CHARSET
      SymbolFont.Color = clWindowText
      SymbolFont.Height = -16
      SymbolFont.Name = 'Segoe MDL2 Assets'
      SymbolFont.Style = []
      TextFont.Charset = DEFAULT_CHARSET
      TextFont.Color = clBlack
      TextFont.Height = -13
      TextFont.Name = 'Segoe UI'
      TextFont.Style = []
      DetailFont.Charset = DEFAULT_CHARSET
      DetailFont.Color = clWindowText
      DetailFont.Height = -13
      DetailFont.Name = 'Segoe UI'
      DetailFont.Style = []
      SymbolChar = #57707
      Text = 'Cut'
      Detail = 'Ctrl+X'
      Align = alTop
      TabOrder = 0
      TabStop = True
    end
    object USymbolButton5: TUSymbolButton
      Left = 1
      Top = 40
      Width = 178
      Height = 35
      ThemeManager = UThemeManager1
      SymbolFont.Charset = DEFAULT_CHARSET
      SymbolFont.Color = clWindowText
      SymbolFont.Height = -16
      SymbolFont.Name = 'Segoe MDL2 Assets'
      SymbolFont.Style = []
      TextFont.Charset = DEFAULT_CHARSET
      TextFont.Color = clBlack
      TextFont.Height = -13
      TextFont.Name = 'Segoe UI'
      TextFont.Style = []
      DetailFont.Charset = DEFAULT_CHARSET
      DetailFont.Color = clWindowText
      DetailFont.Height = -13
      DetailFont.Name = 'Segoe UI'
      DetailFont.Style = []
      SymbolChar = #57711
      Text = 'Copy'
      Detail = 'Ctrl+C'
      Align = alTop
      TabOrder = 1
      TabStop = True
    end
    object USymbolButton6: TUSymbolButton
      Left = 1
      Top = 75
      Width = 178
      Height = 35
      ThemeManager = UThemeManager1
      SymbolFont.Charset = DEFAULT_CHARSET
      SymbolFont.Color = clWindowText
      SymbolFont.Height = -16
      SymbolFont.Name = 'Segoe MDL2 Assets'
      SymbolFont.Style = []
      TextFont.Charset = DEFAULT_CHARSET
      TextFont.Color = clBlack
      TextFont.Height = -13
      TextFont.Name = 'Segoe UI'
      TextFont.Style = []
      DetailFont.Charset = DEFAULT_CHARSET
      DetailFont.Color = clWindowText
      DetailFont.Height = -13
      DetailFont.Name = 'Segoe UI'
      DetailFont.Style = []
      SymbolChar = #57709
      Text = 'Paste'
      Detail = 'Ctrl+V'
      Align = alTop
      TabOrder = 2
      TabStop = True
    end
    object buttonClosePopup: TUSymbolButton
      Left = 1
      Top = 110
      Width = 178
      Height = 35
      ThemeManager = UThemeManager1
      SymbolFont.Charset = DEFAULT_CHARSET
      SymbolFont.Color = clWindowText
      SymbolFont.Height = -16
      SymbolFont.Name = 'Segoe MDL2 Assets'
      SymbolFont.Style = []
      TextFont.Charset = DEFAULT_CHARSET
      TextFont.Color = clBlack
      TextFont.Height = -13
      TextFont.Name = 'Segoe UI'
      TextFont.Style = []
      DetailFont.Charset = DEFAULT_CHARSET
      DetailFont.Color = clWindowText
      DetailFont.Height = -13
      DetailFont.Name = 'Segoe UI'
      DetailFont.Style = []
      SymbolChar = #57610
      Text = 'Close'
      Detail = 'Ctrl+V'
      ShowDetail = False
      Align = alTop
      TabOrder = 3
      TabStop = True
      OnClick = buttonClosePopupClick
    end
  end
  object buttonToggle: TUButton
    Left = 220
    Top = 320
    Width = 151
    Height = 30
    ThemeManager = UThemeManager1
    CustomBorderColors.None = 15921906
    CustomBorderColors.Hover = 15132390
    CustomBorderColors.Press = 13421772
    CustomBorderColors.Disabled = 15921906
    CustomBorderColors.Focused = 15921906
    CustomBackColors.None = 15921906
    CustomBackColors.Hover = 15132390
    CustomBackColors.Press = 13421772
    CustomBackColors.Disabled = 15921906
    CustomBackColors.Focused = 15921906
    CustomTextColors.Disabled = clGray
    Text = 'Toggle button'
    IsToggleButton = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
    TabStop = True
  end
  object panelRibbon: TUScrollBox
    Left = 0
    Top = 32
    Width = 1041
    Height = 61
    Align = alTop
    BorderStyle = bsNone
    DoubleBuffered = True
    Color = 15132390
    ParentColor = False
    ParentDoubleBuffered = False
    TabOrder = 15
    ThemeManager = UThemeManager1
    object separator1: TUSeparator
      Left = 120
      Top = 0
      Width = 20
      Height = 61
      ThemeManager = UThemeManager1
      Align = alLeft
      ExplicitLeft = 80
      ExplicitTop = 20
      ExplicitHeight = 50
    end
    object separator2: TUSeparator
      Left = 320
      Top = 0
      Width = 20
      Height = 61
      ThemeManager = UThemeManager1
      Align = alLeft
    end
    object buttonGoBack: TUSymbolButton
      Left = 0
      Top = 0
      Width = 60
      Height = 61
      ThemeManager = UThemeManager1
      SymbolFont.Charset = DEFAULT_CHARSET
      SymbolFont.Color = clWindowText
      SymbolFont.Height = -16
      SymbolFont.Name = 'Segoe MDL2 Assets'
      SymbolFont.Style = []
      TextFont.Charset = DEFAULT_CHARSET
      TextFont.Color = clBlack
      TextFont.Height = -13
      TextFont.Name = 'Segoe UI'
      TextFont.Style = []
      DetailFont.Charset = DEFAULT_CHARSET
      DetailFont.Color = clWindowText
      DetailFont.Height = -13
      DetailFont.Name = 'Segoe UI'
      DetailFont.Style = []
      Orientation = oVertical
      SymbolChar = #57366
      Text = 'Back'
      TextOffset = 35
      Detail = 'Detail'
      ShowDetail = False
      Transparent = True
      Align = alLeft
      TabOrder = 0
      TabStop = True
    end
    object buttonGoHome: TUSymbolButton
      Left = 60
      Top = 0
      Width = 60
      Height = 61
      ThemeManager = UThemeManager1
      SymbolFont.Charset = DEFAULT_CHARSET
      SymbolFont.Color = clWindowText
      SymbolFont.Height = -16
      SymbolFont.Name = 'Segoe MDL2 Assets'
      SymbolFont.Style = []
      TextFont.Charset = DEFAULT_CHARSET
      TextFont.Color = clBlack
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
      Text = 'Home'
      TextOffset = 35
      Detail = 'Detail'
      ShowDetail = False
      Transparent = True
      Align = alLeft
      TabOrder = 1
      TabStop = True
    end
    object buttonNewDoc: TUSymbolButton
      Left = 140
      Top = 0
      Width = 60
      Height = 61
      ThemeManager = UThemeManager1
      SymbolFont.Charset = DEFAULT_CHARSET
      SymbolFont.Color = clWindowText
      SymbolFont.Height = -16
      SymbolFont.Name = 'Segoe MDL2 Assets'
      SymbolFont.Style = []
      TextFont.Charset = DEFAULT_CHARSET
      TextFont.Color = clBlack
      TextFont.Height = -13
      TextFont.Name = 'Segoe UI'
      TextFont.Style = []
      DetailFont.Charset = DEFAULT_CHARSET
      DetailFont.Color = clWindowText
      DetailFont.Height = -13
      DetailFont.Name = 'Segoe UI'
      DetailFont.Style = []
      Orientation = oVertical
      SymbolChar = #57696
      Text = 'New'
      TextOffset = 35
      Detail = 'Detail'
      ShowDetail = False
      Transparent = True
      Align = alLeft
      TabOrder = 2
      TabStop = True
    end
    object buttonOpenDoc: TUSymbolButton
      Left = 200
      Top = 0
      Width = 60
      Height = 61
      ThemeManager = UThemeManager1
      SymbolFont.Charset = DEFAULT_CHARSET
      SymbolFont.Color = clWindowText
      SymbolFont.Height = -16
      SymbolFont.Name = 'Segoe MDL2 Assets'
      SymbolFont.Style = []
      TextFont.Charset = DEFAULT_CHARSET
      TextFont.Color = clBlack
      TextFont.Height = -13
      TextFont.Name = 'Segoe UI'
      TextFont.Style = []
      DetailFont.Charset = DEFAULT_CHARSET
      DetailFont.Color = clWindowText
      DetailFont.Height = -13
      DetailFont.Name = 'Segoe UI'
      DetailFont.Style = []
      Orientation = oVertical
      SymbolChar = #60739
      Text = 'Open'
      TextOffset = 35
      Detail = 'Detail'
      ShowDetail = False
      Transparent = True
      Align = alLeft
      TabOrder = 3
      TabStop = True
    end
    object buttonPrintDoc: TUSymbolButton
      Left = 340
      Top = 0
      Width = 60
      Height = 61
      ThemeManager = UThemeManager1
      SymbolFont.Charset = DEFAULT_CHARSET
      SymbolFont.Color = clWindowText
      SymbolFont.Height = -16
      SymbolFont.Name = 'Segoe MDL2 Assets'
      SymbolFont.Style = []
      TextFont.Charset = DEFAULT_CHARSET
      TextFont.Color = clBlack
      TextFont.Height = -13
      TextFont.Name = 'Segoe UI'
      TextFont.Style = []
      DetailFont.Charset = DEFAULT_CHARSET
      DetailFont.Color = clWindowText
      DetailFont.Height = -13
      DetailFont.Name = 'Segoe UI'
      DetailFont.Style = []
      Orientation = oVertical
      SymbolChar = #58102
      Text = 'Print'
      TextOffset = 35
      Detail = 'Detail'
      ShowDetail = False
      Transparent = True
      Align = alLeft
      TabOrder = 4
      TabStop = True
    end
    object buttonSaveDoc: TUSymbolButton
      Left = 260
      Top = 0
      Width = 60
      Height = 61
      ThemeManager = UThemeManager1
      SymbolFont.Charset = DEFAULT_CHARSET
      SymbolFont.Color = clWindowText
      SymbolFont.Height = -16
      SymbolFont.Name = 'Segoe MDL2 Assets'
      SymbolFont.Style = []
      TextFont.Charset = DEFAULT_CHARSET
      TextFont.Color = clBlack
      TextFont.Height = -13
      TextFont.Name = 'Segoe UI'
      TextFont.Style = []
      DetailFont.Charset = DEFAULT_CHARSET
      DetailFont.Color = clWindowText
      DetailFont.Height = -13
      DetailFont.Name = 'Segoe UI'
      DetailFont.Style = []
      Orientation = oVertical
      SymbolChar = #57605
      Text = 'Save'
      TextOffset = 35
      Detail = 'Detail'
      ShowDetail = False
      Transparent = True
      Align = alLeft
      TabOrder = 5
      TabStop = True
    end
  end
  object UItemButton1: TUItemButton
    Left = 390
    Top = 540
    Width = 341
    Height = 41
    ThemeManager = UThemeManager1
    IconFont.Charset = DEFAULT_CHARSET
    IconFont.Color = clWindowText
    IconFont.Height = -20
    IconFont.Name = 'Segoe MDL2 Assets'
    IconFont.Style = []
    DetailFont.Charset = DEFAULT_CHARSET
    DetailFont.Color = clWindowText
    DetailFont.Height = -13
    DetailFont.Name = 'Segoe UI'
    DetailFont.Style = []
    ShowCheckBox = True
    ShowRightIcon = True
    LeftIcon = #58031
    Text = 'Open popup'
    Detail = 'Right click'
    RightIcon = #57345
    CustomActiveColor = 14120960
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    PopupMenu = popupDemo
    TabOrder = 20
  end
  object UThemeManager1: TUThemeManager
    CustomColor = clGreen
    Left = 660
    Top = 130
  end
  object dialogSelectColor: TColorDialog
    Ctl3D = False
    Color = 14120960
    Left = 660
    Top = 180
  end
  object popupDemo: TUPopupMenu
    PopupBox = popupboxDemo
    Left = 680
    Top = 460
  end
end

object formDemo: TformDemo
  Left = 0
  Top = 0
  Caption = 'Test UCL controls'
  ClientHeight = 630
  ClientWidth = 1000
  Color = clWhite
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object linkConnected: TUHyperLink
    Left = 540
    Top = 170
    Width = 190
    Height = 17
    Cursor = crHandPoint
    Caption = 'Right click to open context menu'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 14120960
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    PopupMenu = popupHorz
    ThemeManager = AppTheme
    CustomTextColors.None = 14120960
    CustomTextColors.Hover = clGray
    CustomTextColors.Press = clMedGray
    CustomTextColors.Disabled = clMedGray
    CustomTextColors.Focused = 14120960
    URL = 'https://embarcadero.com/'
  end
  object linkCustomColor: TUHyperLink
    Left = 540
    Top = 190
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
    Left = 540
    Top = 210
    Width = 135
    Height = 17
    Caption = 'TUHyperLink (disabled)'
    Color = clWhite
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMedGray
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ThemeManager = AppTheme
    ButtonState = csDisabled
    CustomTextColors.None = 14120960
    CustomTextColors.Hover = clGray
    CustomTextColors.Press = clMedGray
    CustomTextColors.Disabled = clMedGray
    CustomTextColors.Focused = 14120960
    URL = 'https://embarcadero.com/'
  end
  object textDescription: TUText
    Left = 390
    Top = 210
    Width = 94
    Height = 15
    Caption = 'This is description'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 6710886
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ThemeManager = AppTheme
    TextKind = tkDescription
  end
  object textNormal: TUText
    Left = 390
    Top = 190
    Width = 106
    Height = 17
    Caption = 'This is normal text'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ThemeManager = AppTheme
  end
  object textEntry: TUText
    Left = 390
    Top = 170
    Width = 74
    Height = 17
    Caption = 'This is entry'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI Semibold'
    Font.Style = []
    ParentFont = False
    ThemeManager = AppTheme
    TextKind = tkEntry
  end
  object textHeading: TUText
    Left = 390
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
    ThemeManager = AppTheme
    TextKind = tkHeading
  end
  object textTitle: TUText
    Left = 390
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
    ThemeManager = AppTheme
    TextKind = tkTitle
  end
  object radioA1: TURadioButton
    Left = 390
    Top = 240
    Width = 89
    Height = 30
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    ThemeManager = AppTheme
    IconFont.Charset = DEFAULT_CHARSET
    IconFont.Color = clWindowText
    IconFont.Height = -20
    IconFont.Name = 'Segoe MDL2 Assets'
    IconFont.Style = []
    Group = 'GroupA'
    CustomActiveColor = 14120960
    Text = 'Radio 1A'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object radioA2: TURadioButton
    Left = 390
    Top = 270
    Width = 89
    Height = 30
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    ThemeManager = AppTheme
    IconFont.Charset = DEFAULT_CHARSET
    IconFont.Color = clWindowText
    IconFont.Height = -20
    IconFont.Name = 'Segoe MDL2 Assets'
    IconFont.Style = []
    IsChecked = True
    Group = 'GroupA'
    CustomActiveColor = 14120960
    Text = 'Radio 2A'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object radioA3: TURadioButton
    Left = 390
    Top = 300
    Width = 124
    Height = 30
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    ThemeManager = AppTheme
    IconFont.Charset = DEFAULT_CHARSET
    IconFont.Color = clWindowText
    IconFont.Height = -20
    IconFont.Name = 'Segoe MDL2 Assets'
    IconFont.Style = []
    Group = 'GroupA'
    CustomActiveColor = 14120960
    Text = 'Radio disabled'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object radioB1: TURadioButton
    Left = 540
    Top = 240
    Width = 88
    Height = 30
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    ThemeManager = AppTheme
    IconFont.Charset = DEFAULT_CHARSET
    IconFont.Color = clWindowText
    IconFont.Height = -20
    IconFont.Name = 'Segoe MDL2 Assets'
    IconFont.Style = []
    Group = 'GroupB'
    CustomActiveColor = 14120960
    Text = 'Radio 1B'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object radioB2: TURadioButton
    Left = 540
    Top = 270
    Width = 88
    Height = 30
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    ThemeManager = AppTheme
    IconFont.Charset = DEFAULT_CHARSET
    IconFont.Color = clWindowText
    IconFont.Height = -20
    IconFont.Name = 'Segoe MDL2 Assets'
    IconFont.Style = []
    IsChecked = True
    Group = 'GroupB'
    CustomActiveColor = 14120960
    Text = 'Radio 2B'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object check2State: TUCheckBox
    Left = 390
    Top = 340
    Width = 134
    Height = 30
    ThemeManager = AppTheme
    IconFont.Charset = DEFAULT_CHARSET
    IconFont.Color = clWindowText
    IconFont.Height = -20
    IconFont.Name = 'Segoe MDL2 Assets'
    IconFont.Style = []
    Text = '2-state checkbox'
    State = cbsChecked
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object progressVert: TUProgressBar
    Left = 660
    Top = 420
    Width = 5
    Height = 71
    ThemeManager = AppTheme
    Value = 45
    Orientation = oVertical
    CustomFillColor = 2469894
    CustomBackColor = 15132390
  end
  object progressCustomColor: TUProgressBar
    Left = 390
    Top = 420
    Width = 251
    Height = 5
    Value = 45
    Orientation = oHorizontal
    CustomFillColor = 2469894
    CustomBackColor = 13421772
    Color = clBlue
  end
  object progressConnected: TUProgressBar
    Left = 390
    Top = 440
    Width = 251
    Height = 5
    ThemeManager = AppTheme
    Value = 0
    Orientation = oHorizontal
    CustomFillColor = 2469894
    CustomBackColor = 15132390
  end
  object captionbarNewStyle: TUCaptionBar
    Left = 0
    Top = 0
    Width = 1000
    Height = 32
    ThemeManager = AppTheme
    CustomColor = 10197915
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = 
      '                  This is NEW style TUCaptionBar (use 3 spaces f' +
      'or left align)'
    Color = 15921906
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 29
    object buttonAppBack: TUQuickButton
      Left = 0
      Top = 0
      Width = 45
      Height = 32
      ThemeManager = AppTheme
      ButtonStyle = qbsHighlight
      LightColor = 14120960
      DarkColor = 14120960
      Align = alLeft
      BevelOuter = bvNone
      Caption = #57510
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe MDL2 Assets'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 0
    end
    object buttonAppQuit: TUQuickButton
      Left = 955
      Top = 0
      Width = 45
      Height = 32
      ThemeManager = AppTheme
      ButtonStyle = qbsQuit
      LightColor = 2298344
      DarkColor = 2298344
      PressBrightnessDelta = 32
      Align = alRight
      BevelOuter = bvNone
      Caption = #57606
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe MDL2 Assets'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 1
    end
    object buttonAppMaximized: TUQuickButton
      Left = 910
      Top = 0
      Width = 45
      Height = 32
      ThemeManager = AppTheme
      ButtonStyle = qbsMax
      LightColor = 13619151
      DarkColor = 3947580
      PressBrightnessDelta = -32
      Align = alRight
      BevelOuter = bvNone
      Caption = #57347
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe MDL2 Assets'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 2
    end
    object buttonAppMinimized: TUQuickButton
      Left = 865
      Top = 0
      Width = 45
      Height = 32
      ThemeManager = AppTheme
      ButtonStyle = qbsMin
      LightColor = 13619151
      DarkColor = 3947580
      PressBrightnessDelta = -32
      Align = alRight
      BevelOuter = bvNone
      Caption = #59192
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe MDL2 Assets'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 3
    end
    object comboAppDPI: TComboBox
      AlignWithMargins = True
      Left = 716
      Top = 4
      Width = 145
      Height = 23
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 4
      Text = '100%'
      OnChange = comboAppDPIChange
      Items.Strings = (
        '100%'
        '125%'
        '150%'
        '175%')
    end
  end
  object panelRibbon: TUScrollBox
    Left = 0
    Top = 32
    Width = 1000
    Height = 60
    Align = alTop
    BorderStyle = bsNone
    DoubleBuffered = True
    Color = 15132390
    ParentColor = False
    ParentDoubleBuffered = False
    TabOrder = 1
    ThemeManager = AppTheme
    ScrollOrientation = oHorizontal
    MaxScrollCount = 6
    object separator1: TUSeparator
      Left = 120
      Top = 0
      Width = 20
      Height = 60
      ThemeManager = AppTheme
      Align = alLeft
    end
    object separator2: TUSeparator
      Left = 320
      Top = 0
      Width = 20
      Height = 60
      ThemeManager = AppTheme
      Align = alLeft
    end
    object buttonGoBack: TUSymbolButton
      Left = 0
      Top = 0
      Width = 60
      Height = 60
      ThemeManager = AppTheme
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
      Height = 60
      ThemeManager = AppTheme
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
      Height = 60
      ThemeManager = AppTheme
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
      Height = 60
      ThemeManager = AppTheme
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
      Height = 60
      ThemeManager = AppTheme
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
      SymbolChar = #58031
      Text = 'Login'
      TextOffset = 35
      Detail = 'Detail'
      ShowDetail = False
      Transparent = True
      Align = alLeft
      TabOrder = 4
      TabStop = True
      OnClick = buttonPrintDocClick
    end
    object buttonSaveDoc: TUSymbolButton
      Left = 260
      Top = 0
      Width = 60
      Height = 60
      ThemeManager = AppTheme
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
  object buttonNoFocus: TUButton
    Left = 60
    Top = 190
    Width = 150
    Height = 30
    ThemeManager = AppTheme
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
    Text = 'Button no focus'
    TextAlignment = taLeftJustify
    AllowFocus = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    TabStop = True
  end
  object buttonCanFocus: TUButton
    Left = 60
    Top = 230
    Width = 150
    Height = 30
    ThemeManager = AppTheme
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
    Text = 'Button can focus'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    TabStop = True
  end
  object buttonCustomColor: TUButton
    Left = 60
    Top = 270
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
    TextAlignment = taRightJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    TabStop = True
  end
  object buttonReloadSettings: TUSymbolButton
    Left = 220
    Top = 270
    Width = 151
    Height = 31
    ThemeManager = AppTheme
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
    TabOrder = 8
    TabStop = True
    OnClick = buttonReloadSettingsClick
  end
  object buttonHighlight: TUButton
    Left = 220
    Top = 230
    Width = 150
    Height = 30
    ThemeManager = AppTheme
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
    Text = 'Highlight button'
    AllowFocus = False
    Highlight = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    TabStop = True
  end
  object buttonDisabled: TUButton
    Left = 220
    Top = 190
    Width = 150
    Height = 30
    ThemeManager = AppTheme
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
    Text = 'Disabled button'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 6710886
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    TabStop = True
  end
  object buttonToggle: TUButton
    Left = 220
    Top = 310
    Width = 151
    Height = 30
    ThemeManager = AppTheme
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
    TabOrder = 11
    TabStop = True
  end
  object itembuttonImage: TUItemButton
    Left = 60
    Top = 460
    Width = 311
    Height = 41
    ThemeManager = AppTheme
    Images = imglistMain
    ImageLeftIndex = 3
    ImageRightIndex = 2
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
    Text = 'Button with left &'
    Detail = 'right image'
    RightIcon = #57345
    CustomActiveColor = 14120960
    LeftIconKind = ikImage
    RightIconKind = ikImage
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    TabStop = True
    OnClick = itembuttonImageClick
  end
  object itembuttonFontIcon: TUItemButton
    Left = 60
    Top = 510
    Width = 311
    Height = 41
    Hint = 'ABC'
    ThemeManager = AppTheme
    IconFont.Charset = DEFAULT_CHARSET
    IconFont.Color = clWindowText
    IconFont.Height = -20
    IconFont.Name = 'Segoe MDL2 Assets'
    IconFont.Style = []
    IconFont.Quality = fqClearType
    DetailFont.Charset = DEFAULT_CHARSET
    DetailFont.Color = clWindowText
    DetailFont.Height = -13
    DetailFont.Name = 'Segoe UI'
    DetailFont.Style = []
    ShowRightIcon = True
    LeftIcon = #58031
    Text = 'Don'#39't combine'
    Detail = 'CheckBox & Toggled'
    RightIcon = #57345
    CustomActiveColor = 14120960
    IsToggleButton = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    PopupMenu = popupVert
    TabOrder = 13
    TabStop = True
  end
  object symbolButtonOpenDisabled: TUSymbolButton
    Left = 130
    Top = 350
    Width = 241
    Height = 41
    ThemeManager = AppTheme
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
    SymbolChar = #60739
    Text = 'Open file (disabled)'
    Detail = 'Ctrl+O'
    Enabled = False
    TabOrder = 14
    TabStop = True
  end
  object symbolbuttonSaveHorz: TUSymbolButton
    Left = 130
    Top = 400
    Width = 241
    Height = 41
    ThemeManager = AppTheme
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
    ImageIndex = 2
    ImageKind = ikImage
    Images = imglistMain
    SymbolChar = #57605
    Text = 'Save file (toggle button)'
    Detail = 'Ctrl+S'
    IsToggleButton = True
    ParentShowHint = False
    ShowHint = False
    TabOrder = 15
    TabStop = True
  end
  object symbolbuttonSaveVert: TUSymbolButton
    Left = 60
    Top = 350
    Width = 61
    Height = 91
    ThemeManager = AppTheme
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
    ImageIndex = 1
    ImageKind = ikImage
    Images = imglistMain
    Orientation = oVertical
    SymbolChar = #57696
    Text = 'New'
    Detail = 'Ctrl+N'
    IsToggleButton = True
    TabOrder = 16
    TabStop = True
  end
  object buttonRandomProgress: TUButton
    Left = 390
    Top = 460
    Width = 251
    Height = 31
    Hint = 'This is tooltip'
    ThemeManager = AppTheme
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
    Text = 'Random progress bar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 17
    TabStop = True
    OnClick = buttonRandomProgressClick
  end
  object buttonRunning: TButton
    Left = 60
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
    TabOrder = 18
  end
  object buttonAniStart: TButton
    Left = 60
    Top = 140
    Width = 151
    Height = 31
    Caption = 'Start animation'
    TabOrder = 19
    OnClick = buttonAniStartClick
  end
  object buttonAniInverse: TButton
    Left = 220
    Top = 140
    Width = 151
    Height = 31
    Caption = 'Reserve animation'
    ImageIndex = 0
    TabOrder = 20
    OnClick = buttonAniInverseClick
  end
  object buttonWithImage: TUButton
    Left = 60
    Top = 310
    Width = 150
    Height = 30
    ThemeManager = AppTheme
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
    Text = 'Button with image'
    ImageIndex = 0
    Images = imglistMain
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 21
    TabStop = True
  end
  object sliderHorz: TUSlider
    Left = 560
    Top = 370
    Width = 141
    Height = 25
    ThemeManager = AppTheme
    OnChange = sliderHorzChange
  end
  object sliderDisabled: TUSlider
    Left = 560
    Top = 340
    Width = 141
    Height = 25
    ThemeManager = AppTheme
    ControlState = csDisabled
    Value = 50
    Enabled = False
  end
  object drawerNavigation: TUPanel
    Left = 0
    Top = 92
    Width = 45
    Height = 538
    ThemeManager = AppTheme
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
    TabOrder = 0
    object buttonOpenMenu: TUSymbolButton
      Left = 0
      Top = 0
      Width = 45
      Height = 45
      ThemeManager = AppTheme
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
      TextOffset = 45
      Detail = 'Detail'
      ShowDetail = False
      Align = alTop
      Constraints.MaxWidth = 45
      TabOrder = 0
      TabStop = True
      OnClick = buttonOpenMenuClick
    end
    object buttonMenuSettings: TUSymbolButton
      Left = 0
      Top = 90
      Width = 45
      Height = 45
      ThemeManager = AppTheme
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
      TextOffset = 45
      Detail = 'Detail'
      ShowDetail = False
      Align = alTop
      TabOrder = 1
      TabStop = True
      OnClick = buttonMenuSettingsClick
    end
    object buttonMenuProfile: TUSymbolButton
      Left = 0
      Top = 180
      Width = 45
      Height = 45
      ThemeManager = AppTheme
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
      TextOffset = 45
      Detail = 'Detail'
      ShowDetail = False
      Align = alTop
      TabOrder = 2
      TabStop = True
    end
    object buttonMenuSave: TUSymbolButton
      Left = 0
      Top = 135
      Width = 45
      Height = 45
      ThemeManager = AppTheme
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
      TextOffset = 45
      Detail = 'Detail'
      ShowDetail = False
      Align = alTop
      TabOrder = 3
      TabStop = True
    end
    object buttonMenuOpen: TUSymbolButton
      Left = 0
      Top = 45
      Width = 45
      Height = 45
      ThemeManager = AppTheme
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
      TextOffset = 45
      Detail = 'Detail'
      ShowDetail = False
      Align = alTop
      TabOrder = 4
      TabStop = True
    end
    object buttonMenuRate: TUSymbolButton
      Left = 0
      Top = 225
      Width = 45
      Height = 45
      ThemeManager = AppTheme
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
      TextOffset = 45
      Detail = 'Detail'
      ShowDetail = False
      Align = alTop
      TabOrder = 5
      TabStop = True
    end
  end
  object sliderVert: TUSlider
    Left = 680
    Top = 420
    Width = 25
    Height = 71
    ThemeManager = AppTheme
    Orientation = oVertical
    Max = 5
  end
  object boxSmoothScrolling: TUScrollBox
    Left = 750
    Top = 92
    Width = 250
    Height = 538
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
    TabOrder = 33
    ThemeManager = AppTheme
    MaxScrollCount = 6
    object headingSettings: TUText
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
      Layout = tlCenter
      ThemeManager = AppTheme
      TextKind = tkHeading
      ExplicitWidth = 71
    end
    object entryAppTheme: TUText
      AlignWithMargins = True
      Left = 15
      Top = 43
      Width = 203
      Height = 17
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 5
      Align = alTop
      Caption = 'App theme'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ThemeManager = AppTheme
      TextKind = tkEntry
      ExplicitWidth = 68
    end
    object entryUserProfile: TUText
      AlignWithMargins = True
      Left = 15
      Top = 240
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
      ThemeManager = AppTheme
      TextKind = tkEntry
      ExplicitWidth = 69
    end
    object imgAvatar: TImage
      Left = 15
      Top = 267
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
      ExplicitLeft = 25
      ExplicitTop = 472
      ExplicitWidth = 220
    end
    object entryAccountType: TUText
      AlignWithMargins = True
      Left = 15
      Top = 473
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
      ThemeManager = AppTheme
      TextKind = tkEntry
      ExplicitWidth = 50
    end
    object desAccountHint: TUText
      AlignWithMargins = True
      Left = 15
      Top = 672
      Width = 203
      Height = 30
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 10
      Align = alTop
      Caption = 'Upgrade to Developer account to get more features'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6710886
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      ThemeManager = AppTheme
      TextKind = tkDescription
      ExplicitWidth = 198
    end
    object entryStorage: TUText
      AlignWithMargins = True
      Left = 15
      Top = 645
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
      ThemeManager = AppTheme
      TextKind = tkEntry
      ExplicitWidth = 76
    end
    object desStorageHint: TUText
      AlignWithMargins = True
      Left = 15
      Top = 767
      Width = 203
      Height = 30
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 10
      Align = alTop
      Caption = 'Your are using 3/5 GB of free cloud storage'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6710886
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      ThemeManager = AppTheme
      TextKind = tkDescription
      ExplicitWidth = 186
    end
    object headingAbout: TUText
      AlignWithMargins = True
      Left = 15
      Top = 827
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
      ThemeManager = AppTheme
      TextKind = tkHeading
      ExplicitWidth = 55
    end
    object desAppVersion: TUText
      AlignWithMargins = True
      Left = 15
      Top = 905
      Width = 203
      Height = 15
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 5
      Align = alTop
      Caption = 'App version: 1.1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6710886
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      ThemeManager = AppTheme
      TextKind = tkDescription
      ExplicitWidth = 84
    end
    object desFlashVersion: TUText
      AlignWithMargins = True
      Left = 15
      Top = 925
      Width = 203
      Height = 15
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 5
      Align = alTop
      Caption = 'Flash version: 31.0.0.14'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6710886
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      ThemeManager = AppTheme
      TextKind = tkDescription
      ExplicitWidth = 119
    end
    object desChromiumVersion: TUText
      AlignWithMargins = True
      Left = 15
      Top = 945
      Width = 203
      Height = 15
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 5
      Align = alTop
      Caption = 'Chromium version: 71.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6710886
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      ThemeManager = AppTheme
      TextKind = tkDescription
      ExplicitWidth = 126
    end
    object linkEmbarcadero: TUHyperLink
      AlignWithMargins = True
      Left = 15
      Top = 965
      Width = 203
      Height = 17
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 10
      Align = alTop
      Caption = 'https://example.com/'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 14120960
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ThemeManager = AppTheme
      CustomTextColors.None = 14120960
      CustomTextColors.Hover = clGray
      CustomTextColors.Press = clMedGray
      CustomTextColors.Disabled = clMedGray
      CustomTextColors.Focused = 14120960
      URL = 'https://example.com/'
      ExplicitWidth = 124
    end
    object radioDefaultTheme: TURadioButton
      Left = 15
      Top = 65
      Width = 203
      Height = 30
      ThemeManager = AppTheme
      IconFont.Charset = DEFAULT_CHARSET
      IconFont.Color = clWindowText
      IconFont.Height = -20
      IconFont.Name = 'Segoe MDL2 Assets'
      IconFont.Style = []
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
      OnClick = radioDefaultThemeClick
    end
    object radioLightTheme: TURadioButton
      Left = 15
      Top = 95
      Width = 203
      Height = 30
      ThemeManager = AppTheme
      IconFont.Charset = DEFAULT_CHARSET
      IconFont.Color = clWindowText
      IconFont.Height = -20
      IconFont.Name = 'Segoe MDL2 Assets'
      IconFont.Style = []
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
      OnClick = radioLightThemeClick
    end
    object radioDarkTheme: TURadioButton
      Left = 15
      Top = 125
      Width = 203
      Height = 30
      ThemeManager = AppTheme
      IconFont.Charset = DEFAULT_CHARSET
      IconFont.Color = clWindowText
      IconFont.Height = -20
      IconFont.Name = 'Segoe MDL2 Assets'
      IconFont.Style = []
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
      OnClick = radioDarkThemeClick
    end
    object panelSelectAccentColor: TUPanel
      AlignWithMargins = True
      Left = 15
      Top = 160
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
      OnClick = panelSelectAccentColorClick
    end
    object checkColorBorder: TUCheckBox
      Left = 15
      Top = 200
      Width = 203
      Height = 30
      ThemeManager = AppTheme
      IconFont.Charset = DEFAULT_CHARSET
      IconFont.Color = clWindowText
      IconFont.Height = -20
      IconFont.Name = 'Segoe MDL2 Assets'
      IconFont.Style = []
      AutoSize = False
      Text = 'Color on window border'
      Align = alTop
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object checkAutoSync: TUCheckBox
      AlignWithMargins = True
      Left = 15
      Top = 373
      Width = 203
      Height = 30
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 0
      ThemeManager = AppTheme
      IconFont.Charset = DEFAULT_CHARSET
      IconFont.Color = clWindowText
      IconFont.Height = -20
      IconFont.Name = 'Segoe MDL2 Assets'
      IconFont.Style = []
      Text = 'Auto sync your data'
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object checkKeepEmailPrivate: TUCheckBox
      Left = 15
      Top = 433
      Width = 203
      Height = 30
      ThemeManager = AppTheme
      IconFont.Charset = DEFAULT_CHARSET
      IconFont.Color = clWindowText
      IconFont.Height = -20
      IconFont.Name = 'Segoe MDL2 Assets'
      IconFont.Style = []
      AutoSize = False
      Text = 'Keep my email in private'
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object checkSendEmail: TUCheckBox
      Left = 15
      Top = 403
      Width = 203
      Height = 30
      ThemeManager = AppTheme
      IconFont.Charset = DEFAULT_CHARSET
      IconFont.Color = clWindowText
      IconFont.Height = -20
      IconFont.Name = 'Segoe MDL2 Assets'
      IconFont.Style = []
      AutoSize = False
      Text = 'Send me email'
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object buttonDeleteAccount: TUButton
      AlignWithMargins = True
      Left = 15
      Top = 595
      Width = 203
      Height = 30
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 10
      ThemeManager = AppTheme
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
      Text = 'Delete account'
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      TabStop = True
    end
    object radioFreeAccount: TURadioButton
      Left = 15
      Top = 500
      Width = 203
      Height = 30
      ThemeManager = AppTheme
      IconFont.Charset = DEFAULT_CHARSET
      IconFont.Color = clWindowText
      IconFont.Height = -20
      IconFont.Name = 'Segoe MDL2 Assets'
      IconFont.Style = []
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
    end
    object radioProAccount: TURadioButton
      Left = 15
      Top = 530
      Width = 203
      Height = 30
      ThemeManager = AppTheme
      IconFont.Charset = DEFAULT_CHARSET
      IconFont.Color = clWindowText
      IconFont.Height = -20
      IconFont.Name = 'Segoe MDL2 Assets'
      IconFont.Style = []
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
    end
    object radioDevAccount: TURadioButton
      Left = 15
      Top = 560
      Width = 203
      Height = 30
      ThemeManager = AppTheme
      IconFont.Charset = DEFAULT_CHARSET
      IconFont.Color = clWindowText
      IconFont.Height = -20
      IconFont.Name = 'Segoe MDL2 Assets'
      IconFont.Style = []
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
    end
    object buttonUpgradeAccount: TUButton
      AlignWithMargins = True
      Left = 15
      Top = 712
      Width = 203
      Height = 30
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 10
      ThemeManager = AppTheme
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
      Text = 'Upgrade account'
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
      TabStop = True
    end
    object progressStorageUsed: TUProgressBar
      AlignWithMargins = True
      Left = 15
      Top = 752
      Width = 203
      Height = 5
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 10
      ThemeManager = AppTheme
      Value = 64
      Orientation = oHorizontal
      CustomFillColor = 2469894
      CustomBackColor = 15132390
      Align = alTop
    end
    object buttonCheckUpdate: TUButton
      AlignWithMargins = True
      Left = 15
      Top = 865
      Width = 203
      Height = 30
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 10
      ThemeManager = AppTheme
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
      TabOrder = 14
      TabStop = True
    end
    object USeparator1: TUSeparator
      Left = 15
      Top = 992
      Width = 203
      Height = 10
      ThemeManager = AppTheme
      Orientation = oHorizontal
      AlignSpace = 5
      OnlySpace = True
      Align = alTop
    end
    object editAccountName: TUEdit
      Left = 15
      Top = 339
      Width = 203
      Height = 29
      ThemeManager = AppTheme
      Edit.Left = 5
      Edit.Top = 5
      Edit.Width = 193
      Edit.Height = 21
      Edit.Align = alClient
      Edit.BorderStyle = bsNone
      Edit.Font.Charset = DEFAULT_CHARSET
      Edit.Font.Color = clBlack
      Edit.Font.Height = -13
      Edit.Font.Name = 'Segoe UI'
      Edit.Font.Style = []
      Edit.ParentColor = True
      Edit.ParentFont = False
      Edit.TabOrder = 0
      Edit.TextHint = 'Type some thing'
      Transparent = True
      Align = alTop
      BevelOuter = bvNone
      UseDockManager = False
      Padding.Left = 5
      Padding.Top = 5
      Padding.Right = 5
      Padding.Bottom = 3
      ParentFont = False
      TabOrder = 16
    end
  end
  object check3State: TUCheckBox
    Left = 390
    Top = 368
    Width = 134
    Height = 30
    ThemeManager = AppTheme
    IconFont.Charset = DEFAULT_CHARSET
    IconFont.Color = clWindowText
    IconFont.Height = -20
    IconFont.Name = 'Segoe MDL2 Assets'
    IconFont.Style = []
    Text = '3-state checkbox'
    AllowGrayed = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object AppTheme: TUThemeManager
    OnUpdate = AppThemeUpdate
    Left = 250
    Top = 570
  end
  object dialogSelectColor: TColorDialog
    Ctl3D = False
    Color = 14120960
    Left = 330
    Top = 570
  end
  object imgcollectionMain: TImageCollection
    Images = <
      item
        Name = 'iconfinder_google-drive_317713'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              870000000473424954080808087C086488000000097048597300000B1300000B
              1301009A9C1800000533494441546881ED595D6C545510FE66EE764B4BA52D50
              AA2D911A012BA95B9AA2822F6202425B312486177FE21BFE44A4B02801948242
              91046A8100C684181F7CB001490BDD026A820F1A0315E8B6A442AC222AC102E5
              A7504BB777C607526897FDB9F7AC9B3EC8F7B667E69BF9E6CEEE3D67CE02F770
              0F098112214FA9ABF2BE38EEEC972BB33BE79BF0157AC82A0ECC4944032742B6
              32BADFA9EBC99EDF697B9A4DF8047A565A2A9E4F44837101C54D8B0B14580500
              6F5DC8CB16A0DF248EA86ED6B6055E531DC60588D23606D200E0B49DF670B02F
              ED0723014413D5EEA934D561F41B286A5C3A9F097B07AF65A1AFEBDBFC5F2D0B
              94E9369E88745B2934998A02E7DD725D77A0B461613A13B684AF5F817774FDF5
              CCE36EE3010033DF27FDB4C188EB9610B23256037830926DC3B59CA742A2674D
              84A8E25509964D73CB7355C0D4807F8A289646B387D4E3DD7835F79C5B1100C0
              0C12C156D73C37CE22BA831929B17C76F7644FEF0A718B5B2100C0C4332458F1
              922B8E5347DF7EFF2B603CEDC477C9E5F1A922226E840C405436CA89D9239DFA
              3B2AA078EFE22C81BDC969D096505AE1E990E16B159CAFF0AE70EEEF00760A55
              33F3383742165DBC7F920037DC7006A00ABF1E9F53E0C4376E01458D95D398F1
              9A5B11173022F7C7DEB4AFDDF200801923843D8E3A1EBB80AA2A66C22700BB7E
              DD0AE462B364BE2E823FDD7201808017F478C5CC787E31853DF644F71B00979A
              0860A20F2B67ECFA9BA18EBFCFE1B0A15BB46E8115334F344351FDDBB94A5867
              9459A42325E7C64E00A0A9812F047AD4240C33F97472CFC2983ED10CE4F16C62
              20CB24318857FD34EDD310001041597489511C0042F281062BB2A3D9231650DC
              E49F4984974D12AAE8D160794DDD9024254DDF2B50178D130B0C1E2B8A35D1ED
              61286D5E98A2AA3B4C9201005BFC2E087AD7BAF42F17C14D93980ABC29C7E64E
              89982F7C21D499E107F0A85122D5C696B2CD8723D9A8E4E01922D49AC465C0A3
              167F1CC5760725FBFD130478DF24890036B32E8FE543BD76B5009D26F1A38D9F
              430AB0C9DECA40BA5102D1CF5BCA6A4FC6F2E1E907AE5964F68080C8E3E7ED02
              7C81CA7920361AB005F88715AB1D39FF9CBE4B04AD2679228D9F04DC9AB26E72
              C649661498045660436B79CD4AC7FEC18A59AA303A66848F9F0C007D9E8CF74C
              C50BE4621A421FB9E190AFF11B05F69BE40B1F3FB9E8C0D24282F84D82010029
              AF3B52BEED9A6B1EFA97995EC50C1E3F19A2DB0136BB9711E9F0E65E37DA33B8
              F8E02902761A71078D9FCCA0512641000C393218D1ADD01A11B96CC21D183FC9
              17A89C077083EBE421AB6DE291B97B603438DEC1BC479A274D1C732EDF844BC4
              ED0400BE4065B3DB63736EFBE3C15197C6F94C12FF371025D0F4817D60AD1BAA
              D5EB3D36BCE20111FA6C77F5AC230C00C1F2DA7D501C734404ECFCF627C72457
              5E5C0D57916AAF0006EDC4CACEBA30A23BF368EA8D51139225CE0948B56AEFDA
              399DC0A0025ACB6A1AE27541457A1F682F999C6C81B1A16D97BCD6F6814F430E
              73F1BA30F252DE096FDFC8D1C992E608A48BBE5BFBCCED0D704801AD65350D22
              12F98659A82BEF97E29224CB8B0981D6ED593FFBF0E0B5BB061A8AF246CA3AF7
              D019B23DA949D2161F821EA1FE65E1CB7715D0FA5C6D7D781754F8AFB1BF4F1A
              D6A7AFACD5F5EBE7FE11BE1E71A80FEF42CE6F85DDA49E84FED14C08221D3DDD
              7D116FEA2216D05A51DBA0C00900A0504A47F6F982C264EA8B07655A72605B79
              C40B81C8F7420455BDD585BC5325A9D0E17BF82A68FAAA7AD6BE68F6A8175B6D
              E535F5E95D3987D2AFE48C4F8EB4F810411F3CF6E2E1CA7F0FFF0BFC0BB0B6E4
              804D210FC30000000049454E44AE426082}
          end>
      end
      item
        Name = 'iconfinder_TeamViewer_2744934'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000097048597300000B1300000B1301009A9C18000006EA494441546881
              D59A6D6C53D719C77FC76F89639B2669D2D0164A20906A429B5A042C2B5474D9
              089A584BBBED4337AD2D824EAB844A3B6DE34B5729DDFA85B175EDD46E5FB6AA
              621353A569CD5AA442223268034B4181A96A270512922E090468C88B633BF68D
              EFB30FD78EDFEEB5AF137B6BFFD29193F3F6FC9F7B9E73EE39FF7B1425808854
              016DC05781BB81B5400D104854090293C000D00FFC03E8544A854B617F511091
              5A11D92D221D221296E2114EB4DD2D22B5FF4BE27E11795E44661641DA0A3322
              F23311F19593B85B449E1291F11212CFC6D5840D77A9C9AF1491BE3212CF469F
              88AC2C15F9AF48799FBA15C645A465A9E41F1391E8FF817C127322F2D852C87F
              56F07D2B9ECA827C0B700AF02CCAFBD2230A3CA094EACD2EC871408CC9730E68
              C82E1B988C73F6AAC6DCBC9485A5D7A5D87C879BA66AA759F1356093526A243D
              33C3013196AF5E604376EB97CF8578A16716BD3CDC17E054D07E7F80FD1BABCC
              8ACF032D4A292D99E1C8AAB01713F20393F3BCF07E105D1790F2A6B82EB4BF37
              C3E064DCCC810DC09EF40C57F20F11F103ED66ADCE5ED188EBE64F2C1D5E97A2
              B5D1C3379A2A5953EDE48E801311B83A1BE7F2549C6383514E0C47891408C179
              81B3576234D578CD8ADB45E4CF4AA9508603C08F30897B808896784216A8722B
              9EDEE863FF663F014FEEBAD054E364EB4A78FC8B5E8231E1E50F6679B52F64F4
              6B81B075D9F204D717211142626CA60E58F686F5906F58EEA26F6F3DCF6D0D98
              92CF46C0A378FEFE007D7BEAB9A7C1651D4EE41DA50309CE0B73E021C09F8FBF
              99915DCD951CFB6E1D77064C578DBC58B1CCC9F1EFD5B1736D858513799B0780
              07D31D78B8A0C52C031B6F77F387076BA874157EEA56F0BA14AF3F54CBBD0D6E
              9311288887011C923A8C14702095021E0747BE752B15CEC5934FC2EB521CF9F6
              ADF8DC2AC3860DEC10912A070679D3E9BE0011444FA567BFEC67B9BFF8B0B1C2
              9D01274F6FF267D8B0310A5E60BB03E318981F697320E051ECDB1C28D8A4583C
              D3B20C9F1BBB7320895607C619B60052B1B97D4D05556EF3D0B9704D63F7D169
              42264B6048139E78679A0BD7349396E0F3285A5757DA5D85926876601CC06DF9
              8040DBDADC68EB1989B1EBCD09B6BD7183D129CD88E76C826EC5E894C6B6376E
              B0EBCD097A4662397576ACF516330700D6B930D4031BE48D5E57D7A4DE7DC707
              22FCEA7490DED1E8429E53D779ED6CD0B41B97E8C87C9CEE8130DD03615A5654
              F0932D018338D058ED4AC5BE3D27AA5DA4A48F024E183DDEE673F2B78F43FCBA
              679A0FC7739FE299A1306786ECA925BDC361BE331CE64BCB3DFC78EB2D7CA1DE
              6377094D22E02A5C07440449EB5821A0EB48DC74C3553424AE1B7D266CA5FF16
              820B43742AACCB243ABC3E1BE791F57E1E59EFA7F3628843276FF2CFE1C842B5
              FB1ABDEC5A6FFE52FFFBC7B39C49ABDBB2CACB4F1FA865C7DD869A72EA72A4D8
              1108BA3014331B0E183F976F6ADCB7AA1280B6661F6DCD3E4E0F8539D43D4157
              FF2CB1589C7D5BCCA7D55F2F4C23F371BED6ECE3406B1D5BD764EEF98726B562
              2630C0940343EE2B403EB58C765E0CE5146F595D45C7DE959CDEDFC85DCB9CCC
              CCE5EEBD67A33A2B9639E9D9DFC8DB4FDE95431EA0B33F54EC76E2920B43ABDC
              61CB09A0AB3F445813D377C13D2BBC1C7EDC5CCEF15738F89345194028A673E2
              52B8D810BAE8C0105AF323ED4D1C9C8BF36ACF6431466CE195F7270945E3C5BE
              89BB1D402710C95F4F16562211E1A553138C07E7974C3A89B1E9795E79EF6686
              0D1B1E44802E4742E2EECC5B55003D9582119D470F8F112D813A11D184470F8F
              313BA767D8B03102C79552E1E479A0A360F5ACFDFAB94F22ECF9CB9525492C11
              4DD87D648CF32391C59C073A2075A0791BE37D608B7C32757C3843DBEF3E616C
              DA7C83960F23531A5F7F6D98A31F05F31C2B2D1104DE5970402975133894D7A2
              8591BEFF84B9F7E0203F3F769DA0C9F29963794EA7FDDDEB6C3838C8BF464D9E
              BCBD11F8658273862AF112B00F1365C2EB52793B0D45E31CECBAC16F4F4ED0DA
              EC63E7FA006BEA3CDC7E8B1B11189FD118FC34C6BBFF0E72A23F44442BECA8D5
              961D18077E93FC67C101A5544844DA81DF67B7D8DC58858282AA5C38A673F4A3
              A011164B8043C1A655A6CA1C407B5213825C65EE8F18F25D06D6D57BF8C5CE06
              9C0AEB212F51722A78F19B0DACAB37D595CF03AFA7671425EE0E7E1AA3772844
              24B6F4E5D30C5E8FA265B58FA63A53F2E318E2EE687A663E79FD2450516A928B
              4414D8A694FA20BB203B840048E8F03F2837AB22F0A419F98290CFC62726CBAF
              33769D6891CFEB47BE34273EBF9F59D39C708BC80FC5F8185D2E5C4DD828ED87
              EE2C477C625C0B28F55583E7A49C570D4C1CA915912744E42D59FC658FB7127D
              2CFAB2C7D2E565C3992A603BD00A3403EB806A32AFDB4C0197808B4037D0558A
              EB36FF052FC10E2A8946AECA0000000049454E44AE426082}
          end>
      end
      item
        Name = 'iconfinder_gmail_1220367'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              870000000473424954080808087C086488000000097048597300000B1300000B
              1301009A9C1800000689494441546881ED996D6C53D719C7FFE79CEB9738768C
              0D49431268594254F242D2D2C0F0E2B50DB0803AB669B4D2A834ED4B554DA388
              86740CA62D74AB26ADD3B44E6A2BB5EAB456ADCA36B189A95529D3DA35D42534
              E9121AE812B284A0862424247162FBDACE7D3B671F4A2A9AFA3AB631B00FFE7D
              B27C9E739EDF73EE3DF7DC63033972E4C8712B210B1FC4A38F5A26E489EF8092
              BA82A77F67A0C06DBB95628BA1AAA2870F3E210C591EB7EBF623DEA34743C0D5
              02461EFC86975A6C2728410300708F676A59DB2F2668BEABF6564A2FC0156528
              F6EBA7983E36B606002030066E6C2BF9CBF17E0A00CC6A7B66411E00E8EC6CE1
              EC132D354A4F7780732E6E913700C018F9341069DD5BF6B93C00109482B02302
              20443CF410BBCCE66550D8130D60B96B436FFE0FF79482901537CD1A0017221A
              3F76F48C76E2ED46D320C3A8A2D32EC561260F00DA99EEBAD08116AA87E73EBE
              21A60910CA7C7FF4C99F4E2595074098544C59C446971C3014F2CA075AEBD58E
              5301CE39CF9EEA97D10606DAC3FB7F546E5C9EB823599C1C574786A7660D29E5
              913947EC953FF85967679F6BEFE35E48B4F87A65BF8030E6E4575FEBD74F9DBC
              6FA9D0919960C764387C9710CCBAE4EC2FC6E83F5735D7BA2F4F0FCE7467249A
              001197CF860E1D8CEAA74E6E4E16A76BFADCD991B18F26C3B20FA07900907601
              0080B8EC960FFD7883D2FECE079C733DA3310070CE85DADBF35E70FFDE6A119C
              2E4D163B138DF47C3C3AAE2886D170EDF7A60588D6FD9DDCED9E341D5108C48F
              BCDE283FF39B6143D7C6D2B637C495F84B2FF4C49E7FF67E668099A6B1D0F8E0
              96E6F6E12BB3F502B86D713B0D395492B063E18A75F4D0219BF0357E98CC830F
              0C54CEB5EC731B5357BA52769F0BFD3B78601FD1BA3FDA902C2E745B715FEF83
              BBA72245459B6132D9C96F214296916FEFFC2A5A5A4EF33C5BD82C8C297167E4
              6707372AFF387E8A73AE9AC571CE75B5E3FDF7E67ED2B28146228566713A63FA
              D0D79B0217B736DF092AAD4EA698DA1A282EDE4CDADA62A2AAA6D7344608C4FF
              76F46B91A77F3562E8FAA78B9B0D5D1F8DFDFEB77DB1575EBE9F0991F0AA0340
              D4EB1DFEE4BBDFBB28AF5AE54FC52FE5454CA8544C7EF0FD3A3CF24800166A3A
              CBE2E27085DCB2A7C8181D3DFDB9FCF4D469B9759F533FDFBFDEB41F21B8D4B0
              3130B8636719ACD2DA54BD52DF071658BBD62F0E3F79012FBEC4C9A54B091309
              45CD8B3CD5B6D9B2FD9BA7499E5D558FFDF55E08F357AA79A76BFCBFCD0FCC70
              BBCD9FAE4EFA050020165BB978EC31CDE8EA0AE0D8B146C6F9976F0921A0BDFD
              66D2E73A08C164755DC758CDFA3ACA4849262E1915000004B0B08D1BFDA2A6EA
              1C9E7B7E3966826909283647F0C2F6EDC3AAD3E5CB6C33FA8CEBE90B00200E67
              2D6F3D50209A9A3A404CD7E61798AE28EFEEDBB54BA84ED73DD79B3FE32B702D
              9411279A9B7DA2E19E4EF2EC739588C53C89E254AB14BDB875476FDCE3F5A556
              6A0AB9B3340E008078976FE23F6FD3505FD7B3B82D5CB6F293BE5DBB43718FD7
              97CD9C592D0000282545D8FDF0DDD8B3270026CD73106DA8694B60C8BFB51A94
              66B4509391955B2821AB57FBF5C387FB87FE33303D2F317FD667EA2A37685C01
              5DA09FDAADBCB2AEDAE375BBDEB95167EBAC17C00554CD10ED14BC8C0A545346
              6B4ACBCA7C95955F3941381FCD76BEAC15A0EB06E7AA3E0EAE9FB1307A1F25D4
              B5D0C61871381D8E1DB5F535975D8EFCF7B39513C852019AAE4638175D845141
              99B42949B286F28ADB6BD7DCBEFA2D013E938DDCD755806E70232A477B0D2EBA
              24896E228C263D555DC5E3763B1FA8ADA91EB0D92D299F21CCC8B8004D5526E6
              E3F1F63CA7DD6DB7DAB6504AD3DA9B244A7C77AE2D2F2B295D799C734433F548
              FB312A8440548E9DB5582C930E47DE160A9AF12410424B8A967B4ABC05AE7FF5
              0F0EAD30746EFABA6D465AC9554DBB128944DAEDF90EABCD6EDD4669E6F2D722
              59A4A6EA7595AEC2A2C2139C434BABAF9309434BA18B1C96CF51898D171438EF
              0588E92F799942095DB3B2A87055A1C7F5EEF9C10B159C93F2253B1143A5857F
              7C23C239EF338B511525189C0B9FB4E7DB0C8723AF19A059975F805248569BBD
              B976DDBA98ABC0F9EE529B1F13F402050002FA380737160744A3D1BE98AA742E
              733BEF9698A5FE46892F86305ABBE68EB286F28AF2E34488849B9FE0F8D3CE0F
              7BC7240028FDF39BFFBCFCF0B7B609885F0268E0E0D2EC54F003D7B27CE2B03A
              7D00B8000FDDAC0280CFFEB82870DA1A6BD657750E9E1F36221C7E4E2143A08F
              42FC7D52B7BC70337D72E4C89123C7FF27FF03E5C4A72A279D92360000000049
              454E44AE426082}
          end>
      end
      item
        Name = 'iconfinder_logo_brand_brands_logos_translate_google_2993668'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000097048597300000B1300000B1301009A9C180000088E494441546881
              B5995B6C54C719C77F73CED98BD76B7B1DDB80CD35DC5C07074128696C82953B
              4D43D454250921A12D55A526522955A5D0AAAAFA50554DDF7A89942A4FAD2225
              22A42248495B25A12AA91AA862DC04136E25010C36E66258DBBB5EEF9EDD73A6
              0FDEB37B6E7BB10DFF973DDF9C9933FFFF37DFCC7C332B007EF777D99E317935
              67708F84108004A4A400EB5996B091CE366349EE7AF9DBE2136E31B4DFBF2F57
              24D3F42633D49916A97264656911D2DE5EF02DE0960B5026745E4DD8C85B7099
              5EDB5DDF5D41E59B37815F4528199DAE72441CB69C8630C9C2EFBF2E7B6E06C9
              72500C49D843DA4DCA6D57F0BE656A26DB67C9AF2294722F67ECFD229E7872AF
              546746AD3A280E8E3320596EF40434374DF2E8EC289647D91128C0EBD9AA8529
              0ADBA64FAB7A68F60ECB8D867B5FC0CFC66B8755F399F317869EA90969B8217D
              62AE0A4C02EF9BA6B9ABADAD6D40F1F36E5956D34426A7707CD044D7F5D97DC8
              A223658D94F2EB8AA27C7AE9D2A545CA54A1BB5279EFFBEDD2E546EFCC8D7AC6
              C7C71D2266E87D7BFB9810E2E5C21CF0FDDC2CBD6FB53F1B8F9235141289C4AC
              46C22D5A08F1B0567132E67F439A64CD821C1DAD39E6374AC29A249D130CC505
              278635FA06343286F01DBDAC54383F56C7CAA67192C924D16894402030632136
              41359A9DA483B4ADB0B3CDE0B1CE0CB52167CDB02659D62259D6A2737F7B9677
              FB437C3AA83A95E771FA4603EDCD0900128904757575D312512AE4146725AF90
              7B9767796A5DDA43DE8D6848B2757D9ADB9B0D477BABD585B128E99C8A941221
              04C964925C2E57B58052D07C43265FD6D966F04847316653BAE0E0FF029C1B51
              B89E54688A9A2C6E3279A03D4B2428F9E06480B323AAEF909AC0E7F17A3A5BE2
              000511D168144DF32EB18EE66526BC631FB023A84A1EEBCC14EC73230A6F1E09
              93C88842FDA15195C15195FE418D15730DFA068A44FCC2F2D4B53A3A5BE20821
              0A22262626884422339E13CE10B23DAF59982B844D4A170EF2EEFA898CA06F40
              F3CC1DB73D988890CC060BE461CABBA9548A6C36EB4BB0D272EBDD07F2AB48C7
              BC622C1F3C1320A917C9CF6447B670FA7A5D81BC5DC8E4E424BFFEF35F78E9B5
              7D6509BB510C21D78BB646B3F07C7E44F125F9D21313BE1FB5BCB67B5FD45696
              1730D2C0FAB6B8A3BE2542D775472855B3D939F701DB1A1EB6BDB99E2C465AA5
              6FBA3B7557BF920CF287FD87211BCFD72D86920072599D5FFDE92D14C5729A2C
              F42BF3047FBE634BE17B8A5F2752423A571CE6A6A8E97C5F5E03E06CEF166D84
              DB3DE48B10E4F42C86693ADACB12BD965C3686E20ACB5AA6E6C1922693A151D5
              43E4A76FD7169B4AD8B03CCBE3774EAD5C8337BC79A2D5BE7EEE3ABEF7685391
              B210F8E1C485610EF4F6D3BEB88D2DF777F9D6514A256927878B07A9FBDAB3D4
              85A59FCE825D1394F4AC28EE199F5DD21CA4EDF5E393012E276BCA92975272B8
              FF048669D2B164A16F1DB096519FD1F9E4A2C6447ED98C04244FAD4B132DB11B
              8734C977BAD334E445263382DE01E7E6E416D23F5CC31FDF7E8FDFEE7987A39F
              9FF78839377C95D1F1149180C68AF9732A08C09B22670CC1BBC742057B69B3C9
              8F1E9A64C3F22C0B6206415532A7DEA47B6996DD0FA758DC585C76F71F0DA1E7
              133B8708DBF399788CAECE2F0182837DC719194B14E682619A7CF8DFE34821F9
              CAAA951886816118F8A1EC1EDE3FA4128B04D974C75468440292CD9DFEE9B045
              F66FC743F40F96F7BE9430A1AB34B674D0D230C0B5B171DEF9772FDBBF7A1F01
              4DE5D0B1D3DC484CD0DA14636DFBEDC0D4121B0C065155E71D81FF2A64EBF45F
              6702ECE90D93CCF8C7EA142149322378FDE330074F07FC8F9F3EED4E5DAF63F3
              C6F5040301E2E3131CE8EDE7EA8D518E9CFC0245117CAD7B1D8A2DAC745DF78C
              84F8C95E29B346E513574095DCB528C7AAD61C0B1A25E180249D858B37148E0F
              6B1C19D0C8E497CE6A4E6C0041D56457D77906862FB3FFC38F319144C2415269
              9D7B5777D0BDBADD49362F2610081446C23F1B75752601DD10FCE75C80C36703
              C57AD299324F873C4C9D97BF88D7B272FE5CBA56B7F3D1B153A4D23A2D8D75DC
              D3B9C297BC10A29086ABAAEA930BF9D86EB89334FCEC0AB0FA3871258A619A5C
              8D8F4D1144104FA4181A7166ADF65F00C330304DB374366AEFA4A45D414339EF
              5BF54F8F4478EB601F670687A9090699D71C239733D877F03097AF7B45D89F0D
              C3F05E6C5545B24CCA5CCD6583BD8E210517C66334D4467876530F4F3FB881B6
              9626D27A8E370F1C626474DC97BCF55BF256E26678BFDAF66AFD9D3CB76923B7
              D5470905033CF94017736FAB2795D1D9F38F8F882792BEE4A59495CFC415ED32
              DEF71B0C3F61BA3A1FA1460BC46A42419E7E6823CDB13A92A9347F3DD4E71B4A
              90BFDC9D96F7E4CDF53E8021E1E4B5DA02412925B5E110DB1ED9C8E2792D6CEE
              FEB287BCB56B2BA664B29A4EA64D1A2FCA09EBBF5CEBF172B426CCB39B7A68AC
              8FFA267D4208946CD6F867B59D78BCEF371A339C3B1747C3C4279D6942A9B0B1
              AE6600946C22B9D3C8EAA3D57452D29E81F7DD0D2470FC4AF1085A8ABCFB9D00
              78E195D1A532245ED114AD474A6A3CBB29D27F779545C21EDB3E3AB2586617E9
              FEE69C688E5DF78D56246F1F81D219DA4DC0775F7863F2CAB589B04550CAE2C1
              50E6155A22544DB06DCB1DF4742FAC9EBC1055FE4333432C5A14FBC04EDE8274
              0C0FD4D7077971E7DD15C9FBFD96BFD39B251A63353F5354E57123377540F79B
              3BCB9636F2FC8E35C41A420E6276B8CB1C3BF3CDA5ECC50F7EBCF7F2D981B1B9
              56F8D8BDDFD3B590AD5B3AD034C597A8BDCC1D3E56D92D0D2180D6D6BAD7ECB1
              0FA06A0ADBB7AEE2B9ADAB6645DE34CDC95B2E201B49FCB2361A3061CAFBB1FA
              102FEEBC9B8D5DC59B86E9C4BCFD59D7F5F76E790801ECFEC5FEA3FD9F5D5DBD
              74498CE777ACA1A13EE4EB5537C172EFD2E9F4E8F8F8F8DA5B3A892D3437467E
              D3BDBEF58D6F6C5E8AAAE648A50C0F516B952A35612DB14288C95C2E77209D4E
              FF70EDDAB5E7FF0F3C559D23F2E44C5B0000000049454E44AE426082}
          end>
      end>
    Left = 90
    Top = 570
  end
  object imglistMain: TVirtualImageList
    AutoFill = True
    DisabledGrayscale = False
    DisabledSuffix = '_Disabled'
    Images = <
      item
        CollectionIndex = 0
        CollectionName = 'iconfinder_google-drive_317713'
        Disabled = False
        Name = 'iconfinder_google-drive_317713'
      end
      item
        CollectionIndex = 1
        CollectionName = 'iconfinder_TeamViewer_2744934'
        Disabled = False
        Name = 'iconfinder_TeamViewer_2744934'
      end
      item
        CollectionIndex = 2
        CollectionName = 'iconfinder_gmail_1220367'
        Disabled = False
        Name = 'iconfinder_gmail_1220367'
      end
      item
        CollectionIndex = 3
        CollectionName = 'iconfinder_logo_brand_brands_logos_translate_google_2993668'
        Disabled = False
        Name = 'iconfinder_logo_brand_brands_logos_translate_google_2993668'
      end>
    ImageCollection = imgcollectionMain
    Width = 24
    Height = 24
    Left = 170
    Top = 570
  end
  object popupVert: TUPopupMenu
    Images = imglistMain
    ThemeManager = AppTheme
    ItemsData.Strings = (
      '0|Google Drive|Open link'
      '2|Gmail|Open link'
      '1|TeamViewer|Open link')
    SeparatorChar = '|'
    ItemWidth = 250
    Left = 410
    Top = 570
  end
  object popupHorz: TUPopupMenu
    ThemeManager = AppTheme
    ItemsData.Strings = (
      #57707'|Cut|'
      #57711'|Copy|'
      #57709'|Paste|')
    SeparatorChar = '|'
    Orientation = oHorizontal
    ItemWidth = 80
    OnItemClick = popupHorzItemClick
    Left = 480
    Top = 570
  end
end

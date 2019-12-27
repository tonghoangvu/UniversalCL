object formDemo: TformDemo
  Left = 0
  Top = 0
  Caption = 'Delphi UWP app'
  ClientHeight = 590
  ClientWidth = 1000
  Color = clWhite
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object linkConnected: TUHyperLink
    Left = 540
    Top = 170
    Width = 125
    Height = 17
    Cursor = crHandPoint
    Caption = 'TUHyperLink (default)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 14120960
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ThemeManager = dmMain.AppTheme
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
    Font.Color = 14120960
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ThemeManager = dmMain.AppTheme
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
    ThemeManager = dmMain.AppTheme
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
    ThemeManager = dmMain.AppTheme
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
    ThemeManager = dmMain.AppTheme
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
    ThemeManager = dmMain.AppTheme
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
    ThemeManager = dmMain.AppTheme
    TextKind = tkHeading
  end
  object textTitle: TUText
    Left = 390
    Top = 100
    Width = 132
    Height = 38
    Caption = 'This is title'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -28
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    Transparent = True
    ThemeManager = dmMain.AppTheme
    TextKind = tkTitle
  end
  object sliderHorz: TUSlider
    Left = 560
    Top = 370
    Width = 140
    Height = 25
    ThemeManager = dmMain.AppTheme
    OnChange = sliderHorzChange
    ParentShowHint = False
    ShowHint = False
  end
  object sliderDisabled: TUSlider
    Left = 560
    Top = 340
    Width = 140
    Height = 25
    ThemeManager = dmMain.AppTheme
    ControlState = csDisabled
    Value = 50
    Enabled = False
  end
  object sliderVert: TUSlider
    Left = 680
    Top = 420
    Width = 25
    Height = 70
    ThemeManager = dmMain.AppTheme
    Orientation = oVertical
    Max = 4
  end
  object check2State: TUCheckBox
    Left = 390
    Top = 340
    Width = 134
    Height = 30
    ThemeManager = dmMain.AppTheme
    IconFont.Charset = DEFAULT_CHARSET
    IconFont.Color = clWindowText
    IconFont.Height = -20
    IconFont.Name = 'Segoe MDL2 Assets'
    IconFont.Style = []
    AutoSize = True
    TextOnGlass = True
    State = cbsChecked
    Caption = '2-state checkbox'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object check3State: TUCheckBox
    Left = 390
    Top = 368
    Width = 134
    Height = 30
    ThemeManager = dmMain.AppTheme
    IconFont.Charset = DEFAULT_CHARSET
    IconFont.Color = clWindowText
    IconFont.Height = -20
    IconFont.Name = 'Segoe MDL2 Assets'
    IconFont.Style = []
    AutoSize = True
    AllowGrayed = True
    TextOnGlass = True
    State = cbsGrayed
    Caption = '3-state checkbox'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
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
    ThemeManager = dmMain.AppTheme
    IconFont.Charset = DEFAULT_CHARSET
    IconFont.Color = clWindowText
    IconFont.Height = -20
    IconFont.Name = 'Segoe MDL2 Assets'
    IconFont.Style = []
    AutoSize = True
    Group = 'GroupA'
    CustomActiveColor = 14120960
    TextOnGlass = True
    Caption = 'Radio A1'
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
    ThemeManager = dmMain.AppTheme
    IconFont.Charset = DEFAULT_CHARSET
    IconFont.Color = clWindowText
    IconFont.Height = -20
    IconFont.Name = 'Segoe MDL2 Assets'
    IconFont.Style = []
    AutoSize = True
    IsChecked = True
    Group = 'GroupA'
    CustomActiveColor = 14120960
    TextOnGlass = True
    Caption = 'Radio A2'
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
    Width = 89
    Height = 30
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    ThemeManager = dmMain.AppTheme
    IconFont.Charset = DEFAULT_CHARSET
    IconFont.Color = clWindowText
    IconFont.Height = -20
    IconFont.Name = 'Segoe MDL2 Assets'
    IconFont.Style = []
    AutoSize = True
    Group = 'GroupA'
    CustomActiveColor = 14120960
    TextOnGlass = True
    Caption = 'Radio A3'
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
    ThemeManager = dmMain.AppTheme
    IconFont.Charset = DEFAULT_CHARSET
    IconFont.Color = clWindowText
    IconFont.Height = -20
    IconFont.Name = 'Segoe MDL2 Assets'
    IconFont.Style = []
    AutoSize = True
    Group = 'GroupB'
    CustomActiveColor = 14120960
    TextOnGlass = True
    Caption = 'Radio B1'
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
    ThemeManager = dmMain.AppTheme
    IconFont.Charset = DEFAULT_CHARSET
    IconFont.Color = clWindowText
    IconFont.Height = -20
    IconFont.Name = 'Segoe MDL2 Assets'
    IconFont.Style = []
    AutoSize = True
    IsChecked = True
    Group = 'GroupB'
    CustomActiveColor = 14120960
    TextOnGlass = True
    Caption = 'Radio B2'
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
    ThemeManager = dmMain.AppTheme
    AniSet.AniFunctionKind = afkQuartic
    AniSet.Duration = 250
    AniSet.Step = 25
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
    ThemeManager = dmMain.AppTheme
    AniSet.AniFunctionKind = afkQuartic
    AniSet.Duration = 250
    AniSet.Step = 25
    Value = 45
    Orientation = oHorizontal
    CustomFillColor = 2469894
    CustomBackColor = 13421772
    Color = clBlue
    ParentColor = False
  end
  object progressConnected: TUProgressBar
    Left = 390
    Top = 440
    Width = 251
    Height = 5
    ThemeManager = dmMain.AppTheme
    AniSet.AniFunctionKind = afkQuartic
    AniSet.Duration = 250
    AniSet.Step = 25
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
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = '                  Delphi UWP app'
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
    TabOrder = 22
    ThemeManager = dmMain.AppTheme
    CustomColor = clWhite
    object buttonAppBack: TUQuickButton
      Left = 0
      Top = 0
      Width = 45
      Height = 32
      ThemeManager = dmMain.AppTheme
      ButtonStyle = sbsHighlight
      LightColor = 14120960
      DarkColor = 14120960
      Align = alLeft
      Caption = #57510
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe MDL2 Assets'
      Font.Style = []
      ParentFont = False
    end
    object buttonWinClose: TUQuickButton
      Left = 955
      Top = 0
      Width = 45
      Height = 32
      Hint = 'Close'
      ThemeManager = dmMain.AppTheme
      ButtonStyle = sbsQuit
      LightColor = 2298344
      DarkColor = 2298344
      PressBrightnessDelta = 32
      Align = alRight
      Caption = #57606
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe MDL2 Assets'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object buttonWinMax: TUQuickButton
      Left = 910
      Top = 0
      Width = 45
      Height = 32
      Hint = 'Maximize'
      ThemeManager = dmMain.AppTheme
      ButtonStyle = sbsMax
      LightColor = 13619151
      DarkColor = 3947580
      PressBrightnessDelta = -32
      Align = alRight
      Caption = #57347
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe MDL2 Assets'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object buttonWinMin: TUQuickButton
      Left = 865
      Top = 0
      Width = 45
      Height = 32
      Hint = 'Minimize'
      ThemeManager = dmMain.AppTheme
      ButtonStyle = sbsMin
      LightColor = 13619151
      DarkColor = 3947580
      PressBrightnessDelta = -32
      Align = alRight
      Caption = #59192
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe MDL2 Assets'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object comboAppDPI: TComboBox
      AlignWithMargins = True
      Left = 741
      Top = 4
      Width = 120
      Height = 23
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 0
      Text = '100%'
      OnChange = comboAppDPIChange
      Items.Strings = (
        '100%'
        '125%'
        '150%'
        '175%')
    end
    object comboAppBorderStyle: TComboBox
      AlignWithMargins = True
      Left = 613
      Top = 4
      Width = 120
      Height = 23
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemIndex = 2
      ParentFont = False
      TabOrder = 1
      Text = 'bsSizeable'
      OnChange = comboAppBorderStyleChange
      Items.Strings = (
        'bsDialog'
        'bsSingle'
        'bsSizeable'
        'bsToolWindow'
        'bsSizeToolWin')
    end
  end
  object panelRibbon: TUSmoothBox
    Left = 0
    Top = 32
    Width = 1000
    Height = 60
    HorzScrollBar.Tracking = True
    VertScrollBar.Tracking = True
    Align = alTop
    BorderStyle = bsNone
    DoubleBuffered = True
    Color = 15132390
    ParentColor = False
    ParentDoubleBuffered = False
    TabOrder = 1
    ThemeManager = dmMain.AppTheme
    AniSet.AniFunctionKind = afkQuartic
    AniSet.Duration = 120
    AniSet.Step = 6
    ScrollOrientation = oHorizontal
    object separator1: TUSeparator
      Left = 120
      Top = 0
      Width = 20
      Height = 60
      ThemeManager = dmMain.AppTheme
      CustomColor = clBlack
      Align = alLeft
    end
    object separator2: TUSeparator
      Left = 320
      Top = 0
      Width = 20
      Height = 60
      ThemeManager = dmMain.AppTheme
      CustomColor = clBlack
      Align = alLeft
    end
    object buttonGoBack: TUSymbolButton
      Left = 0
      Top = 0
      Width = 60
      Height = 60
      ThemeManager = dmMain.AppTheme
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
      Detail = 'Alt+Left'
      ShowDetail = False
      Transparent = True
      Align = alLeft
    end
    object buttonGoHome: TUSymbolButton
      Left = 60
      Top = 0
      Width = 60
      Height = 60
      ThemeManager = dmMain.AppTheme
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
      Detail = 'Ctrl+H'
      ShowDetail = False
      Transparent = True
      Align = alLeft
    end
    object buttonNewDoc: TUSymbolButton
      Left = 140
      Top = 0
      Width = 60
      Height = 60
      ThemeManager = dmMain.AppTheme
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
      Detail = 'Ctrl+N'
      ShowDetail = False
      Transparent = True
      Align = alLeft
    end
    object buttonOpenDoc: TUSymbolButton
      Left = 200
      Top = 0
      Width = 60
      Height = 60
      ThemeManager = dmMain.AppTheme
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
      Detail = 'Ctrl+O'
      ShowDetail = False
      Transparent = True
      Align = alLeft
    end
    object buttonLoginForm: TUSymbolButton
      Left = 340
      Top = 0
      Width = 80
      Height = 60
      ThemeManager = dmMain.AppTheme
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
      Text = 'Login form'
      TextOffset = 35
      Detail = 'Detail'
      ShowDetail = False
      Transparent = True
      Align = alLeft
      OnClick = buttonLoginFormClick
    end
    object buttonSaveDoc: TUSymbolButton
      Left = 260
      Top = 0
      Width = 60
      Height = 60
      ThemeManager = dmMain.AppTheme
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
      Detail = 'Ctrl+S'
      ShowDetail = False
      Transparent = True
      Align = alLeft
    end
    object buttonImageForm: TUSymbolButton
      Left = 420
      Top = 0
      Width = 80
      Height = 60
      ThemeManager = dmMain.AppTheme
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
      SymbolChar = #58033
      Text = 'Image form'
      TextOffset = 35
      Detail = 'Detail'
      ShowDetail = False
      Transparent = True
      Align = alLeft
      OnClick = buttonImageFormClick
    end
    object buttonAppListForm: TUSymbolButton
      Left = 500
      Top = 0
      Width = 80
      Height = 60
      ThemeManager = dmMain.AppTheme
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
      SymbolChar = #57721
      Text = 'App list'
      TextOffset = 35
      Detail = 'Detail'
      ShowDetail = False
      Transparent = True
      Align = alLeft
      OnClick = buttonAppListFormClick
    end
  end
  object buttonNoFocus: TUButton
    Tag = 14
    Left = 60
    Top = 190
    Width = 150
    Height = 30
    ThemeManager = dmMain.AppTheme
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
    Alignment = taLeftJustify
    Caption = 'Button no focus'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    OnClick = buttonNoFocusClick
  end
  object buttonCanFocus: TUButton
    Tag = 9
    Left = 60
    Top = 230
    Width = 150
    Height = 30
    ThemeManager = dmMain.AppTheme
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
    Caption = 'Button can focus'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object buttonCustomColor: TUButton
    Tag = 17
    Left = 60
    Top = 270
    Width = 151
    Height = 30
    ThemeManager = dmMain.AppTheme
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
    Alignment = taRightJustify
    Caption = 'Custom button'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object buttonReloadSettings: TUSymbolButton
    Left = 220
    Top = 270
    Width = 151
    Height = 31
    ThemeManager = dmMain.AppTheme
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
    OnClick = buttonReloadSettingsClick
  end
  object buttonHighlight: TUButton
    Tag = 6
    Left = 220
    Top = 230
    Width = 150
    Height = 30
    ThemeManager = dmMain.AppTheme
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
    Highlight = True
    Caption = 'Highlight button'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    OnClick = buttonHighlightClick
  end
  object buttonDisabled: TUButton
    Tag = 7
    Left = 220
    Top = 190
    Width = 150
    Height = 30
    ThemeManager = dmMain.AppTheme
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
    Caption = 'Button disabled'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 6710886
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object buttonToggle: TUButton
    Tag = 5
    Left = 220
    Top = 310
    Width = 151
    Height = 30
    ThemeManager = dmMain.AppTheme
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
    IsToggleButton = True
    Caption = 'Toggle button'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object itembuttonImage: TUItemButton
    Left = 60
    Top = 460
    Width = 311
    Height = 41
    ThemeManager = dmMain.AppTheme
    ImageRightIndex = 3
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
    ObjectsVisible = [iokNone, iokCheckBox, iokLeftIcon, iokText, iokDetail, iokRightIcon]
    LeftIcon = #58031
    Text = 'You clicked on'
    Detail = 'Nothing'
    RightIcon = #57345
    AlignSpace = 10
    CustomActiveColor = 14120960
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = itembuttonImageClick
  end
  object itembuttonFontIcon: TUItemButton
    Left = 60
    Top = 510
    Width = 311
    Height = 41
    Hint = 'ABC'
    ThemeManager = dmMain.AppTheme
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
    LeftIcon = #58031
    Text = 'Don'#39't combine'
    Detail = 'CheckBox and Toggled'
    RightIcon = #57345
    CustomActiveColor = 14120960
    IsToggleButton = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object symbolButtonOpenDisabled: TUSymbolButton
    Left = 130
    Top = 350
    Width = 241
    Height = 41
    ThemeManager = dmMain.AppTheme
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
  end
  object symbolbuttonSaveHorz: TUSymbolButton
    Left = 130
    Top = 400
    Width = 241
    Height = 41
    ThemeManager = dmMain.AppTheme
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
  end
  object symbolbuttonSaveVert: TUSymbolButton
    Left = 60
    Top = 350
    Width = 61
    Height = 91
    ThemeManager = dmMain.AppTheme
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
    IsToggleButton = True
  end
  object buttonRandomProgress: TUButton
    Tag = 5
    Left = 390
    Top = 460
    Width = 251
    Height = 31
    Hint = 'This is tooltip'
    ThemeManager = dmMain.AppTheme
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
    Caption = 'Random progress value'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = buttonRandomProgressClick
  end
  object buttonRunning: TButton
    Left = 60
    Top = 110
    Width = 101
    Height = 25
    Hint = 'ABC'
    Caption = 'Here we go'
    TabOrder = 5
  end
  object buttonAniStart: TButton
    Left = 60
    Top = 140
    Width = 151
    Height = 31
    Caption = 'Start animation'
    TabOrder = 6
    OnClick = buttonAniStartClick
  end
  object buttonAniInverse: TButton
    Left = 220
    Top = 140
    Width = 151
    Height = 31
    Caption = 'Reserve animation'
    ImageIndex = 0
    TabOrder = 7
    OnClick = buttonAniInverseClick
  end
  object buttonWithImage: TUButton
    Tag = 6
    Left = 60
    Top = 310
    Width = 150
    Height = 30
    ThemeManager = dmMain.AppTheme
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
    Caption = 'Button with image'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object drawerNavigation: TUPanel
    Left = 0
    Top = 92
    Width = 45
    Height = 498
    Align = alLeft
    BevelOuter = bvNone
    Color = 15132390
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
    ThemeManager = dmMain.AppTheme
    CustomTextColor = clBlack
    CustomBackColor = 15132390
    object buttonOpenMenu: TUSymbolButton
      Left = 0
      Top = 0
      Width = 45
      Height = 45
      ThemeManager = dmMain.AppTheme
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
      OnClick = buttonOpenMenuClick
    end
    object buttonMenuSettings: TUSymbolButton
      Left = 0
      Top = 90
      Width = 45
      Height = 45
      ThemeManager = dmMain.AppTheme
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
      OnClick = buttonMenuSettingsClick
    end
    object buttonMenuProfile: TUSymbolButton
      Left = 0
      Top = 180
      Width = 45
      Height = 45
      ThemeManager = dmMain.AppTheme
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
    end
    object buttonMenuSave: TUSymbolButton
      Left = 0
      Top = 135
      Width = 45
      Height = 45
      ThemeManager = dmMain.AppTheme
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
    end
    object buttonMenuOpen: TUSymbolButton
      Left = 0
      Top = 45
      Width = 45
      Height = 45
      ThemeManager = dmMain.AppTheme
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
    end
    object buttonMenuRate: TUSymbolButton
      Left = 0
      Top = 225
      Width = 45
      Height = 45
      ThemeManager = dmMain.AppTheme
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
    end
  end
  object boxSmoothScrolling: TUSmoothBox
    Left = 750
    Top = 92
    Width = 250
    Height = 498
    HorzScrollBar.Tracking = True
    VertScrollBar.Tracking = True
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
    TabOrder = 23
    ThemeManager = dmMain.AppTheme
    AniSet.AniFunctionKind = afkQuartic
    AniSet.Duration = 120
    AniSet.Step = 6
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
      ThemeManager = dmMain.AppTheme
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
      ThemeManager = dmMain.AppTheme
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
      ThemeManager = dmMain.AppTheme
      TextKind = tkEntry
      ExplicitWidth = 69
    end
    object imgAvatar: TImage
      Left = 15
      Top = 267
      Width = 203
      Height = 72
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
      ShowHint = False
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
      ThemeManager = dmMain.AppTheme
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
      ThemeManager = dmMain.AppTheme
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
      ThemeManager = dmMain.AppTheme
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
      ThemeManager = dmMain.AppTheme
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
      ThemeManager = dmMain.AppTheme
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
      ThemeManager = dmMain.AppTheme
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
      ThemeManager = dmMain.AppTheme
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
      ThemeManager = dmMain.AppTheme
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
      ThemeManager = dmMain.AppTheme
      CustomTextColors.None = 14120960
      CustomTextColors.Hover = clGray
      CustomTextColors.Press = clMedGray
      CustomTextColors.Disabled = clMedGray
      CustomTextColors.Focused = 14120960
      URL = 'https://example.com/'
      ExplicitWidth = 124
    end
    object checkColorBorder: TUCheckBox
      Left = 15
      Top = 200
      Width = 203
      Height = 30
      ThemeManager = dmMain.AppTheme
      IconFont.Charset = DEFAULT_CHARSET
      IconFont.Color = clWindowText
      IconFont.Height = -20
      IconFont.Name = 'Segoe MDL2 Assets'
      IconFont.Style = []
      Align = alTop
      Caption = 'Color on window border'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitTop = 230
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
      ThemeManager = dmMain.AppTheme
      IconFont.Charset = DEFAULT_CHARSET
      IconFont.Color = clWindowText
      IconFont.Height = -20
      IconFont.Name = 'Segoe MDL2 Assets'
      IconFont.Style = []
      Align = alTop
      Caption = 'Auto synchronize'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitTop = 403
    end
    object checkKeepEmailPrivate: TUCheckBox
      Left = 15
      Top = 433
      Width = 203
      Height = 30
      ThemeManager = dmMain.AppTheme
      IconFont.Charset = DEFAULT_CHARSET
      IconFont.Color = clWindowText
      IconFont.Height = -20
      IconFont.Name = 'Segoe MDL2 Assets'
      IconFont.Style = []
      Align = alTop
      Caption = 'Keep my email in private'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitTop = 463
    end
    object checkSendEmail: TUCheckBox
      Left = 15
      Top = 403
      Width = 203
      Height = 30
      ThemeManager = dmMain.AppTheme
      IconFont.Charset = DEFAULT_CHARSET
      IconFont.Color = clWindowText
      IconFont.Height = -20
      IconFont.Name = 'Segoe MDL2 Assets'
      IconFont.Style = []
      Align = alTop
      Caption = 'Send me emails'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitTop = 433
    end
    object radioSystemTheme: TURadioButton
      Left = 15
      Top = 65
      Width = 203
      Height = 30
      ThemeManager = dmMain.AppTheme
      IconFont.Charset = DEFAULT_CHARSET
      IconFont.Color = clWindowText
      IconFont.Height = -20
      IconFont.Name = 'Segoe MDL2 Assets'
      IconFont.Style = []
      IsChecked = True
      Group = 'AppTheme'
      CustomActiveColor = 14120960
      Align = alTop
      Caption = 'Use system setting'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = radioSystemThemeClick
    end
    object radioLightTheme: TURadioButton
      Left = 15
      Top = 95
      Width = 203
      Height = 30
      ThemeManager = dmMain.AppTheme
      IconFont.Charset = DEFAULT_CHARSET
      IconFont.Color = clWindowText
      IconFont.Height = -20
      IconFont.Name = 'Segoe MDL2 Assets'
      IconFont.Style = []
      Group = 'AppTheme'
      CustomActiveColor = 14120960
      Align = alTop
      Caption = 'Light'
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
      ThemeManager = dmMain.AppTheme
      IconFont.Charset = DEFAULT_CHARSET
      IconFont.Color = clWindowText
      IconFont.Height = -20
      IconFont.Name = 'Segoe MDL2 Assets'
      IconFont.Style = []
      Group = 'AppTheme'
      CustomActiveColor = 14120960
      Align = alTop
      Caption = 'Dark'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = radioDarkThemeClick
    end
    object radioFreeAccount: TURadioButton
      Left = 15
      Top = 500
      Width = 203
      Height = 30
      ThemeManager = dmMain.AppTheme
      IconFont.Charset = DEFAULT_CHARSET
      IconFont.Color = clWindowText
      IconFont.Height = -20
      IconFont.Name = 'Segoe MDL2 Assets'
      IconFont.Style = []
      IsChecked = True
      Group = 'AccountType'
      CustomActiveColor = 14120960
      Align = alTop
      Caption = 'Free user'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitTop = 530
    end
    object radioProAccount: TURadioButton
      Left = 15
      Top = 530
      Width = 203
      Height = 30
      ThemeManager = dmMain.AppTheme
      IconFont.Charset = DEFAULT_CHARSET
      IconFont.Color = clWindowText
      IconFont.Height = -20
      IconFont.Name = 'Segoe MDL2 Assets'
      IconFont.Style = []
      Group = 'AccountType'
      CustomActiveColor = 14120960
      Align = alTop
      Caption = 'Professional user'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitTop = 560
    end
    object radioDevAccount: TURadioButton
      Left = 15
      Top = 560
      Width = 203
      Height = 30
      ThemeManager = dmMain.AppTheme
      IconFont.Charset = DEFAULT_CHARSET
      IconFont.Color = clWindowText
      IconFont.Height = -20
      IconFont.Name = 'Segoe MDL2 Assets'
      IconFont.Style = []
      Group = 'AccountType'
      CustomActiveColor = 14120960
      Align = alTop
      Caption = 'Developer'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitTop = 590
    end
    object separatorLastBox: TUSeparator
      Left = 15
      Top = 992
      Width = 203
      Height = 10
      ThemeManager = dmMain.AppTheme
      CustomColor = clBlack
      Orientation = oHorizontal
      AlignSpace = 5
      LineBetween = False
      Align = alTop
      ExplicitTop = 488
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
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Select custom accent color'
      Color = 14120960
      FullRepaint = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      OnClick = panelSelectAccentColorClick
      CustomTextColor = clWhite
      CustomBackColor = 14120960
    end
    object buttonDeleteAccount: TUButton
      Tag = 2
      AlignWithMargins = True
      Left = 15
      Top = 595
      Width = 203
      Height = 30
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 10
      ThemeManager = dmMain.AppTheme
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
      Align = alTop
      Caption = 'Delete my account'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object buttonUpgradeAccount: TUButton
      Tag = 2
      AlignWithMargins = True
      Left = 15
      Top = 712
      Width = 203
      Height = 30
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 10
      ThemeManager = dmMain.AppTheme
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
      Align = alTop
      Caption = 'Upgrade account'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
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
      ThemeManager = dmMain.AppTheme
      AniSet.AniFunctionKind = afkQuartic
      AniSet.Duration = 250
      AniSet.Step = 25
      Value = 64
      Orientation = oHorizontal
      CustomFillColor = 2469894
      CustomBackColor = 15132390
      Align = alTop
    end
    object buttonCheckUpdate: TUButton
      Tag = 2
      AlignWithMargins = True
      Left = 15
      Top = 865
      Width = 203
      Height = 30
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 10
      ThemeManager = dmMain.AppTheme
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
      Align = alTop
      Caption = 'Check for update'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object editAccountName: TUEdit
      Left = 15
      Top = 339
      Width = 203
      Height = 29
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      Padding.Left = 5
      Padding.Top = 5
      Padding.Right = 4
      Padding.Bottom = 4
      ParentColor = True
      ParentFont = False
      ShowCaption = False
      TabOrder = 3
      ThemeManager = dmMain.AppTheme
      Edit.Left = 5
      Edit.Top = 5
      Edit.Width = 194
      Edit.Height = 20
      Edit.Align = alClient
      Edit.AutoSize = False
      Edit.BorderStyle = bsNone
      Edit.Color = clWhite
      Edit.Font.Charset = DEFAULT_CHARSET
      Edit.Font.Color = clBlack
      Edit.Font.Height = -13
      Edit.Font.Name = 'Segoe UI'
      Edit.Font.Style = []
      Edit.ParentFont = False
      Edit.PopupMenu = popupEdit
      Edit.TabOrder = 0
      Edit.TextHint = 'Right click to open context menu'
    end
  end
  object dialogSelectColor: TColorDialog
    Color = 14120960
    Left = 720
    Top = 40
  end
  object popupEdit: TUPopupMenu
    ThemeManager = dmMain.AppTheme
    AniSet.AniFunctionKind = afkQuartic
    AniSet.Duration = 120
    OnItemClick = popupEditItemClick
    Left = 640
    Top = 42
    object CutCtrlX1: TMenuItem
      Caption = #57707'Cut|Ctrl+X'
      Hint = 'Remove the selected content and put it on the clipboard'
    end
    object CopyCtrlC1: TMenuItem
      Caption = #57711'Copy|Ctrl+C'
      Hint = 'Copy the selected content to the clipboard'
    end
    object PasteCtrlV1: TMenuItem
      Caption = #57709'Paste|Ctrl+V'
      Hint = 'Insert the contents of the clipboard at the current location'
    end
  end
end

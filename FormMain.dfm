object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Test UCL controls'
  ClientHeight = 706
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
    Left = 50
    Top = 440
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
    Left = 120
    Top = 490
    Width = 291
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
    Text = 'Save this document'
    Detail = 'Ctrl+S'
    ParentShowHint = False
    ShowHint = True
  end
  object symbolButtonOpenDisabled: TUSymbolButton
    Left = 120
    Top = 440
    Width = 291
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
    Text = 'Open document (disabled)'
    Detail = 'Ctrl+O'
  end
  object textTitle: TUText
    Left = 50
    Top = 40
    Width = 186
    Height = 38
    Hint = 'ABC'
    Caption = 'This is title text'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -28
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    ThemeManager = UThemeManager1
    TextKind = tkTitle
  end
  object textHeading: TUText
    Left = 50
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
    Left = 50
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
    Left = 50
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
    Left = 50
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
    Left = 50
    Top = 350
    Width = 154
    Height = 17
    Cursor = crHandPoint
    Caption = 'https://embarcadero.com/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 14120960
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ThemeManager = UThemeManager1
  end
  object linkCustomColor: TUHyperLink
    Left = 50
    Top = 380
    Width = 154
    Height = 17
    Cursor = crHandPoint
    Caption = 'https://embarcadero.com/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 14120960
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsUnderline]
    ParentFont = False
  end
  object linkDisabled: TUHyperLink
    Left = 50
    Top = 410
    Width = 154
    Height = 17
    Caption = 'https://embarcadero.com/'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsUnderline]
    ParentFont = False
    ButtonState = bsDisabled
  end
  object buttonReloadSettings: TUSymbolButton
    Left = 250
    Top = 580
    Width = 161
    Height = 55
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
    Text = 'Reload theme settings'
    Detail = 'Detail'
    ShowDetail = False
    OnClick = buttonReloadSettingsClick
  end
  object progressCustomColor: TUProgressBar
    Left = 250
    Top = 90
    Width = 225
    Height = 5
    Value = 45
    Orientation = oHorizontal
    CustomForeColor = 2469894
    CustomBackColor = clRed
    Color = clBlue
  end
  object progressConnected: TUProgressBar
    Left = 250
    Top = 110
    Width = 225
    Height = 5
    ThemeManager = UThemeManager1
    Value = 20
    Orientation = oHorizontal
    CustomForeColor = 2469894
    CustomBackColor = 15132390
  end
  object progressVert: TUProgressBar
    Left = 490
    Top = 90
    Width = 5
    Height = 100
    ThemeManager = UThemeManager1
    Value = 45
    Orientation = oVertical
    CustomForeColor = 2469894
    CustomBackColor = 15132390
  end
  object check3State: TUCheckBox
    Left = 430
    Top = 360
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
    Left = 430
    Top = 330
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
    Left = 430
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
    Left = 430
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
    Left = 620
    Top = 230
    Width = 200
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
    Left = 430
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
    Left = 620
    Top = 260
    Width = 200
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
  object buttonFormBorderColor: TButton
    Left = 250
    Top = 50
    Width = 245
    Height = 25
    Caption = 'Enable / disable form border color'
    TabOrder = 0
    OnClick = buttonFormBorderColorClick
  end
  object buttonRunning: TButton
    Left = 50
    Top = 540
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
    TabOrder = 1
  end
  object captionbarOldStyle: TUCaptionBar
    Left = 0
    Top = 674
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
    Left = 250
    Top = 230
    Width = 150
    Height = 30
    ThemeManager = UThemeManager1
    Text = 'TUButton no focus'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 4
  end
  object buttonDisabled: TUButton
    Left = 250
    Top = 350
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
    TabOrder = 5
  end
  object panelDisconnected: TUPanel
    Left = 50
    Top = 280
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
    TabOrder = 2
  end
  object panelConnected: TUPanel
    Left = 50
    Top = 210
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
    TabOrder = 3
  end
  object buttonAniStart: TButton
    Left = 50
    Top = 580
    Width = 191
    Height = 25
    Caption = 'Start Button3.Left animation'
    TabOrder = 7
    OnClick = buttonAniStartClick
  end
  object buttonRandomProgress: TUButton
    Left = 250
    Top = 130
    Width = 221
    Height = 30
    ThemeManager = UThemeManager1
    Text = 'Random value'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 8
    OnClick = buttonRandomProgressClick
  end
  object buttonAniInverse: TButton
    Left = 50
    Top = 610
    Width = 191
    Height = 25
    Caption = 'Inverse Button3.Left animation'
    TabOrder = 9
    OnClick = buttonAniInverseClick
  end
  object buttonCanFocus1: TUButton
    Left = 250
    Top = 270
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
    TabOrder = 10
    TabStop = True
  end
  object buttonCanFocus2: TUButton
    Left = 250
    Top = 310
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
    TabOrder = 11
    TabStop = True
  end
  object drawerNavigation: TUPanel
    Left = 0
    Top = 32
    Width = 40
    Height = 642
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
    TabOrder = 12
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
  object switchChangeTheme: TUSwitch
    Left = 250
    Top = 170
    Width = 110
    Height = 20
    ThemeManager = UThemeManager1
    CustomColor = 8951296
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    StateCaptions.CaptionOn = 'Dark theme'
    StateCaptions.CaptionOff = 'Light theme'
    SwitchWidth = 40
    TabOrder = 13
    OnClick = switchChangeThemeClick
  end
  object switchCustomColor: TUSwitch
    Left = 250
    Top = 200
    Width = 259
    Height = 20
    CustomColor = 8951296
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    StateCaptions.CaptionOn = 'TUSwitch custom color (unmanaged)'
    StateCaptions.CaptionOff = 'TUSwitch custom color (unmanaged)'
    SwitchWidth = 40
    TabOrder = 14
  end
  object boxSmoothScrolling: TUScrollBox
    Left = 824
    Top = 32
    Width = 250
    Height = 642
    Align = alRight
    BorderStyle = bsNone
    DoubleBuffered = True
    Color = 15132390
    ParentColor = False
    ParentDoubleBuffered = False
    TabOrder = 15
    ThemeManager = UThemeManager1
    object Button1: TButton
      Left = 0
      Top = 0
      Width = 250
      Height = 25
      Align = alTop
      Caption = 'Button1'
      TabOrder = 0
    end
    object Button2: TButton
      Left = 20
      Top = 140
      Width = 151
      Height = 25
      Caption = 'Button1'
      TabOrder = 1
    end
    object Button3: TButton
      Left = 30
      Top = 240
      Width = 151
      Height = 25
      Caption = 'Button1'
      TabOrder = 2
    end
    object Button4: TButton
      Left = 30
      Top = 340
      Width = 151
      Height = 25
      Caption = 'Button1'
      TabOrder = 3
    end
    object Button6: TButton
      Left = 30
      Top = 950
      Width = 151
      Height = 25
      Caption = 'Button1'
      TabOrder = 4
    end
    object Button7: TButton
      Left = 30
      Top = 840
      Width = 151
      Height = 25
      Caption = 'Button1'
      TabOrder = 5
    end
    object Button8: TButton
      Left = 30
      Top = 740
      Width = 151
      Height = 25
      Caption = 'Button1'
      TabOrder = 6
    end
    object Button9: TButton
      Left = 20
      Top = 640
      Width = 151
      Height = 25
      Caption = 'Button1'
      TabOrder = 7
    end
    object Button10: TButton
      Left = 20
      Top = 540
      Width = 151
      Height = 25
      Caption = 'Button1'
      TabOrder = 8
    end
    object Button11: TButton
      Left = 50
      Top = 1210
      Width = 151
      Height = 25
      Caption = 'Button1'
      TabOrder = 9
    end
    object Button12: TButton
      Left = 50
      Top = 1100
      Width = 151
      Height = 25
      Caption = 'Button1'
      TabOrder = 10
    end
    object Button13: TButton
      Left = 50
      Top = 1000
      Width = 151
      Height = 25
      Caption = 'Button1'
      TabOrder = 11
    end
    object Button14: TButton
      Left = 40
      Top = 900
      Width = 151
      Height = 25
      Caption = 'Button1'
      TabOrder = 12
    end
    object Button15: TButton
      Left = 40
      Top = 800
      Width = 151
      Height = 25
      Caption = 'Button1'
      TabOrder = 13
    end
    object Edit1: TEdit
      Left = 60
      Top = 70
      Width = 121
      Height = 21
      TabOrder = 14
      Text = 'Edit1'
    end
    object Memo1: TMemo
      Left = 30
      Top = 410
      Width = 185
      Height = 89
      Lines.Strings = (
        'Memo1')
      TabOrder = 15
    end
    object Panel1: TPanel
      Left = 30
      Top = 1239
      Width = 185
      Height = 402
      Caption = 'Panel1'
      TabOrder = 16
    end
    object RadioButton1: TRadioButton
      Left = 70
      Top = 1669
      Width = 113
      Height = 17
      Caption = 'RadioButton1'
      TabOrder = 17
    end
  end
  object buttonCustomColor: TUButton
    Left = 250
    Top = 390
    Width = 151
    Height = 30
    Text = 'Custom button'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 16
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
    ThemeKind = tkLight
    CustomColor = clRed
    Left = 720
    Top = 40
  end
end

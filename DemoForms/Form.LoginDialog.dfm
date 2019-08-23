object formLoginDialog: TformLoginDialog
  Left = 0
  Top = 0
  Caption = 'Login'
  ClientHeight = 550
  ClientWidth = 400
  Color = clWindow
  Constraints.MinHeight = 150
  Constraints.MinWidth = 290
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object imageSplash: TImage
    Left = 0
    Top = 32
    Width = 400
    Height = 466
    Align = alClient
    Center = True
    IncrementalDisplay = True
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000580000
      00580804000000DB9CF8BF0000018C4944415478DAEDD6DD6DC3300C04607A82
      6683768366A366937A848E90113242464947E804A98D368813EB8794488906EE
      1E0C3F191F6C1FC5E14ADBCA0030C000030C30C0007B0AC000030C700FF081C6
      E93AD2710BE019FBFA7FFFAD8FD6052FB1B728A3F5C021AC015A079CC22AA3EB
      C11CAC22BA0E2CC12AA1CBC12558057419B8065B89968335B015681958135B88
      E6832DB005681ED8122B44E7C12DB002741ADC12CB44C7C13DB00C741C7CB1D9
      6759995FD69B147C25937D96859DBFEC5002A6C6E8E56F580C6E857EEE4C15D8
      1A1D2A7835D80A1D9B462A606D746A74AA81B5D0B939AF0AAE45730E25757029
      9A7B829A80A568C9716F06E6A2A5BB892938872E59A4CCC129F4913EC4CF6A02
      8EA347FAF40A8EA10FF4452F5EC161F49ECE0272737008BD9BC8EF9EC16BF46E
      FA317805EC065EA37905EC0A7E46730AD81DFC88CE17D0057889CE15D00DF88E
      4E17D015F88E8E17D01DF886A648015D82FFD0A7696AACC96EC1737EB6060ECA
      00061860E760A70118608001061860805D056080010618E0BEF9058B97F801D7
      15C21E0000000049454E44AE426082}
    Transparent = True
    ExplicitLeft = 90
    ExplicitTop = 30
    ExplicitWidth = 105
    ExplicitHeight = 105
  end
  object boxMain: TUScrollBox
    Left = 0
    Top = 32
    Width = 400
    Height = 466
    Align = alClient
    BorderStyle = bsNone
    DoubleBuffered = True
    Color = 15132390
    Padding.Left = 40
    Padding.Right = 40
    Padding.Bottom = 50
    ParentColor = False
    ParentDoubleBuffered = False
    TabOrder = 0
    Visible = False
    ThemeManager = AppTheme
    MaxScrollCount = 6
    object titleSignin: TUText
      AlignWithMargins = True
      Left = 40
      Top = 50
      Width = 320
      Height = 38
      Margins.Left = 0
      Margins.Top = 50
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alTop
      Alignment = taCenter
      Caption = 'Hello, John'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 14120960
      Font.Height = -28
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ThemeManager = AppTheme
      TextKind = tkTitle
      UseAccentColor = True
      ExplicitWidth = 137
    end
    object headingSignin: TUText
      AlignWithMargins = True
      Left = 40
      Top = 88
      Width = 320
      Height = 28
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 20
      Align = alTop
      Alignment = taCenter
      Caption = 'Log in to your account'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ThemeManager = AppTheme
      TextKind = tkHeading
      ExplicitWidth = 197
    end
    object entryPassword: TUText
      Left = 40
      Top = 207
      Width = 320
      Height = 17
      Align = alTop
      Caption = 'Password'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      ThemeManager = AppTheme
      TextKind = tkEntry
      ExplicitWidth = 58
    end
    object entryEmail: TUText
      Left = 40
      Top = 136
      Width = 320
      Height = 17
      Align = alTop
      Caption = 'Email'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      ThemeManager = AppTheme
      TextKind = tkEntry
      ExplicitWidth = 32
    end
    object UText1: TUText
      AlignWithMargins = True
      Left = 40
      Top = 349
      Width = 320
      Height = 15
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 5
      Align = alTop
      Caption = 'Show more options'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6710886
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = UText1Click
      ThemeManager = AppTheme
      TextKind = tkDescription
      ExplicitWidth = 103
    end
    object entryDescription: TUText
      Left = 40
      Top = 278
      Width = 320
      Height = 17
      Align = alTop
      Caption = 'Description (optional)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      ThemeManager = AppTheme
      TextKind = tkEntry
      ExplicitWidth = 130
    end
    object panelMoreOptions: TUPanel
      Left = 40
      Top = 369
      Width = 320
      Height = 80
      ThemeManager = AppTheme
      CustomTextColor = clBlack
      CustomBackColor = 15132390
      Align = alTop
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      ShowCaption = False
      TabOrder = 0
      Visible = False
      object checkSendMeNews: TUCheckBox
        Left = 0
        Top = 30
        Width = 320
        Height = 30
        ThemeManager = AppTheme
        IconFont.Charset = DEFAULT_CHARSET
        IconFont.Color = clWindowText
        IconFont.Height = -20
        IconFont.Name = 'Segoe MDL2 Assets'
        IconFont.Style = []
        AutoSize = False
        Text = 'Send me notifications about news, offers'
        CustomActiveColor = 14120960
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object checkKeepLogin: TUCheckBox
        Left = 0
        Top = 0
        Width = 320
        Height = 30
        ThemeManager = AppTheme
        IconFont.Charset = DEFAULT_CHARSET
        IconFont.Color = clWindowText
        IconFont.Height = -20
        IconFont.Name = 'Segoe MDL2 Assets'
        IconFont.Style = []
        AutoSize = False
        Text = 'Keep me logged in'
        State = cbsChecked
        CustomActiveColor = 14120960
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
    end
    object editEmail: TUEdit
      AlignWithMargins = True
      Left = 40
      Top = 158
      Width = 320
      Height = 29
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 20
      ThemeManager = AppTheme
      Edit.Left = 5
      Edit.Top = 5
      Edit.Width = 310
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
      Edit.PopupMenu = popupEditAction
      Edit.TabOrder = 0
      Edit.TextHint = 'Enter your email here'
      Align = alTop
      BevelOuter = bvNone
      UseDockManager = False
      Padding.Left = 5
      Padding.Top = 5
      Padding.Right = 5
      Padding.Bottom = 3
      ParentFont = False
      TabOrder = 1
    end
    object editPassword: TUEdit
      AlignWithMargins = True
      Left = 40
      Top = 229
      Width = 320
      Height = 29
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 20
      ThemeManager = AppTheme
      Edit.Left = 5
      Edit.Top = 5
      Edit.Width = 310
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
      Edit.PasswordChar = '*'
      Edit.PopupMenu = popupEditAction
      Edit.TabOrder = 0
      Edit.TextHint = 'Enter your password here'
      Align = alTop
      BevelOuter = bvNone
      UseDockManager = False
      Padding.Left = 5
      Padding.Top = 5
      Padding.Right = 5
      Padding.Bottom = 3
      ParentFont = False
      TabOrder = 2
    end
    object editDescription: TUEdit
      AlignWithMargins = True
      Left = 40
      Top = 300
      Width = 320
      Height = 29
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 20
      ThemeManager = AppTheme
      Edit.Left = 5
      Edit.Top = 5
      Edit.Width = 310
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
      Edit.PopupMenu = popupEditAction
      Edit.TabOrder = 0
      Edit.TextHint = 'Talk about yourself'
      Transparent = True
      Align = alTop
      BevelOuter = bvNone
      UseDockManager = False
      Padding.Left = 5
      Padding.Top = 5
      Padding.Right = 5
      Padding.Bottom = 3
      ParentFont = False
      TabOrder = 3
    end
  end
  object captionbarMain: TUCaptionBar
    Left = 0
    Top = 0
    Width = 400
    Height = 32
    ThemeManager = AppTheme
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = '   Login'
    Color = 15921906
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    object buttonAppQuit: TUQuickButton
      Left = 355
      Top = 0
      Width = 45
      Height = 32
      ThemeManager = AppTheme
      LightColor = 2298344
      DarkColor = 2298344
      PressBrightnessDelta = 32
      Align = alRight
      BevelOuter = bvNone
      Caption = #57606
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe MDL2 Assets'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 0
      OnClick = buttonAppQuitClick
    end
    object buttonAppMinimized: TUQuickButton
      Left = 310
      Top = 0
      Width = 45
      Height = 32
      ThemeManager = AppTheme
      LightColor = 13619151
      DarkColor = 3947580
      PressBrightnessDelta = -32
      Align = alRight
      BevelOuter = bvNone
      Caption = #59192
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe MDL2 Assets'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 1
      OnClick = buttonAppMinimizedClick
    end
    object buttonAppTheme: TUQuickButton
      Left = 265
      Top = 0
      Width = 45
      Height = 32
      ThemeManager = AppTheme
      LightColor = 13619151
      DarkColor = 3947580
      PressBrightnessDelta = -32
      Align = alRight
      BevelOuter = bvNone
      Caption = #59144
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe MDL2 Assets'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 2
      OnClick = buttonAppThemeClick
    end
  end
  object panelAction: TUPanel
    Left = 0
    Top = 498
    Width = 400
    Height = 52
    ThemeManager = AppTheme
    CustomTextColor = clBlack
    CustomBackColor = 15132390
    Align = alBottom
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Padding.Left = 10
    Padding.Top = 10
    Padding.Right = 10
    Padding.Bottom = 10
    ParentBackground = False
    ParentFont = False
    ShowCaption = False
    TabOrder = 2
    Visible = False
    object buttonOk: TUButton
      Left = 260
      Top = 10
      Width = 130
      Height = 32
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
      Text = 'Ok'
      Highlight = True
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = True
      OnClick = buttonOkClick
    end
    object buttonCancel: TUButton
      AlignWithMargins = True
      Left = 120
      Top = 10
      Width = 130
      Height = 32
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 0
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
      Text = 'Cancel'
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TabStop = True
      OnClick = buttonCancelClick
    end
  end
  object AppTheme: TUThemeManager
    Left = 270
    Top = 42
  end
  object timerSplashScreen: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = timerSplashScreenTimer
    Left = 100
    Top = 42
  end
  object popupEditAction: TUPopupMenu
    ThemeManager = AppTheme
    ItemsData.Strings = (
      ' |Cut|Ctrl+X'
      ' |Copy|Ctrl+C'
      ' |Paste|Ctrl+V')
    SeparatorChar = '|'
    Left = 190
    Top = 42
  end
end

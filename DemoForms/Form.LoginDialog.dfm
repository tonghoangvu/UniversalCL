object formLoginDialog: TformLoginDialog
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Login'
  ClientHeight = 560
  ClientWidth = 410
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object boxMain: TUScrollBox
    Left = 0
    Top = 32
    Width = 410
    Height = 476
    Align = alClient
    Color = 15132390
    Padding.Left = 40
    Padding.Right = 40
    Padding.Bottom = 50
    ParentColor = False
    TabOrder = 0
    ThemeManager = dmMain.AppTheme
    AniSet.AniKind = akOut
    AniSet.AniFunctionKind = afkQuartic
    AniSet.DelayStartTime = 0
    AniSet.Duration = 250
    AniSet.Step = 25
    MaxScrollCount = 6
    object titleSignin: TUText
      AlignWithMargins = True
      Left = 40
      Top = 50
      Width = 330
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
      ThemeManager = dmMain.AppTheme
      TextKind = tkTitle
      UseAccentColor = True
      ExplicitWidth = 137
    end
    object headingSignin: TUText
      AlignWithMargins = True
      Left = 40
      Top = 88
      Width = 330
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
      ThemeManager = dmMain.AppTheme
      TextKind = tkHeading
      ExplicitTop = 67
      ExplicitWidth = 197
    end
    object entryPassword: TUText
      Left = 40
      Top = 207
      Width = 330
      Height = 17
      Align = alTop
      Caption = 'Password'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      ThemeManager = dmMain.AppTheme
      TextKind = tkEntry
      ExplicitTop = 175
      ExplicitWidth = 58
    end
    object entryEmail: TUText
      Left = 40
      Top = 136
      Width = 330
      Height = 17
      Align = alTop
      Caption = 'Email'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      ThemeManager = dmMain.AppTheme
      TextKind = tkEntry
      ExplicitTop = 104
      ExplicitWidth = 32
    end
    object textShowMoreOptions: TUText
      AlignWithMargins = True
      Left = 40
      Top = 349
      Width = 330
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
      OnClick = textShowMoreOptionsClick
      ThemeManager = dmMain.AppTheme
      TextKind = tkDescription
      ExplicitTop = 317
      ExplicitWidth = 103
    end
    object entryDescription: TUText
      Left = 40
      Top = 278
      Width = 330
      Height = 17
      Align = alTop
      Caption = 'Description (optional)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      ThemeManager = dmMain.AppTheme
      TextKind = tkEntry
      ExplicitTop = 246
      ExplicitWidth = 130
    end
    object panelMoreOptions: TUPanel
      Left = 40
      Top = 369
      Width = 330
      Height = 80
      Align = alTop
      Color = 15132390
      ShowCaption = False
      TabOrder = 0
      Visible = False
      ThemeManager = dmMain.AppTheme
      BackColor.Enabled = False
      BackColor.Color = clBlack
      BackColor.LightColor = 15132390
      BackColor.DarkColor = 2039583
      object checkSendMeNews: TUCheckBox
        Left = 0
        Top = 30
        Width = 330
        ThemeManager = dmMain.AppTheme
        IconFont.Charset = DEFAULT_CHARSET
        IconFont.Color = clWindowText
        IconFont.Height = -20
        IconFont.Name = 'Segoe MDL2 Assets'
        IconFont.Style = []
        Align = alTop
        Caption = 'Send me news about offers'
      end
      object checkKeepLogin: TUCheckBox
        Left = 0
        Top = 0
        Width = 330
        ThemeManager = dmMain.AppTheme
        IconFont.Charset = DEFAULT_CHARSET
        IconFont.Color = clWindowText
        IconFont.Height = -20
        IconFont.Name = 'Segoe MDL2 Assets'
        IconFont.Style = []
        State = cbsChecked
        Align = alTop
        Caption = 'Keep me logged in'
      end
    end
    object editEmail: TUEdit
      AlignWithMargins = True
      Left = 40
      Top = 158
      Width = 330
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 20
      Align = alTop
      UseDockManager = False
      TabOrder = 1
      ThemeManager = dmMain.AppTheme
      Edit.Left = 5
      Edit.Top = 5
      Edit.Width = 321
      Edit.ParentColor = False
      Edit.ParentFont = False
      Edit.PopupMenu = popupEdit
      Edit.TextHint = 'Enter your email here'
    end
    object editPassword: TUEdit
      AlignWithMargins = True
      Left = 40
      Top = 229
      Width = 330
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 20
      Align = alTop
      UseDockManager = False
      TabOrder = 2
      ThemeManager = dmMain.AppTheme
      Edit.Left = 5
      Edit.Top = 5
      Edit.Width = 321
      Edit.ParentColor = False
      Edit.ParentFont = False
      Edit.PasswordChar = '*'
      Edit.PopupMenu = popupEdit
      Edit.TextHint = 'Enter your password here'
    end
    object editDescription: TUEdit
      AlignWithMargins = True
      Left = 40
      Top = 300
      Width = 330
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 20
      Align = alTop
      UseDockManager = False
      ParentColor = True
      TabOrder = 3
      ThemeManager = dmMain.AppTheme
      Edit.Left = 5
      Edit.Top = 5
      Edit.Width = 321
      Edit.ParentFont = False
      Edit.PopupMenu = popupEdit
      Edit.TextHint = 'Talk about yourself'
      Transparent = True
    end
  end
  object captionbarMain: TUCaptionBar
    Left = 0
    Top = 0
    Width = 410
    Caption = '   Login'
    Color = 15921906
    ParentBackground = False
    TabOrder = 1
    ThemeManager = dmMain.AppTheme
    BackColor.Enabled = False
    BackColor.Color = clBlack
    BackColor.LightColor = 15921906
    BackColor.DarkColor = 2829099
    object buttonAppQuit: TUQuickButton
      Left = 365
      Top = 0
      Hint = 'Close'
      ThemeManager = dmMain.AppTheme
      ButtonStyle = sbsQuit
      LightColor = 2298344
      DarkColor = 2298344
      PressBrightnessDelta = 32
      Align = alRight
      Caption = #57606
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe MDL2 Assets'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object buttonAppMinimized: TUQuickButton
      Left = 320
      Top = 0
      Hint = 'Minimize'
      ThemeManager = dmMain.AppTheme
      ButtonStyle = sbsMin
      LightColor = 13619151
      DarkColor = 3947580
      PressBrightnessDelta = -32
      Align = alRight
      Caption = #59192
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe MDL2 Assets'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object buttonAppTheme: TUQuickButton
      Left = 275
      Top = 0
      Hint = 'Switch theme'
      ThemeManager = dmMain.AppTheme
      ButtonStyle = sbsSysButton
      LightColor = 13619151
      DarkColor = 3947580
      PressBrightnessDelta = -32
      Align = alRight
      Caption = #59144
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe MDL2 Assets'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = buttonAppThemeClick
    end
  end
  object panelAction: TUPanel
    Left = 0
    Top = 508
    Width = 410
    Height = 52
    Align = alBottom
    Color = 15132390
    Padding.Left = 10
    Padding.Top = 10
    Padding.Right = 10
    Padding.Bottom = 10
    ShowCaption = False
    TabOrder = 2
    ThemeManager = dmMain.AppTheme
    BackColor.Enabled = False
    BackColor.Color = clBlack
    BackColor.LightColor = 15132390
    BackColor.DarkColor = 2039583
    object buttonOk: TUButton
      Left = 270
      Top = 10
      Width = 130
      Height = 32
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
      Align = alRight
      Caption = 'Ok'
      OnClick = buttonOkClick
    end
    object buttonCancel: TUButton
      AlignWithMargins = True
      Left = 130
      Top = 10
      Width = 130
      Height = 32
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 0
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
      Align = alRight
      Caption = 'Cancel'
      OnClick = buttonCancelClick
    end
  end
  object popupEdit: TUPopupMenu
    ThemeManager = dmMain.AppTheme
    AniSet.AniKind = akOut
    AniSet.AniFunctionKind = afkQuartic
    AniSet.DelayStartTime = 0
    AniSet.Duration = 120
    AniSet.Step = 20
    OnItemClick = popupEditItemClick
    Left = 40
    Top = 102
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

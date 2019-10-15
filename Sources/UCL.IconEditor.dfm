object FormIcons: TFormIcons
  Left = 0
  Top = 0
  Caption = 'Choose icon'
  ClientHeight = 299
  ClientWidth = 602
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GridIcons: TDrawGrid
    Left = 0
    Top = 0
    Width = 602
    Height = 246
    Align = alClient
    FixedCols = 0
    FixedRows = 0
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe MDL2 Assets'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
    ParentFont = False
    TabOrder = 0
    OnClick = GridIconsClick
    OnDblClick = GridIconsDblClick
    OnDrawCell = GridIconsDrawCell
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 246
    Width = 602
    Height = 53
    Align = alBottom
    Caption = 'PanelBottom'
    ShowCaption = False
    TabOrder = 1
    DesignSize = (
      602
      53)
    object LabelIconDescription: TLabel
      Left = 158
      Top = 19
      Width = 64
      Height = 13
      Caption = '<Not found>'
    end
    object EditIconCode: TEdit
      Left = 16
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'EditIconCode'
    end
    object ButtonOk: TButton
      Left = 416
      Top = 16
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Ok'
      Default = True
      ModalResult = 1
      TabOrder = 1
      OnClick = ButtonOkClick
    end
    object ButtonCancel: TButton
      Left = 512
      Top = 16
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 2
      OnClick = ButtonCancelClick
    end
  end
end

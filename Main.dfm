object MainForm: TMainForm
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'RSA E\D'
  ClientHeight = 384
  ClientWidth = 494
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Padding.Left = 5
  Padding.Top = 5
  Padding.Right = 5
  Padding.Bottom = 5
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object EditP: TEdit
    Left = 5
    Top = 5
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 0
    TextHint = 'Input P'
    OnChange = EditPChange
  end
  object EditQ: TEdit
    Left = 5
    Top = 32
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 1
    TextHint = 'Input Q'
    OnChange = EditQChange
  end
  object EncButton: TButton
    Left = 141
    Top = 5
    Width = 75
    Height = 25
    Caption = 'Encrypt'
    Enabled = False
    TabOrder = 2
    OnClick = EncButtonClick
  end
  object Button2: TButton
    Left = 141
    Top = 115
    Width = 75
    Height = 25
    Caption = 'Decrypt'
    TabOrder = 3
  end
  object InfoMemo: TMemo
    Left = 237
    Top = 7
    Width = 249
    Height = 158
    Lines.Strings = (
      'InfoMemo')
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object Edit3: TEdit
    Left = 5
    Top = 117
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'Edit1'
  end
  object Edit4: TEdit
    Left = 5
    Top = 144
    Width = 121
    Height = 21
    TabOrder = 6
    Text = 'Edit1'
  end
  object ResultMemo: TMemo
    Left = 8
    Top = 188
    Width = 481
    Height = 191
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 7
  end
end

object frmCalculator: TfrmCalculator
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Let'#39's Calculate'
  ClientHeight = 410
  ClientWidth = 466
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object pnMain: TPanel
    Left = 0
    Top = 56
    Width = 466
    Height = 354
    Align = alClient
    Color = 15850149
    Enabled = False
    ParentBackground = False
    TabOrder = 0
    object lblValue1: TLabel
      Left = 16
      Top = 25
      Width = 103
      Height = 17
      Caption = 'Insert a number:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValue2: TLabel
      Left = 16
      Top = 75
      Width = 103
      Height = 17
      Caption = 'Insert a number:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object edtValue1: TEdit
      Left = 16
      Top = 48
      Width = 60
      Height = 23
      ImeName = 'edtValue1'
      MaxLength = 5
      TabOrder = 0
      OnKeyPress = edtValue1KeyPress
    end
    object edtValue2: TEdit
      Left = 16
      Top = 94
      Width = 60
      Height = 23
      ImeName = 'edtValue2'
      MaxLength = 5
      TabOrder = 1
      Visible = False
    end
    object mmResult: TMemo
      Left = 165
      Top = 25
      Width = 286
      Height = 309
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 466
    Height = 56
    ButtonHeight = 56
    ButtonWidth = 64
    Caption = 'ToolBar1'
    Images = DataModule1.VirtualImageList1
    TabOrder = 1
    object btnBack: TToolButton
      Left = 0
      Top = 0
      Hint = 'Back'
      Caption = 'btnBack'
      ImageIndex = 6
      ImageName = 'back'
      ParentShowHint = False
      ShowHint = True
      OnClick = btnBackClick
    end
    object btnCancel: TToolButton
      Left = 64
      Top = 0
      Hint = 'Cancel'
      Caption = 'btnCancel'
      Enabled = False
      ImageIndex = 20
      ImageName = 'cancel 72'
      ParentShowHint = False
      ShowHint = True
      OnClick = btnCancelClick
    end
    object btnSubtract: TToolButton
      Left = 128
      Top = 0
      Hint = 'Subtract'
      Caption = 'btnSubtract'
      ImageIndex = 0
      ImageName = 'minus'
      ParentShowHint = False
      ShowHint = True
      OnClick = btnSubtractClick
    end
    object btnDivide: TToolButton
      Left = 192
      Top = 0
      Hint = 'Divide'
      Caption = 'btnDivide'
      ImageIndex = 17
      ImageName = 'division 72'
      ParentShowHint = False
      ShowHint = True
      OnClick = btnDivideClick
    end
    object btnMultiply: TToolButton
      Left = 256
      Top = 0
      Hint = 'Multiply'
      Caption = 'btnMultiply'
      DropdownMenu = ppMultiplication
      ImageIndex = 12
      ImageName = 'cross'
      ParentShowHint = False
      PopupMenu = ppMultiplication
      ShowHint = True
      Style = tbsDropDown
    end
    object btnAdd: TToolButton
      Left = 339
      Top = 0
      Hint = 'Sum'
      Caption = 'btnAdd'
      ImageIndex = 19
      ImageName = 'plus 72'
      ParentShowHint = False
      ShowHint = True
      OnClick = btnAddClick
    end
    object btnConfirm: TToolButton
      Left = 403
      Top = 0
      Hint = 'Confirm'
      Caption = 'btnConfirm'
      Enabled = False
      ImageIndex = 11
      ImageName = 'checkmark 72'
      ParentShowHint = False
      ShowHint = True
      OnClick = btnConfirmClick
    end
  end
  object ppMultiplication: TPopupMenu
    TrackButton = tbLeftButton
    Left = 24
    Top = 240
    object btnMultiplicationTable: TMenuItem
      Caption = 'Multiplication Table'
      OnClick = btnMultiplicationTableClick
    end
    object btnMultiplication: TMenuItem
      Caption = 'Simple Multiplication'
      OnClick = btnMultiplicationClick
    end
  end
end

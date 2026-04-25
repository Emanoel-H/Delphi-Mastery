object frmJsonToObject: TfrmJsonToObject
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Convert a JSON into your User'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object pnMain: TPanel
    Left = 0
    Top = 56
    Width = 628
    Height = 386
    Align = alClient
    Color = clBlack
    Enabled = False
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 622
    ExplicitHeight = 377
    object lblCode: TLabel
      Left = 16
      Top = 153
      Width = 35
      Height = 17
      Caption = 'Code:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      Font.Quality = fqClearType
      ParentColor = False
      ParentFont = False
      Visible = False
    end
    object lblName: TLabel
      Left = 16
      Top = 203
      Width = 40
      Height = 17
      Caption = 'Name:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      Font.Quality = fqClearType
      ParentColor = False
      ParentFont = False
      Visible = False
    end
    object lblEmail: TLabel
      Left = 16
      Top = 250
      Width = 38
      Height = 17
      Caption = 'Email:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      Font.Quality = fqClearType
      ParentColor = False
      ParentFont = False
      Visible = False
    end
    object lblJson: TLabel
      Left = 16
      Top = 21
      Width = 37
      Height = 17
      Caption = 'JSON:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      Font.Quality = fqClearType
      ParentColor = False
      ParentFont = False
    end
    object edtCode: TEdit
      Left = 16
      Top = 176
      Width = 60
      Height = 23
      Enabled = False
      ImeName = 'edtValue1'
      MaxLength = 10
      TabOrder = 0
      Visible = False
    end
    object edtName: TEdit
      Left = 16
      Top = 222
      Width = 417
      Height = 23
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ImeName = 'edtValue2'
      MaxLength = 150
      ParentFont = False
      TabOrder = 1
      Visible = False
    end
    object edtEmail: TEdit
      Left = 16
      Top = 272
      Width = 417
      Height = 23
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ImeName = 'edtValue2'
      MaxLength = 150
      ParentFont = False
      TabOrder = 2
      Visible = False
    end
    object mmJson: TMemo
      Left = 16
      Top = 44
      Width = 593
      Height = 103
      TabOrder = 3
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 628
    Height = 56
    ButtonHeight = 62
    ButtonWidth = 67
    Caption = 'ToolBar1'
    Color = 6765239
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 6765239
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Images = DataModule1.VirtualImageList1
    ParentColor = False
    ParentFont = False
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
      Left = 67
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
    object btnAdd: TToolButton
      Left = 134
      Top = 0
      Hint = 'Add Product'
      Caption = 'btnAdd'
      ImageIndex = 19
      ImageName = 'plus 72'
      ParentShowHint = False
      ShowHint = True
      OnClick = btnAddClick
    end
    object btnConfirm: TToolButton
      Left = 201
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
end

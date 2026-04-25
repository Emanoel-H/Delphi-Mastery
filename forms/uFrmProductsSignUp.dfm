object frmProductsSignUp: TfrmProductsSignUp
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Products'
  ClientHeight = 442
  ClientWidth = 540
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 540
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
    TabOrder = 0
    ExplicitWidth = 536
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
    object btnDelete: TToolButton
      Left = 134
      Top = 0
      Hint = 'Delete Product'
      Caption = 'btnDelete'
      ImageIndex = 10
      ImageName = 'recycle'
      ParentShowHint = False
      ShowHint = True
      OnClick = btnDeleteClick
    end
    object btnUpdate: TToolButton
      Left = 201
      Top = 0
      Hint = 'Edit Product'
      Caption = 'btnUpdate'
      ImageIndex = 22
      ImageName = 'asterisk 72'
      ParentShowHint = False
      ShowHint = True
      OnClick = btnUpdateClick
    end
    object btnAdd: TToolButton
      Left = 268
      Top = 0
      Hint = 'Add Product'
      Caption = 'btnAdd'
      ImageIndex = 19
      ImageName = 'plus 72'
      ParentShowHint = False
      ShowHint = True
      OnClick = btnAddClick
    end
    object btnSearch: TToolButton
      Left = 335
      Top = 0
      Hint = 'Search Products'
      Caption = 'btnSearch'
      ImageIndex = 24
      ImageName = 'search 72'
      ParentShowHint = False
      ShowHint = True
      OnClick = btnSearchClick
    end
    object btnConfirm: TToolButton
      Left = 402
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
    object btnCategories: TToolButton
      Left = 469
      Top = 0
      Hint = 'Categories'
      Caption = 'btnCategories'
      ImageIndex = 15
      ImageName = 'app'
      ParentShowHint = False
      ShowHint = True
      OnClick = btnCategoriesClick
    end
  end
  object pnMain: TPanel
    Left = 0
    Top = 56
    Width = 540
    Height = 386
    Align = alClient
    Color = clBlack
    Enabled = False
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 536
    ExplicitHeight = 385
    object lblCode: TLabel
      Left = 16
      Top = 25
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
    end
    object lblName: TLabel
      Left = 16
      Top = 75
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
    end
    object lblPrice: TLabel
      Left = 16
      Top = 129
      Width = 34
      Height = 17
      Caption = 'Price:'
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
    object Label1: TLabel
      Left = 288
      Top = 130
      Width = 60
      Height = 17
      Caption = 'Category:'
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
      Top = 48
      Width = 60
      Height = 23
      ImeName = 'edtValue1'
      MaxLength = 10
      TabOrder = 0
      OnKeyPress = edtCodeKeyPress
    end
    object edtName: TEdit
      Left = 16
      Top = 94
      Width = 417
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ImeName = 'edtValue2'
      MaxLength = 150
      ParentFont = False
      TabOrder = 1
    end
    object dblCategory: TDBLookupComboBox
      Left = 288
      Top = 153
      Width = 145
      Height = 23
      DropDownRows = 10
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      KeyField = 'id'
      ListField = 'name'
      ParentFont = False
      TabOrder = 2
      OnKeyDown = dblCategoryKeyDown
    end
    object nbPrice: TNumberBox
      Left = 16
      Top = 153
      Width = 145
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Mode = nbmCurrency
      MaxLength = 10
      ParentFont = False
      TabOrder = 3
      NegativeValueColor = clWindow
    end
  end
end

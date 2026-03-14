object frmProductsSearching: TfrmProductsSearching
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Products'
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
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 628
    Height = 56
    ButtonHeight = 62
    ButtonWidth = 75
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
    ExplicitWidth = 622
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
    object btnSearch: TToolButton
      Left = 75
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
      Left = 150
      Top = 0
      Hint = 'Confirm'
      Caption = 'btnConfirm'
      ImageIndex = 11
      ImageName = 'checkmark 72'
      ParentShowHint = False
      ShowHint = True
      OnClick = btnConfirmClick
    end
  end
  object pnMenu: TPanel
    Left = 0
    Top = 56
    Width = 628
    Height = 73
    Align = alTop
    Color = clBlack
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 622
    object lblCode: TLabel
      Left = 6
      Top = 2
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
      Left = 88
      Top = 2
      Width = 52
      Height = 17
      Caption = 'Product:'
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
      Left = 454
      Top = 2
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
      Left = 6
      Top = 25
      Width = 60
      Height = 23
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Font.Quality = fqClearType
      ImeName = 'edtValue1'
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      OnKeyPress = edtCodeKeyPress
    end
    object edtName: TEdit
      Left = 88
      Top = 25
      Width = 353
      Height = 23
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Font.Quality = fqClearType
      ImeName = 'edtValue2'
      MaxLength = 150
      ParentFont = False
      TabOrder = 1
    end
    object dblCategory: TDBLookupComboBox
      Left = 454
      Top = 25
      Width = 145
      Height = 23
      Color = clWhite
      DropDownRows = 10
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Font.Quality = fqClearType
      KeyField = 'id'
      ListField = 'name'
      ParentFont = False
      TabOrder = 2
    end
  end
  object dbgProducts: TDBGrid
    Left = 0
    Top = 129
    Width = 628
    Height = 263
    Align = alClient
    Color = clBlack
    DataSource = dsProducts
    FixedColor = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Font.Quality = fqClearType
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDrawColumnCell = dbgProductsDrawColumnCell
    OnDblClick = dbgProductsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'code'
        Title.Caption = 'Code'
        Title.Color = clWhite
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Title.Font.Quality = fqClearType
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'id'
        Title.Color = clWhite
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'category_id'
        Title.Color = clWhite
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'name'
        Title.Caption = 'Product'
        Title.Color = clWhite
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Title.Font.Quality = fqClearType
        Width = 375
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'price'
        Title.Caption = 'Price'
        Title.Color = clWhite
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Title.Font.Quality = fqClearType
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'category'
        Title.Caption = 'Category'
        Title.Color = clWhite
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Title.Font.Quality = fqClearType
        Width = 95
        Visible = True
      end>
  end
  object pnFooter: TPanel
    Left = 0
    Top = 392
    Width = 628
    Height = 50
    Align = alBottom
    Color = clBlack
    ParentBackground = False
    TabOrder = 3
    ExplicitTop = 383
    ExplicitWidth = 622
    object pnRecords: TPanel
      Left = 1
      Top = 1
      Width = 63
      Height = 48
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object lblRecords: TLabel
        Left = 9
        Top = 5
        Width = 48
        Height = 17
        Alignment = taCenter
        Caption = 'Records'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        Font.Quality = fqClearType
        ParentFont = False
      end
      object lblRecordCount: TLabel
        Left = 30
        Top = 22
        Width = 7
        Height = 17
        Alignment = taCenter
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        Font.Quality = fqClearType
        ParentFont = False
      end
    end
  end
  object fdqProducts: TFDQuery
    Connection = DataModule1.FDConnection
    SQL.Strings = (
      'select                                 '
      'products.id,                           '
      'products.code,                         '
      'products.name,                         '
      'products.price,                        '
      'categories.name as category,                       '
      'products.category_id                   '
      'from products                          '
      'left join categories                   '
      'on products.category_id = categories.id')
    Left = 296
    Top = 8
    object fdqProductsid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdqProductscode: TWideStringField
      FieldName = 'code'
      Origin = 'code'
      Size = 10
    end
    object fdqProductsname: TWideStringField
      FieldName = 'name'
      Origin = 'name'
      Size = 200
    end
    object fdqProductsprice: TFloatField
      FieldName = 'price'
      Origin = 'price'
    end
    object fdqProductscategory: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'category'
      Origin = 'category'
      Size = 200
    end
    object fdqProductscategory_id: TIntegerField
      FieldName = 'category_id'
      Origin = 'category_id'
    end
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = fdqProducts
    ScopeMappings = <>
    Left = 472
    Top = 5
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 444
    Top = 5
    object LinkControlToField1: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'name'
      Control = edtName
      Track = True
    end
    object LinkControlToField2: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'code'
      Control = edtCode
      Track = True
    end
  end
  object dsProducts: TDataSource
    DataSet = fdqProducts
    Left = 328
    Top = 8
  end
end

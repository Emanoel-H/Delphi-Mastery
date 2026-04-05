object frmCategoriesSearching: TfrmCategoriesSearching
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Categories'
  ClientHeight = 433
  ClientWidth = 444
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
  object dbgCategories: TDBGrid
    Left = 0
    Top = 129
    Width = 444
    Height = 254
    Align = alClient
    Color = clBlack
    DataSource = dsCategories
    FixedColor = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Font.Quality = fqClearType
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDrawColumnCell = dbgCategoriesDrawColumnCell
    OnDblClick = dbgCategoriesDblClick
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
        FieldName = 'name'
        Title.Caption = 'Category'
        Title.Color = clWhite
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Title.Font.Quality = fqClearType
        Width = 375
        Visible = True
      end>
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 444
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
    TabOrder = 1
    ExplicitWidth = 450
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
    Width = 444
    Height = 73
    Align = alTop
    Color = clBlack
    ParentBackground = False
    TabOrder = 2
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
  end
  object pnFooter: TPanel
    Left = 0
    Top = 383
    Width = 444
    Height = 50
    Align = alBottom
    Color = clBlack
    ParentBackground = False
    TabOrder = 3
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
  object fdqCategories: TFDQuery
    Connection = DataModule1.FDConnection
    Left = 240
  end
  object dsCategories: TDataSource
    DataSet = fdqCategories
    Left = 320
  end
end

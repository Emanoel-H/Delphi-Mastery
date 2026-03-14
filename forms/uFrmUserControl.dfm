object FrmUserControl: TFrmUserControl
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'User Control'
  ClientHeight = 433
  ClientWidth = 470
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
    Top = 0
    Width = 470
    Height = 433
    Align = alClient
    Color = 15850149
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 616
    ExplicitHeight = 424
    object lblName: TLabel
      Left = 16
      Top = 81
      Width = 40
      Height = 17
      Caption = 'Name:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ToolBar1: TToolBar
      Left = 1
      Top = 1
      Width = 468
      Height = 56
      ButtonHeight = 56
      ButtonWidth = 65
      Caption = 'tbOptions'
      Images = DataModule1.VirtualImageList1
      TabOrder = 0
      ExplicitWidth = 614
      object btnBack: TToolButton
        Left = 0
        Top = 0
        Hint = 'Back'
        Caption = 'btnBack'
        ImageIndex = 6
        ImageName = 'back'
        ParentShowHint = False
        ShowHint = True
      end
      object btnCancel: TToolButton
        Left = 65
        Top = 0
        Hint = 'Cancel'
        Caption = 'btnCancel'
        ImageIndex = 4
        ImageName = 'cancel'
        ParentShowHint = False
        ShowHint = True
      end
      object btnSubtract: TToolButton
        Left = 130
        Top = 0
        Hint = 'Search Users'
        Caption = 'btnSearch'
        ImageIndex = 7
        ImageName = 'search'
        ParentShowHint = False
        ShowHint = True
      end
      object btnUpdate: TToolButton
        Left = 195
        Top = 0
        Hint = 'Alter User'
        Caption = 'btnUpdate'
        ImageIndex = 8
        ImageName = 'update button'
        ParentShowHint = False
        ShowHint = True
      end
      object btnMultiply: TToolButton
        Left = 260
        Top = 0
        Hint = 'Delete User'
        Caption = 'btnDelete'
        ImageIndex = 9
        ImageName = 'delete button'
        ParentShowHint = False
        ShowHint = True
      end
      object btnAdd: TToolButton
        Left = 325
        Top = 0
        Hint = 'Add User'
        Caption = 'btnAdd'
        ImageIndex = 5
        ImageName = 'plus'
        ParentShowHint = False
        ShowHint = True
      end
      object btnConfirm: TToolButton
        Left = 390
        Top = 0
        Hint = 'Confirm'
        Caption = 'btnConfirm'
        ImageIndex = 2
        ImageName = 'confirm'
        ParentShowHint = False
        ShowHint = True
      end
    end
    object edtName: TEdit
      Left = 16
      Top = 104
      Width = 310
      Height = 23
      ImeName = 'edtValue1'
      MaxLength = 40
      TabOrder = 1
    end
  end
end

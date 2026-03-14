object frmHelloWorld: TfrmHelloWorld
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Hello, World!'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object pnPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 442
    Align = alClient
    Color = 15850149
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 622
    ExplicitHeight = 433
    object lblNome: TLabel
      Left = 16
      Top = 15
      Width = 140
      Height = 17
      Caption = 'Insert your name here:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblAge: TLabel
      Left = 16
      Top = 65
      Width = 128
      Height = 17
      Caption = 'Insert your age here:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtNome: TEdit
      Left = 16
      Top = 38
      Width = 217
      Height = 23
      ImeName = 'edtNome'
      MaxLength = 40
      TabOrder = 0
      OnKeyPress = edtNomeKeyPress
    end
    object btnGreet: TButton
      Left = 158
      Top = 120
      Width = 75
      Height = 25
      Caption = 'submit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnGreetClick
    end
    object edtAge: TEdit
      Left = 16
      Top = 84
      Width = 60
      Height = 23
      ImeName = 'edtAge'
      MaxLength = 2
      TabOrder = 1
      OnKeyPress = edtAgeKeyPress
    end
  end
end

object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 501
  ClientWidth = 889
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 11
    Width = 17
    Height = 15
    Caption = 'ID.:'
  end
  object Label2: TLabel
    Left = 115
    Top = 11
    Width = 71
    Height = 15
    Caption = 'Raz'#227'o Social.:'
  end
  object Label3: TLabel
    Left = 480
    Top = 11
    Width = 35
    Height = 15
    Caption = 'Email.:'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 221
    Width = 873
    Height = 173
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CLIENTE_ID'
        Title.Caption = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RAZAO_SOCIAL'
        Title.Caption = 'RAZ'#195'O SOCIAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMAIL'
        Visible = True
      end>
  end
  object DBEdit1: TDBEdit
    Left = 31
    Top = 8
    Width = 57
    Height = 23
    DataField = 'CLIENTE_ID'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 192
    Top = 8
    Width = 273
    Height = 23
    DataField = 'RAZAO_SOCIAL'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 521
    Top = 8
    Width = 233
    Height = 23
    DataField = 'EMAIL'
    DataSource = DataSource1
    TabOrder = 3
  end
  object Panel1: TPanel
    Left = 0
    Top = 436
    Width = 889
    Height = 65
    Align = alBottom
    Color = clHighlight
    ParentBackground = False
    TabOrder = 4
    object Button4: TButton
      AlignWithMargins = True
      Left = 246
      Top = 6
      Width = 75
      Height = 53
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 5
      Align = alLeft
      Caption = 'Cancelar'
      TabOrder = 0
      OnClick = Button4Click
    end
    object Button5: TButton
      AlignWithMargins = True
      Left = 6
      Top = 6
      Width = 75
      Height = 53
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 5
      Align = alLeft
      Caption = 'Novo'
      TabOrder = 1
      OnClick = Button5Click
    end
    object Button6: TButton
      AlignWithMargins = True
      Left = 86
      Top = 6
      Width = 75
      Height = 53
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 5
      Align = alLeft
      Caption = 'Gravar'
      TabOrder = 2
      OnClick = Button6Click
    end
    object Excluir: TButton
      AlignWithMargins = True
      Left = 166
      Top = 6
      Width = 75
      Height = 53
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 5
      Align = alLeft
      Caption = 'Excluir'
      TabOrder = 3
      OnClick = ExcluirClick
    end
    object Button1: TButton
      Left = 792
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Relat'#243'rio'
      TabOrder = 4
    end
  end
  object Button2: TButton
    Left = 806
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Refresh'
    TabOrder = 5
    OnClick = Button2Click
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 592
    Top = 32
    object FDMemTable1CLIENTE_ID: TIntegerField
      FieldName = 'CLIENTE_ID'
    end
    object FDMemTable1RAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 60
    end
    object FDMemTable1EMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 632
    Top = 128
  end
end

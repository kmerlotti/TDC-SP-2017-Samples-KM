object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'LocalSQL'
  ClientHeight = 437
  ClientWidth = 667
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 248
    Top = 388
    Width = 177
    Height = 41
    Caption = 'Clientes (FIREBIRD)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 8
    Width = 321
    Height = 177
    ColCount = 1
    FixedCols = 0
    RowCount = 2
    TabOrder = 1
    ColWidths = (
      64)
    RowHeights = (
      24
      24)
  end
  object StringGridBindSourceDB2: TStringGrid
    Left = 335
    Top = 8
    Width = 320
    Height = 177
    ColCount = 1
    FixedCols = 0
    RowCount = 2
    TabOrder = 2
    ColWidths = (
      64)
    RowHeights = (
      24
      24)
  end
  object StringGridBindSourceDB3: TStringGrid
    Left = 8
    Top = 199
    Width = 647
    Height = 178
    ColCount = 1
    FixedCols = 0
    RowCount = 2
    TabOrder = 3
    ColWidths = (
      64)
    RowHeights = (
      24
      24)
  end
  object Button2: TButton
    Left = 8
    Top = 388
    Width = 177
    Height = 41
    Caption = 'Vendas (MSSQL)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 478
    Top = 388
    Width = 177
    Height = 41
    Caption = 'Inner LocalSQL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = Button3Click
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 436
    Top = 229
    object LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource
      DataSource = BindSourceDB1
      GridControl = StringGrid1
      Columns = <>
    end
    object LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource
      DataSource = BindSourceDB2
      GridControl = StringGridBindSourceDB2
      Columns = <>
    end
    object LinkGridToDataSourceBindSourceDB3: TLinkGridToDataSource
      DataSource = BindSourceDB3
      GridControl = StringGridBindSourceDB3
      Columns = <>
    end
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = Dtm.SqlVendas
    ScopeMappings = <>
    Left = 528
    Top = 224
  end
  object BindSourceDB2: TBindSourceDB
    DataSet = Dtm.SqlClientes
    ScopeMappings = <>
    Left = 528
    Top = 272
  end
  object BindSourceDB3: TBindSourceDB
    DataSet = Dtm.FDQuery1
    ScopeMappings = <>
    Left = 528
    Top = 320
  end
end

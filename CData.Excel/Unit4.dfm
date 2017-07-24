object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 299
  ClientWidth = 645
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 16
    Top = 35
    Width = 611
    Height = 256
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Edit1: TEdit
    Left = 16
    Top = 8
    Width = 611
    Height = 21
    TabOrder = 1
    Text = 'select * from Produtos'
    OnKeyDown = Edit1KeyDown
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ExcelFile=C:\Users\Kelver\Desktop\tdc2017\Exemplos\db\dados.xlsx'
      'DriverID=CData.Excel')
    Left = 224
    Top = 144
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 312
    Top = 136
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 392
    Top = 144
  end
end

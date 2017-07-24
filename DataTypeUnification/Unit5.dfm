object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'Data Type Unification'
  ClientHeight = 280
  ClientWidth = 869
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
    Left = 16
    Top = 16
    Width = 75
    Height = 25
    Caption = 'FIREBIRD'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 104
    Top = 16
    Width = 75
    Height = 25
    Caption = 'SQL SERVER'
    TabOrder = 1
    OnClick = Button2Click
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 47
    Width = 505
    Height = 218
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Memo1: TMemo
    Left = 536
    Top = 47
    Width = 321
    Height = 218
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier'
    Font.Style = []
    Lines.Strings = (
      'Firebird'
      '--------------'
      'CREATE TABLE TESTETIPOS ('
      '    CAMPO01  TIMESTAMP,'
      '    CAMPO02  FLOAT,'
      '    CAMPO03  DOUBLE PRECISION'
      ');'
      ''
      ''
      'SQLServer'
      '--------------'
      'CREATE TABLE [dbo].[TesteTipos]('
      #9'[Campo01] [datetime] NULL,'
      #9'[Campo02] [float] NULL,'
      #9'[Campo03] [float] NULL'
      ')')
    ParentFont = False
    TabOrder = 3
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Kelver\Desktop\firedacfdd\Exemplos\Bancos\FDD.' +
        'FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=localhost'
      'DriverID=FB')
    LoginPrompt = False
    Left = 120
    Top = 88
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 448
    Top = 88
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 448
    Top = 144
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 448
    Top = 192
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 120
    Top = 200
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtSingle
        TargetDataType = dtDouble
      end>
    SQL.Strings = (
      'select * from TesteTipos')
    Left = 120
    Top = 144
    object FDQuery1CAMPO01: TSQLTimeStampField
      FieldName = 'CAMPO01'
      Origin = 'CAMPO01'
    end
    object FDQuery1CAMPO02: TFloatField
      FieldName = 'CAMPO02'
      Origin = 'CAMPO02'
    end
    object FDQuery1CAMPO03: TFloatField
      FieldName = 'CAMPO03'
      Origin = 'CAMPO03'
    end
  end
end

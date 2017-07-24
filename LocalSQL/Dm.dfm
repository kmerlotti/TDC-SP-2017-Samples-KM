object Dtm: TDtm
  OldCreateOrder = False
  Height = 306
  Width = 429
  object FDConnFIREBIRD: TFDConnection
    Params.Strings = (
      'Database=C:\Users\Kelver\Desktop\tdc2017\Exemplos\db\TDC.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=localhost'
      'DriverID=FB')
    LoginPrompt = False
    Left = 56
    Top = 16
  end
  object FDConnMSSQL: TFDConnection
    Params.Strings = (
      'Database=FireDAC'
      'User_Name=sa'
      'Password=sa123'
      'Server=W7VM-BD\SQLEXPRESS'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 160
    Top = 16
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'OpenMode=ReadWrite'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 56
    Top = 160
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'Select '
      '  * '
      'from '
      '  Local.TabVendas'
      'inner join Local.TabClientes On'
      '  Local.TabVendas.IdCliente = Local.TabClientes.Id')
    Left = 144
    Top = 160
  end
  object FDLocalSQL1: TFDLocalSQL
    SchemaName = 'Local'
    Connection = FDConnection1
    Active = True
    DataSets = <
      item
        DataSet = SqlClientes
        Name = 'TabClientes'
      end
      item
        DataSet = SqlVendas
        Name = 'TabVendas'
      end>
    Left = 56
    Top = 208
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 312
    Top = 200
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 312
    Top = 144
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 312
    Top = 80
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 312
    Top = 24
  end
  object SqlClientes: TFDQuery
    Connection = FDConnFIREBIRD
    FetchOptions.AssignedValues = [evMode]
    SQL.Strings = (
      'select * from Clientes')
    Left = 56
    Top = 72
  end
  object SqlVendas: TFDQuery
    Connection = FDConnMSSQL
    SQL.Strings = (
      'select * from vendas')
    Left = 160
    Top = 72
  end
end

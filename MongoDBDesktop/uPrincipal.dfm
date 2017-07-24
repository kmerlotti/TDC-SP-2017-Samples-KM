object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 673
  ClientWidth = 1133
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lBorough: TLabel
    Left = 8
    Top = 5
    Width = 40
    Height = 13
    Caption = 'Borough'
  end
  object lCouisine: TLabel
    Left = 135
    Top = 5
    Width = 39
    Height = 13
    Caption = 'Cuisines'
  end
  object Label3: TLabel
    Left = 8
    Top = 263
    Width = 46
    Height = 13
    Caption = 'Address: '
  end
  object bFiltrar: TSpeedButton
    Left = 362
    Top = 120
    Width = 23
    Height = 22
    Caption = '->'
    OnClick = bFiltrarClick
  end
  object lRestaurants: TLabel
    Left = 391
    Top = 5
    Width = 59
    Height = 13
    Caption = 'Restaurants'
  end
  object lAddress: TLabel
    Left = 55
    Top = 263
    Width = 103
    Height = 13
    Caption = 'select a restaurant...'
  end
  object Label1: TLabel
    Left = 872
    Top = 261
    Width = 37
    Height = 13
    Caption = 'Coord.:'
  end
  object lCoord: TLabel
    Left = 913
    Top = 261
    Width = 39
    Height = 13
    Cursor = crHandPoint
    Hint = 'Click to see in the map'
    Caption = '0.0, 0.0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = lCoordClick
  end
  object clbBorough: TCheckListBox
    Left = 8
    Top = 24
    Width = 121
    Height = 225
    OnClickCheck = clbBoroughClickCheck
    ItemHeight = 13
    TabOrder = 0
  end
  object clbCuisines: TCheckListBox
    Left = 135
    Top = 24
    Width = 218
    Height = 225
    OnClickCheck = clbCuisinesClickCheck
    ItemHeight = 13
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 391
    Top = 24
    Width = 522
    Height = 225
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'name'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'borough'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cuisine'
        Width = 200
        Visible = True
      end>
  end
  object WebBrowser1: TWebBrowser
    Left = 8
    Top = 280
    Width = 1117
    Height = 385
    TabOrder = 3
    ControlData = {
      4C00000072730000CA2700000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object DBGrid2: TDBGrid
    Left = 919
    Top = 24
    Width = 206
    Height = 225
    DataSource = DataSource2
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object cOrder: TCheckBox
    Left = 366
    Top = 95
    Width = 17
    Height = 17
    Hint = 'Order by name, borough and cuisine.'
    Checked = True
    ParentShowHint = False
    ShowHint = True
    State = cbChecked
    TabOrder = 5
    OnClick = cOrderClick
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Server=W7VM-BD'
      'Database=test'
      'DriverID=Mongo')
    LoginPrompt = False
    Left = 528
    Top = 88
  end
  object FDPhysMongoDriverLink1: TFDPhysMongoDriverLink
    Left = 976
    Top = 176
  end
  object qryRestaurants: TFDMongoQuery
    AfterOpen = qryRestaurantsAfterOpen
    AfterScroll = qryRestaurantsAfterScroll
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    FormatOptions.StrsTrim2Len = True
    Connection = FDConnection1
    DatabaseName = 'test'
    CollectionName = 'restaurants'
    Left = 616
    Top = 88
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = qryRestaurants
    Left = 696
    Top = 88
  end
  object DataSource2: TDataSource
    AutoEdit = False
    Left = 952
    Top = 120
  end
end

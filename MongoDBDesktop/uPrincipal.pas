unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MongoDB,
  FireDAC.Phys.MongoDBDef, System.Rtti, System.JSON.Types, System.JSON.Readers,
  System.JSON.BSON, System.JSON.Builders, FireDAC.Phys.MongoDBWrapper,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Phys.MongoDBDataSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.CheckLst, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.OleCtrls, SHDocVw,
  Vcl.Buttons;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    FDPhysMongoDriverLink1: TFDPhysMongoDriverLink;
    clbBorough: TCheckListBox;
    lBorough: TLabel;
    clbCuisines: TCheckListBox;
    lCouisine: TLabel;
    DBGrid1: TDBGrid;
    WebBrowser1: TWebBrowser;
    Label3: TLabel;
    qryRestaurants: TFDMongoQuery;
    DataSource1: TDataSource;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    bFiltrar: TSpeedButton;
    lRestaurants: TLabel;
    lAddress: TLabel;
    Label1: TLabel;
    lCoord: TLabel;
    cOrder: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure qryRestaurantsAfterOpen(DataSet: TDataSet);
    procedure bFiltrarClick(Sender: TObject);
    procedure qryRestaurantsAfterScroll(DataSet: TDataSet);
    procedure lCoordClick(Sender: TObject);
    procedure clbBoroughClickCheck(Sender: TObject);
    procedure clbCuisinesClickCheck(Sender: TObject);
    procedure cOrderClick(Sender: TObject);
  private
    FEnv: TMongoEnv;
    FCon: TMongoConnection;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure DumpDistinctToStrings(aCur: IMongoCursor; aStrings: TStrings);
var
  _Iter: TJSONIterator;
begin
  aStrings.Clear;

  while aCur.Next do
  begin
    _Iter := aCur.Doc.Iterator;
    if _Iter.Find('values') then
    begin
      if _Iter.Recurse then
      begin
        while _Iter.Next do
          aStrings.Add(_Iter.AsString);
        _Iter.Return;
      end;
    end;
  end;
end;

procedure TForm1.clbBoroughClickCheck(Sender: TObject);
begin
  bFiltrarClick(Sender);
end;

procedure TForm1.clbCuisinesClickCheck(Sender: TObject);
begin
  bFiltrarClick(Sender);
end;

procedure TForm1.cOrderClick(Sender: TObject);
begin
  bFiltrarClick(Sender);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  _Cur: IMongoCursor;

  _i: Integer;
  _str: String;
begin
  FDConnection1.Open;
  FCon := TMongoConnection( FDConnection1.CliObj );
  FEnv := FCon.Env;

  _Cur := nil;
  _Cur := FCon.Command('test', '{ distinct: "restaurants", key: "borough" }');
  DumpDistinctToStrings(_Cur, clbBorough.Items);
  lBorough.Caption := 'Borough (' + clbBorough.Count.ToString + ')';

  _Cur := nil;
  _Cur := FCon.Command('test', '{ distinct: "restaurants", key: "cuisine" }');
  DumpDistinctToStrings(_Cur, clbCuisines.Items);
  lCouisine.Caption := 'Cusine (' + clbCuisines.Count.ToString + ')';
end;

procedure TForm1.lCoordClick(Sender: TObject);
const
  // Using Google Maps
  // http://maps.google.ComObject;maps:z=12&t=m&q=loc«38.9419+-78.3020
  //   z is the zoom level (1-20)
  //   t is the map type (m=map, k=satellite, h=hybrid, p=terrain, e=GoogleEarth)
  //   q is the search query, if it is prefixed by "loc:", then google assumes
  //     it is a lat/lon separated by a "+"
  //MAP_URL = 'http://maps.google.com/maps?z=%s&t=%s&q=loc:%s&output=classic';

  //Using Here Maps
  // https://maps.here.com/?map=LAT,LON,ZOOM,TYPE&x=ep
  // LAT/LON = decimal format
  // ZOOM = 1 - 20
  // TYPE = normal, satellite, terrain, trafic, public_transport
  // sample: https://maps.here.com/?map=40.71455,-74.00714,12,normal&x=ep

  MAP_URL = 'http://maps.here.com/?map=%s,%s,%s&x=ep';
  ZOOM    = '12';
  &TYPE   = 'normal';
//var
  //_loca, _zoom, _type: string;
begin
  //_loca := StringReplace(lCoord.Caption, ',', '+', []);
  //WebBrowser1.Navigate(Format(MAP_URL, [ZOOM, &TYPE, _loca]));

  WebBrowser1.Navigate(Format(MAP_URL, [lCoord.Caption, ZOOM, &TYPE]));
end;

procedure TForm1.qryRestaurantsAfterOpen(DataSet: TDataSet);
begin
  DataSource2.DataSet := (qryRestaurants.FieldByName('grades') as TDataSetField).NestedDataSet;
  lRestaurants.Caption := 'Restaurants (' + qryRestaurants.RecordCount.ToString + ')';
end;

procedure TForm1.qryRestaurantsAfterScroll(DataSet: TDataSet);
var
  _TempDS: TDataSet;
begin
  if not DataSet.Active then
  begin
    lAddress.Caption := 'select a restaurant...';
    exit;
  end;

  lAddress.Caption := EmptyStr;

//  _TempDS := (qryRestaurants.FieldByName('address') as TDataSetField).NestedDataSet;
//  if (not _TempDS.Active) or _TempDS.IsEmpty then
//    exit;

  lAddress.Caption := qryRestaurants.FieldByName('address.street').AsString + ', ' +
                      qryRestaurants.FieldByName('address.building').AsString + ', ' +
                      qryRestaurants.FieldByName('borough').AsString + ' - ' +
                      qryRestaurants.FieldByName('address.zipcode').AsString;

  _TempDS := (qryRestaurants.FieldByName('address.coord') as TDataSetField).NestedDataSet;
  if (not _TempDS.Active) or _TempDS.IsEmpty then
    lCoord.Caption := '0.0,0.0'
  else
  begin
    _TempDS.First;
    lCoord.Caption := StringReplace(_TempDS.Fields[0].AsString, ',', '.', []) + ',';
    _TempDS.Next;
    lCoord.Caption := lCoord.Caption +  StringReplace(_TempDS.Fields[0].AsString, ',', '.', []);
  end;
end;

procedure TForm1.bFiltrarClick(Sender: TObject);

  function GetCheckedItems(aClb: TCheckListBox): String;
  var
    i: Integer;
  begin
    result := EmptyStr;
    for i := 0 to aClb.Items.Count-1 do
      if aClb.Checked[i] then
        result := result + '"' + aClb.Items[i] + '",';
    Delete(result,  Length(result), 1);
  end;

var
  _borough, _cusine: String;
  _match: TStringList;
begin
  _match := TStringList.Create(#0, ',');
  try
   //$in operator sample:   { tags: { $in: ["appliances", "school"] } }
    _borough := GetCheckedItems(clbBorough);
    if _borough <> EmptyStr then
      _match.Add('borough:{$in:[' + _borough + ']}');

    _cusine := GetCheckedItems(clbCuisines);
    if _cusine <> EmptyStr then
      _match.Add('cuisine:{$in:[' + _cusine + ']}');

    qryRestaurants.Close;
    qryRestaurants.QMatch := '{' + _match.DelimitedText + '}';
    if cOrder.Checked then
      qryRestaurants.QSort := '{name:1, borough:1, cuisine:1}'
    else
      qryRestaurants.QSort := '';
    qryRestaurants.Open;
  finally
    _match.Free;
  end;
end;

end.

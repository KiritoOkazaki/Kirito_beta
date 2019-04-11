import 'dart:async';
import 'package:beta_balmer/model/actividad.dart';
import 'package:beta_balmer/pages/createActivity/page7.dart';
import 'package:beta_balmer/utils/uidata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Page6Act extends StatefulWidget {
  final Actividad actividad;

  const Page6Act({Key key, this.actividad}) : super(key: key);
  @override
  _Page6ActState createState() => _Page6ActState();
}

class _Page6ActState extends State<Page6Act> {
  int _radioValue = 0;
  bool _tipoEspacio=false;
  List _cities = ["Guadalajara", "Morelia", "Ciudad de Mexico", "Monterrey"];
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentCity;
  TextEditingController _directController = new TextEditingController();
  TextEditingController _directController2 = new TextEditingController();
  LocationData _currentLocation;
  LocationData _startLocation;
  Location _location = new Location();
  Actividad _actividad;
  GoogleMapController mapController;
  MapType _currentMapType =MapType.normal;
  double latitude;
  double longitude;
  int idLocalidad;
  final LatLng _center =const LatLng(19.7046682, -101.1153807);


  void _onMapCreated(GoogleMapController controller){
    mapController =controller;
  }

  

_getLocation() async {
    LocationData location;
    try {
      location = await _location.getLocation();
    } on PlatformException {
    }

    setState(() {
      _startLocation =location;
      latitude =_startLocation.latitude;
      longitude =_startLocation.longitude;
    });
    print("start location latitude: ${_startLocation.latitude} \n longitude: ${_startLocation.longitude}");

  }
  
  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentCity = _dropDownMenuItems[0].value;
    _actividad = widget.actividad;
    _getLocation();
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String activity in _cities) {
      items.add(new DropdownMenuItem(
          value: activity,
          child: new Text(
            activity,
            style: TextStyle(
                fontSize: 14, color: Colors.black, fontStyle: FontStyle.normal),
          )));
    }
    return items;
  }

  Widget radioButton() => Container(
        margin: EdgeInsets.all(10.0),
        alignment: Alignment.topLeft,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Text(
              "Tipo de Espacio",
              style: new TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Radio(
                  activeColor: Colors.green,
                  value: 0,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChange,
                ),
                new Text("Publico"),
                new Expanded(
                  flex: 2,
                  child: new Text(""),
                ),
                new Radio(
                  activeColor: Colors.green,
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChange,
                ),
                new Text("Privado")
              ],
            ),
          ],
        ),
      );

  Widget continueButton() => Container(
        decoration: new BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color(0xFF00827D), Colors.yellow],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: new FlatButton(
            child: new Text(
              'Continuar',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              _actividad.setEspacio =_tipoEspacio;
              _actividad.setDireccion = _currentCity+ " "+_directController.text+" "+_directController2.text;
              _actividad.setLatitude=latitude;
              _actividad.setLongitude=longitude;
          Navigator.of(context).push(MaterialPageRoute(
       builder: (context) => Page7Act(actividad: _actividad,)));
            }),
      );

  Widget bodyData(BuildContext context) => Container(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              radioButton(),
              SizedBox(height: 16.0),
              direccion(),
              SizedBox(height: 16.0,),
              googleMap(),
              SizedBox(height: 16.0,),
              continueButton()
            ],
          ),
        ),
      );
  Widget direccion() => Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.0, color: Colors.grey),
          ),
        ),
        child: Column(
          children: <Widget>[
            new Text("Ciudad", style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
          SizedBox(height: 16.0,),
            new DropdownButton(
              hint: new Text("Selecciona una ciudad", textAlign: TextAlign.start,),
              value: _currentCity,
              items: _dropDownMenuItems,
              onChanged: changedDropDownItem,
            ), 
            SizedBox(height: 16.0,),
            new Text("Colonia", style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
            SizedBox(height: 16.0,),
            new TextField(
              controller: _directController,
              decoration: const InputDecoration(
              labelText: 'Introduce el nombre de la colonia',),
              keyboardType: TextInputType.text,
              
            ),
            SizedBox(height: 16.0,),
            new Text("Calle Y Numero", style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
            SizedBox(height: 16.0,),
            new TextField(
              controller: _directController2,
              decoration: const InputDecoration(
              labelText: 'Introduce la calle y el numero',),
              keyboardType: TextInputType.text,
              
            ),
          ],
        ),
      );

      Widget googleMap()=> SizedBox(
        width: 300,
        height: 200,
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          options: GoogleMapOptions(
            cameraPosition: CameraPosition(target: _center, zoom: 17),
          ),
        
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Ubicacion de la actividad",
            style: TextStyle(
              color: Colors.green,
            )),
        backgroundColor: Colors.white70,
      ),
      body: bodyData(context),
    );
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          print("Publico");
          _tipoEspacio=false;
          break;
        case 1:
          print("Privado");
          _tipoEspacio=true;
          break;

        default:
      }
    });
  }
  void changedDropDownItem(String selectedAct) {
    setState(() {
      _currentCity=selectedAct;
     switch (selectedAct) {
          case "Guadalajara":
          idLocalidad=575;
          latitude=20.6763889;
          longitude=-103.3422222;
          break;
          case "Morelia":
          idLocalidad=839;
          latitude=19.7033839;
          longitude=-101.1920464;
          break;
          case "Ciudad de Mexico":
          idLocalidad=285;
          latitude=19.4072689;
          longitude=-99.1907544;
          break;
          case "Monterrey":
          idLocalidad=991;
          latitude= 25.6646972;
          longitude=-100.3108917;
          break;
        default:
      }
    });
  }
}

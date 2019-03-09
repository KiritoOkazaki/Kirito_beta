import 'package:beta_balmer/utils/uidata.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class Page6Act extends StatefulWidget {
  @override
  _Page6ActState createState() => _Page6ActState();
}

class _Page6ActState extends State<Page6Act> {
  int _radioValue = 0;
  List _cities = ["Guadalajara", "Morelia", "Ciudad de Mexico", "Monterrey"];
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentCity;
  TextEditingController _directController = new TextEditingController();
  TextEditingController _directController2 = new TextEditingController();

  
  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentCity = _dropDownMenuItems[0].value;
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
          Navigator.pushNamed(context, UIData.activityRoute7);
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

      Widget googleMap()=>Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.0, color: Colors.grey),
          ),
        ),
        child: new Text("aqui va el mapa"),

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

          break;
        case 1:
          print("Privado");
          break;

        default:
      }
    });
  }
  void changedDropDownItem(String selectedAct) {
    setState(() {
      _currentCity = selectedAct;
    });
  }
}

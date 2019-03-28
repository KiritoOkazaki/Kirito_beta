import 'package:beta_balmer/pages/createAccount/crearCuenta3.dart';
import 'package:beta_balmer/services/postService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrearCuenta2 extends StatefulWidget {
  final String correo;
  final String password;

  const CrearCuenta2({Key key, this.correo, this.password}): super(key:key);

  @override
  _CrearCuenta2State createState() => _CrearCuenta2State();
}

class _CrearCuenta2State extends State<CrearCuenta2> {
 
  FixedExtentScrollController fixedExtentScrollController =
      new FixedExtentScrollController();

  
  List _act = ["Guadalajara", "Morelia", "Monterrey", "Ciudad de Mexico"];
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentAct;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentAct = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String activity in _act) {
      items.add(new DropdownMenuItem(
          value: activity,
          child: new Text(
            activity,
            style: TextStyle(
                fontSize: 20, color: Colors.white),
          )));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF00827D),
                  const Color(0xFF46A040),
                  const Color(0xFF2E7DE1),
                  const Color(0xFF94348C)
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 40.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  BackButton(
                    color: Colors.white,
                  )
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Selecciona tu Ciudad ",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              new Container(
                padding: new EdgeInsets.all(16.0),
              ),
              new Theme(
                data:
                    Theme.of(context).copyWith(canvasColor: Colors.transparent),
                child: new DropdownButton(
                  value: _currentAct,
                  items: _dropDownMenuItems,
                  onChanged: changedDropDownItem,
                ),
              ),
              new Container(
                padding: new EdgeInsets.all(16.0),
              ),
              new CupertinoButton(
                child: new Text(
                  "Siguiente",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
                minSize: 20.0,
                onPressed: (){
                   print("Seleccionaste $_currentAct");
                   postCreateUser(widget.correo, widget.password,_currentAct);
                   ///AQUI MANDAS A LLAMAR AL SERVICIO
                   Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => CrearCuenta3(),
                                    ));
                  //Navigator.pushNamed(context, UIData.activityRoute2);
                },
              ),

              
            ],
          ),
        ],
      ),
    );
  }

  void changedDropDownItem(String selectedAct) {
    setState(() {
      _currentAct = selectedAct;
    });
  }

  void postCreateUser(email, password, ciudad) async {
    await requestCreateUser(context, email, password, ciudad).then((s) {
     
    });
  }
}
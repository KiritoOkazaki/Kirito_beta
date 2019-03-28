import 'package:beta_balmer/pages/createAccount/crearCuenta4.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tags/selectable_tags.dart';

class CrearCuenta3 extends StatefulWidget {
  @override
  _CrearCuenta3State createState() => _CrearCuenta3State();
}

class _CrearCuenta3State extends State<CrearCuenta3> {
  final List<String> _list = [
    "Deportes",
    "Artes y Cultura",
    "Experiencias y Espectaculos",
    "Pasatiempos",
    "Formacion y Practica"
  ];
  List<Tag> _selectableTags = [];
  List<int> _idSelected =[];

  @override
  void initState() {
    int cnt = 1;
    _list.forEach((item) {
      _selectableTags.add(Tag(
        id: cnt,
        title: item,
        active: false,
      ));
      cnt++;
    });
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
                "¿Cuales son tus intereses? ",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              new Container(
                padding: new EdgeInsets.all(16.0),
              ),
             SelectableTags(
                tags: _selectableTags,
                backgroundContainer: Colors.transparent,
                color: Colors.transparent,
                activeColor: Colors.green,
                textColor: Colors.white,
                textActiveColor: Colors.black,
                columns: 2, // default 4
                symmetry: true, // default false
                onPressed: (tag) {
                  print(tag);
                },
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
                onPressed: () {
                  interesesSeleccionados();
                  print("actividades seleccionadas $_idSelected");
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CrearCuenta4(),
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

  void interesesSeleccionados(){
    _selectableTags.forEach((item){
      print("el valor del item es ${item.active}");
      if(item.active){
        print(item.id);
        _idSelected.add(item.id);
      }

    });
  
  }

}

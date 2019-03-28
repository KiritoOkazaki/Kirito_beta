import 'package:beta_balmer/pages/viewActivity/Page4.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  double _animatedHeight = 0;
  int participantes = 0;
  double precio = 0.0;
  double precioPpersona = 1370.0;
  int _radioValue = 0;

  Widget cardInformation() => Container(
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Text(
                    "\nCurso de Canto y Baile",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.amber,
                    ),
                  ),
                  new Text("")
                ],
              ),
              new Container(
                padding: new EdgeInsets.all(20.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text("Opcion 1: \n7 dias"),
                  new Text(
                    "TOTAL:\n\$$precio",
                    style: new TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(""),
                  new GestureDetector(
                    onTap: () => setState(() {
                          _animatedHeight != 0.0
                              ? _animatedHeight = 0.0
                              : _animatedHeight = 100.0;
                        }),
                    child: new Text(
                      "Ver Desglose de Pago",
                      style: TextStyle(color: Colors.greenAccent, fontSize: 10),
                      textAlign: TextAlign.right,
                    ),
                  )
                ],
              ),
              new AnimatedContainer(
                duration: const Duration(milliseconds: 120),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        new Text("Precio por persona"),
                        new Text(
                          "\$$precioPpersona",
                          textAlign: TextAlign.right,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        new Text("Impuesto"),
                        new Text(
                          "\$0",
                          textAlign: TextAlign.right,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        new Text("Comision"),
                        new Text("\$30.00")
                      ],
                    )
                  ],
                ),
                height: _animatedHeight,
              )
            ],
          ),
        ),
      );
  Widget participants() => Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.0, color: Colors.grey),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Text("Particiantes"),
            new IconButton(
              icon: Icon(FontAwesomeIcons.minusCircle),
              onPressed: () {
                setState(() {
                  participantes--;
                  if (participantes <= 0) {
                    participantes = 0;
                  }
                  precio = (precioPpersona * participantes) + 30;
                });
              },
            ),
            new Text("$participantes"),
            new IconButton(
              icon: Icon(FontAwesomeIcons.plusCircle),
              onPressed: () {
                setState(() {
                  participantes++;
                  if (participantes > 10) {
                    participantes = 10;
                  }

                  precio = (precioPpersona * participantes) + 30;
                });
              },
            )
          ],
        ),
      );
  Widget pago1() => Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.0, color: Colors.grey),
          ),
        ),
        child: Row(
          children: <Widget>[
            new Radio(
              activeColor: Colors.green,
              value: 0,
              groupValue: _radioValue,
              onChanged: _handleRadioValueChange,
            ),
            new SizedBox(
              height: 30,
            ),
            new Text("Pago con tarjeta"),
          ],
        ),
      );
  Widget pago2() => Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.0, color: Colors.grey),
          ),
        ),
        child: Row(
          children: <Widget>[
            new Radio(
              activeColor: Colors.green,
              value: 1,
              groupValue: _radioValue,
              onChanged: _handleRadioValueChange,
            ),
            new SizedBox(
              height: 30,
            ),
            new Text("Pago via OXXO"),
          ],
        ),
      );
  Widget condiciones() => Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.0, color: Colors.grey),
          ),
        ),
        child: Column(
          children: <Widget>[],
        ),
      );

  Widget continueButton() => Container(
        decoration: new BoxDecoration(color: Colors.green),
        child: new FlatButton(
            child: new Text(
              'Continuar',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              if (participantes == 0) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // return object of type Dialog
                    return AlertDialog(
                      title: new Text("No hay participantes"),
                      content: new Text(
                          "Agrega el numero de participantes para poder continuar"),
                      actions: <Widget>[
                        // usually buttons at the bottom of the dialog
                        new FlatButton(
                          child: new Text("Cerrar"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );

                return;
              }
              if (_radioValue == 0) {
                print("Pago con targeta");
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // return object of type Dialog
                    return AlertDialog(
                      title: new Text("Terminos y condiciones"),
                      content: new Text(
                          "Condicion 1\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          textAlign: TextAlign.left,
                        ),
                      
                      actions: <Widget>[
                        // usually buttons at the bottom of the dialog
                        new FlatButton(
                          child: new Text("Aceptar"),
                          color: Colors.green,
                          textColor: Colors.white,
                          onPressed: () {
                           
                          },
                        ),
                      ],
                    );
                  },
                );
               
              } else {
                print("Pago via Oxxo");
                Navigator.of(context).pushNamed("/PagoOxxo");
              }
            }),
      );

  Widget bodyData(BuildContext context) => Container(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              cardInformation(),
              SizedBox(
                height: 15.0,
              ),
              participants(),
              SizedBox(
                height: 15.0,
              ),
              pago1(),
              SizedBox(
                height: 15.0,
              ),
              pago2(),
              SizedBox(
                height: 15.0,
              ),
              condiciones(),
              SizedBox(
                height: 15.0,
              ),
              continueButton(),
              SizedBox(height: 15.0),
            ],
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("informacion de Pago",
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
          print("Pago con tarjeta");

          break;
        case 1:
          print("Pago via oxxo");
          break;

        default:
      }
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:beta_balmer/utils/uidata.dart';

class Pag4Act extends StatefulWidget {
  @override
  _Pag4ActState createState() => _Pag4ActState();
}

class _Pag4ActState extends State<Pag4Act> {
  DateTime initialTimer;
  DateTime finalTimer;

  var horaInicio;
  var horaFinal;

  Widget continueButton() => Container(
        decoration: new BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color(0xFF00827D), Colors.yellow],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: new CupertinoButton(
          borderRadius: BorderRadius.circular(10.0),
            child: new Text(
              'Continuar',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              print('Hora de inicio $horaInicio');
              print('Hora de fin $horaFinal');
              Navigator.pushNamed(context, UIData.activityRoute5);
            }),
      );


  Widget time1() => Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          border: Border(
              top: BorderSide(width: 1.0, color: Colors.grey),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Text("Inicio", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),

            ),
            TimePickerSpinner(
                is24HourMode: true,
                normalTextStyle: TextStyle(fontSize: 18, color: Colors.grey),
                highlightedTextStyle:
                    TextStyle(fontSize: 22, color: Colors.black),
                spacing: 20,
                itemHeight: 60,
                isForce2Digits: true,
                onTimeChange: (time) {
                  setState(() {
                    horaInicio= new DateFormat.Hm().format(time);
                    //initialTimer = time;
                  });
                },
              ),
               Positioned(
              bottom: 70,
              right: 10,
              child: Text("Hrs", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

            ),
          ],
        )
      );
      Widget time2() => Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
         border: Border(
              top: BorderSide(width: 1.0, color: Colors.grey),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: new Text("Fin", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),

            ),
            TimePickerSpinner(
                is24HourMode: true,
                normalTextStyle: TextStyle(fontSize: 18, color: Colors.grey),
                highlightedTextStyle:
                    TextStyle(fontSize: 22, color: Colors.black),
                spacing: 20,
                itemHeight: 60,
                isForce2Digits: true,
                onTimeChange: (time) {
                  setState(() {
                     horaFinal= new DateFormat.Hm().format(time);
                    //finalTimer = time;
                  });
                },
              ),
               Positioned(
              bottom: 70,
              right: 10,
              child: Text("Hrs", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

            ),
          ],
        ),
      );

  Widget bodyData(BuildContext context) => Container(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              new SizedBox(height: 20.0,),
              new Text(
                "Agrega un horario a tu actividad",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              new SizedBox(
                height: 20.0,
              ),
              time1(),
              new SizedBox(
                height: 20.0,
              ),
              time2(),
              new SizedBox(
                height: 20.0,
              ),
              continueButton(),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Horario",
            style: TextStyle(
              color: Colors.lightBlue,
            )),
        backgroundColor: Colors.white70,
      ),
      body: bodyData(context),
    );
  }
}

import 'package:beta_balmer/pages/viewActivity/Page4.dart';
import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {

  Widget cardInformation() =>Container(
    child: Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          new Text("Curso de Canto y Baile", style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),),
           new Container(
                padding: new EdgeInsets.all(30.0),
              ),
            Row(
   
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text("Opcion 1: 7 dias"),
                new Text("TOTAL: 14.000")
              ],
            ),
            Container(
              padding: new EdgeInsets.all(10.0),
            )
        ],
      ),
    ),

  );

      Widget continueButton() => Container(
        decoration: new BoxDecoration(
         color: Colors.green
        ),
        child: new FlatButton(
            child: new Text(
              'Continuar',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              print('Clicked');
                Navigator.of(context).push(
                           MaterialPageRoute(
                      builder: (context)=> Page4(),
                        ));
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
              continueButton(),
            ],
          ),
        ),
      );
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("informacion de Pago", style: TextStyle(color: Colors.green,)),
        backgroundColor: Colors.white70,
      ),
      body: bodyData(context),
    );
  }
}
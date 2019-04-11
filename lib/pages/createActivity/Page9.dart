import 'package:beta_balmer/model/actividad.dart';
import 'package:beta_balmer/pages/createActivity/Page10.dart';
import 'package:flutter/material.dart';
import 'package:beta_balmer/model/user.dart';
import 'package:beta_balmer/utils/localData.dart';

class Page9Act extends StatefulWidget {
  final Actividad actividad;

  const Page9Act({Key key, this.actividad}) : super(key: key);
  @override
  _Page9ActState createState() => _Page9ActState();
}

class _Page9ActState extends State<Page9Act> {
Actividad _actividad;

String userName;
String userPic;


void initState(){
  _actividad=widget.actividad;
  super.initState();
}

void user() async {
    User usr = await LocalData.getUser();
    userName = usr.nombre;
    userPic = usr.foto;
  }



  Widget description1() => Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.0, color: Colors.grey),
          ),
        ),
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(8.0),
          children: <Widget>[
            new Text("Descripcion",
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
              new Text(_actividad.description2),      
           // new Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum")
          ],
        ),
      );

  Widget ratingStack() => Positioned(
        top: 270.0,

        left: 150.0,
        child: Container(
          padding: EdgeInsets.all(4.0),
          child: Row(
            children: <Widget>[
             Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 30.0,
                ),
               
              SizedBox(
                width: 10.0,
              ),
              Text(
                "_ _",
                style: TextStyle(color: Colors.black, fontSize: 15.0),
              ),
              SizedBox(
                width: 10.0,
              ),
             
            ],
          ),
        ),
      );

  Widget imageStack() => Stack(
        children: <Widget>[
          Image.network(
            "https://i.pinimg.com/originals/b9/17/aa/b917aaffae32fc178d8590467df960b0.jpg",
            //_actividad.foto,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 160.0,
            //bottom: 90.0,
            child: FittedBox(
                fit: BoxFit.cover,
                child: Text.rich(
                  TextSpan(
                    text: _actividad.titulo,
                    //text: "Taller",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 12,
                        color: Colors.white.withOpacity(0.9)),
                    children: <TextSpan>[
                      TextSpan(
                          text: _actividad.descripcion,
                         // text: "iluminacion arquitectonica y ambiental",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white.withOpacity(0.9))),
                    ],
                  ),
                )),
          ),
        ],
      );
  //stack2
  Widget descStack() => Positioned(
        top: 200.0,
        left: 0.0,
        right: 0.0,
        child: Container(
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.8)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage( "https://avatars0.githubusercontent.com/u/12619420?s=460&v=4")
                        //backgroundImage: NetworkImage("$userPic")
                      ),
                      Text("$userName",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          )),
                    ]),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text("\$ ${_actividad.price}",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        )),
                    Text("${_actividad.numSesion} Sesiones",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

      Widget continueButton(BuildContext context) => Container(
        decoration: new BoxDecoration(
          color: Colors.green
        ),
        child: new FlatButton(
            child: new Text(
              'Finalizar',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context)=> Page10Act(),
                    )
                  );
            }),
      );
  Widget bodyData2(BuildContext context) => Container(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8.0),
            children: <Widget>[
              new Text("Hecha un ultimo vistazo a tu publicacion",
              style: new TextStyle(
                fontSize: 18.0, fontWeight: FontWeight.bold
              ),),
              new Text("Antes de publicar verifica que la informacion sea correcta,\nuna ves publicada la actividad no se admitiran cambios"),
              SizedBox(
                width: 400,
                height: 350,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    imageStack(),
                    descStack(),
                    ratingStack(),

                    //description1()
                  ],
                ),
              ),
              description1(),
              continueButton(context),
              SizedBox(height: 20.0,)
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Column(
          children: <Widget>[
            new Text(
              "Confirmar Visualizacion",
              style: new TextStyle(fontSize: 18, color: Colors.green),
            ),
          ],
        ),
        backgroundColor: Colors.white70,
      ),
      body: bodyData2(context),
    );
  }
}
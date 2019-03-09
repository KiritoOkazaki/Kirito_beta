import 'package:beta_balmer/utils/uidata.dart';
import 'package:flutter/material.dart';
import 'package:beta_balmer/model/activities.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:beta_balmer/model/reviews.dart';
import 'package:beta_balmer/pages/viewActivity/Page2.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Page1 extends StatelessWidget {
  final Activities activity;

  Page1({Key key, @required this.activity}) : super(key: key);

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
            new Text("\n${activity.description}")
          ],
        ),
      );
  Widget description2() => Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text("Idioma: ${activity.idioma}"),
                SizedBox(
                  height: 20,
                ),
                new Text("Edad: ")
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text("Horarios: "),
                SizedBox(
                  height: 20.0,
                ),
                new Text("Sexo: Cualquiera")
              ],
            )
          ],
        ),
      );
  Widget description3() => Container(
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
            new Text("¿Quien puede participar?",
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            new Text("\n${activity.description}")
          ],
        ),
      );
  Widget description4() => Container(
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
            new Text("¿Que aprendere?",
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            new Text("\n${activity.description}")
          ],
        ),
      );
  Widget description5() => Container(
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
            new Text("Certificacion",
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text("Se dara un reconocimiento al finalizar el curso"),
                new Icon(FontAwesomeIcons.award)
              ],
            )
          ],
        ),
      );
  Widget description6() => Container(
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
            new Text("¿Donde es la actividad?",
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
                    Column(
  children: <Widget>[
    Container(
      //height: MediaQuery.of(context).size.height,
      //width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        onMapCreated: (GoogleMapController controller) {},
      ),
    ),
  ],
),
            ////////AQUI VA EL CODIGO DE GOOGLE MAPS////////////
          ],
        ),
      );
      Widget description7() => Container(
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
            new Text("Notas extras",
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            new Text("En caso de requerir algun instrumento nosotros te lo proporcionaremos")
          ],
        ),
      );
  Widget description8() => Container(
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
            new Text("Terminos y condiciones",
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            new Text("\n${activity.description}"),
            new GestureDetector(
  onTap: () {
    print("Terminos y condiciones");
    //Navigator.pushNamed(context, "myRoute");
  },
  child: new Text("Ver condiciones de cancelacion", style: TextStyle(color: Colors.greenAccent),),
)

          ],
        ),
      );
  
  Widget organizator() => Container(
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
            new Text("Organizador",
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(activity.personImage),
                ),
                Column(
                  children: <Widget>[
                    Text(activity.personName,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          )),
                   
                  ],
                ),
                Column(
                  children: <Widget>[
                    new FlatButton(
              child: new Text(
                "Enviar Mensaje",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              color: Colors.grey.withOpacity(0.8),
              textColor: Colors.green,
              onPressed: () {
                print("enviar mensaje");
              },
            ),
                  ],
                )
              ],
            ),
          ],
        ),
      );
  Widget review() => Container(
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
            new Text("Reseñas",
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(activity.personImage),
                ),
                Column(
                  children: <Widget>[
                    new Text("Revisor 1"),
                    //new Text("${activity.description}")
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 30.0,
                    ),
                    Text(
                      activity.rating.toString(),
                      style: TextStyle(color: Colors.black, fontSize: 15.0),
                    ),
                  ],
                )
              ],
            ),
            new GestureDetector(
              onTap: () {
                print("Reseñas");
              },
              child: new Text("Ver mas Reseñas",
                  style: new TextStyle(color: Colors.greenAccent)),
            ),
          ],
        ),
      );

  Widget ratingStack() => Positioned(
        top: 270.0,
        //left: 10.0,
        child: Container(
          padding: EdgeInsets.all(4.0),
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 30.0,
                ),
                onPressed: () {
                  print("reseñas");
                },
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                activity.rating.toString(),
                style: TextStyle(color: Colors.black, fontSize: 15.0),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                "ver reseñas de otros participantes",
                style: TextStyle(color: Colors.black, fontSize: 12.0),
              )
            ],
          ),
        ),
      );

  Widget imageStack() => Stack(
        children: <Widget>[
          Image.network(
            activity.image,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 160.0,
            //bottom: 90.0,
            child: FittedBox(
                fit: BoxFit.cover,
                child: Text.rich(
                  TextSpan(
                    text: activity.types,
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 12,
                        color: Colors.white.withOpacity(0.9)),
                    children: <TextSpan>[
                      TextSpan(
                          text: '\n${activity.title}',
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
                        backgroundImage: NetworkImage(activity.personImage),
                      ),
                      Text(activity.personName,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          )),
                    ]),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(activity.price,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        )),
                    Text('Sesiones: ${activity.totalSesion}',
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
          gradient: LinearGradient(
            colors: [
            const Color(0xFF00827D),
            Colors.yellow
            ],
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
              Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context)=> Page2(),
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
              description2(),
              description3(),
              description4(),
              description5(),
              review(),
              organizator(),
              description6(),
              description7(),
              description8(),
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
              "Informacion de la actividad",
              style: new TextStyle(fontSize: 18, color: Colors.green),
            ),
            new Text(
              "${activity.totalSesion} sesiones",
              style: new TextStyle(fontSize: 15, color: Colors.black),
            )
          ],
        ),
        backgroundColor: Colors.white70,
      ),
      body: bodyData2(context),
    );
  }
}

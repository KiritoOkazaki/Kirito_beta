import 'dart:io';
import 'package:beta_balmer/pages/createActivity/Page9.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class Page8Act extends StatefulWidget {
  @override
  _Page8ActState createState() => _Page8ActState();
}

class _Page8ActState extends State<Page8Act> {
TextEditingController _controller = new TextEditingController();
File _image;

Future getImage() async {
  var img =await ImagePicker.pickImage(source: ImageSource.gallery);

  setState(() {
    _image = img;
  });
}
 
Widget video() => Container(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      new Text("Comparte un video (Opcional)"),
      new SizedBox(height: 15,),
      new TextField(
        controller: _controller,
        decoration: const InputDecoration(
                labelText: 'Introduce la url del video',
              ),
              keyboardType: TextInputType.url,

      )
    ],
  ),
);

  Widget titles() => Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Text(
            "Sube tus mejores fotografias",
            style: new TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.0,
          ),
          new Text(
              "la fotografia principal es obligatoria y sera la primera que vean los participantes")
        ],
      ));

  Widget imageMain() => Container(
    height: 250,
    width: 250,
        child: Card(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
              FlatButton.icon(icon: Icon(FontAwesomeIcons.camera,
                    size: 70.0, color: Colors.grey.withOpacity(0.5)),label: new Text(""), onPressed: getImage
              )
              ],
            ),
          ),
        ),
       
      );

      Widget gridImages() => new Container(
        child: GridView.builder(
        itemCount: 6,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index){
          return new GestureDetector(
            child: new Card(
              elevation: 5.0,
              child: Container(
               // alignment: Alignment.centerLeft,
               // margin: new EdgeInsets.only(top: 10, bottom: 10, left: 10.0),
                child: new Icon(FontAwesomeIcons.camera, color: Colors.grey.withOpacity(0.5),),
              ),
            ),
            onTap: getImage,
          );
        },
      )

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
               Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context)=> Page9Act(),
                    )
                  );
            }),
      );

  
  Widget bodyData(BuildContext context) => Container(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(8.0),
            children: <Widget>[
              titles(),
              Container(padding: EdgeInsets.all(8.0),),
              imageMain(),
              SizedBox(height: 5.0,),
              SizedBox(
                width: 300,
                height: 270,
                child: gridImages()
              ),
              SizedBox(height: 10.0,),
              video(),
              SizedBox(height: 8.0,),
              continueButton()
            

            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Subir Fotos y Videos",
            style: TextStyle(
              color: Colors.green,
            )),
        backgroundColor: Colors.white70,
      ),
      body: bodyData(context),
    );
  }
}

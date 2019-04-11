import 'dart:io';
import 'package:beta_balmer/pages/firstLogin/page2.dart';
import 'package:beta_balmer/pages/firstLogin/page4.dart';
import 'package:beta_balmer/utils/showDialogSingleButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  static final GlobalKey<ScaffoldState> scaffoldKey =
      new GlobalKey<ScaffoldState>();
  TextEditingController _controller = new TextEditingController();
  int verifCode;
  File _image;

  Future getImage() async {
    var img = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      print("image $img");
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: scaffoldKey,
        appBar: new AppBar(
          leading: new IconButton(
            icon: Icon(
              Icons.mail,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          backgroundColor: Colors.white,
        ),
        body: bodyData(context));
  }

  Widget bodyData(BuildContext context) => Container(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            children: <Widget>[
              new Text("Sube una identificación oficial",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              new SizedBox(
                height: 3.0,
              ),
              new Text(
                  "Es necesario subir una identificacion oficial para poder participar o publicar",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
              new SizedBox(
                height: 5.0,
              ),
              /*new TextField(
                controller: _controller,
                decoration: const InputDecoration(
                    hintText: "Introduce unicamente numeros"),
                keyboardType: TextInputType.phone,
                maxLines: 1,
              ),*/
              new SizedBox(
                height: 5.0,
              ),
              new CupertinoButton(
                  child: new Text("Buscar"),
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.transparent,
                  minSize: 10.0,
                  onPressed: getImage),
              new SizedBox(
                height: 30.0,
              ),
              GestureDetector(
                child: new Text("Omitir este paso",
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Page4()));
                },
              ),
              new SizedBox(
                height: 20.0,
              ),
              new CupertinoButton(
                child: new Text(
                  "Continuar",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.blue,
                minSize: 20.0,
                onPressed: () {
                  if (_image == null) {
                    showDialogSingleButton(
                        context,
                        "Archivo incorrecto ",
                        "Es posible que haya subido un archivo incorrecto",
                        "OK");
                  } else {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Page2()));
                    //Navigator.pushNamed(context, UIData.activityRoute2);
                  }
                },
              ),
            ],
          ),
        ),
      );
}

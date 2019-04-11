import 'dart:io';
import 'package:beta_balmer/model/user.dart';
import 'package:beta_balmer/pages/firstLogin/page2.dart';
import 'package:beta_balmer/services/putService.dart';
import 'package:beta_balmer/utils/localdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:beta_balmer/utils/uidata.dart';
import 'package:image_picker/image_picker.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  static final GlobalKey<ScaffoldState> scaffoldKey =
      new GlobalKey<ScaffoldState>();
  TextEditingController _controller = new TextEditingController();
  TextEditingController _userNamecontroller = new TextEditingController();
  TextEditingController _firstNamecontroller = new TextEditingController();
  TextEditingController _lastNamecontroller = new TextEditingController();
  String userName = "Name";
  String nombre = "name";
  String apellidos = "name";
  //File _image = new File();
  bool barIndicator = false;

  Future getImage() async {
    var img = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      print("image $img");
      //_image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: scaffoldKey,
        appBar: new AppBar(
          leading: new BackButton(color: Colors.black),
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
              new Text("Completa tu informacion",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              new SizedBox(
                height: 10.0,
              ),
              new Padding(
                padding: EdgeInsets.all(20.0),
                child: new GestureDetector(
                  child: new CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(UIData.agregarFoto),
                  ),
                  onTap: getImage,
                ),
              ),
              new SizedBox(
                height: 10.0,
              ),
              nombreUsuario(),
              new SizedBox(
                height: 5.0,
              ),
              new TextField(
                controller: _controller,
                decoration: const InputDecoration(
                    labelText: 'Descripción del Usuario',
                    hintText: "Realiza una breve descripcion"),
                keyboardType: TextInputType.multiline,
                maxLines: 5,
              ),
              new SizedBox(
                height: 10.0,
              ),
              datosUsuario(),
              new SizedBox(
                height: 20.0,
              ),
              new CupertinoButton(
                child: new Text(
                  "Siguiente",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.blue,
                minSize: 20.0,
                onPressed: () {
                  putUser();
                  /* Navigator.of(context).push(MaterialPageRoute(
       builder: (context) => Page2()
     ));*/
                  if (barIndicator == true) _onLoading();

                  //Navigator.pushNamed(context, UIData.activityRoute2);
                },
              ),
            ],
          ),
        ),
      );

  Widget nombreUsuario() => Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: new TextFormField(
          controller: _userNamecontroller,
          decoration: const InputDecoration(
              labelText: 'Usuario', hintText: "Introduce tu nombre de usuario"),
          keyboardType: TextInputType.text,
          autovalidate: true,
          validator: (String arg) {
            if (arg.length == 0)
              return 'debes introducir un nombre de usuario';
            else
              return null;
          },
          onSaved: (String val) {
            userName = val;
          },
        ),
      );

  Widget datosUsuario() => Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: new Column(
        children: <Widget>[
          new TextFormField(
            controller: _firstNamecontroller,
            decoration: const InputDecoration(
                labelText: 'Nombre', hintText: "Introduce tu nombre"),
            keyboardType: TextInputType.text,
            autovalidate: true,
            validator: (String arg) {
              if (arg.length == 0)
                return 'debes introducir tu nombre';
              else
                return null;
            },
            onSaved: (String val) {
              nombre = val;
            },
          ),
          new SizedBox(
            height: 10.0,
          ),
          new TextFormField(
            controller: _lastNamecontroller,
            decoration: const InputDecoration(
                labelText: 'Apellidos', hintText: "Introduce tus apellidos"),
            keyboardType: TextInputType.text,
            autovalidate: true,
            validator: (String arg) {
              if (arg.length == 0)
                return 'debes introducir tus apellidos';
              else
                return null;
            },
            onSaved: (String val) {
              apellidos = val;
            },
          ),
        ],
      ));

  void putUser() async {
    await requestUserUpdate(
            context,
            _userNamecontroller.text,
            _firstNamecontroller.text,
            _lastNamecontroller.text,
            _controller.text,
            "")
        .then((s) {
      return barIndicator = s;
    });
  }

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      child: new Dialog(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
            new SizedBox(
              height: 20.0,
              width: 10.0,
            ),
            new Text("Enviando Datos...",
                style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}

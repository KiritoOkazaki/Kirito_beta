import 'package:beta_balmer/services/postService.dart';
import 'package:beta_balmer/utils/uidata.dart';
import 'package:flutter/material.dart';
import 'package:beta_balmer/pages/createAccount/crearCuenta1.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool barIndicator = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: loginBody(context),
      ),
    );
  }

  loginBody(context) => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[loginHeader(), loginFields(context)],
        ),
      );

  loginHeader() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            UIData.nuevoBalmerColor,
            height: 200,
            width: 200,
            //fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Descube nuevas actividades",
            style:
                TextStyle(fontWeight: FontWeight.w700, color: Colors.lightBlue),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            "Ingresa para continuar",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      );

  loginFields(context) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
              child: TextFormField(
                controller: _emailController,
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Ingresa tu correo",
                  labelText: "Correo",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              child: TextFormField(
                controller: _passwordController,
                maxLines: 1,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Ingresa tu contraseña",
                  labelText: "Contraseña",
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).pushNamed(UIData.recoverPass);
              }, 
              child: Text(
                "Olvide mi contraseña",
                textAlign: TextAlign.end,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              width: double.infinity,
              child: RaisedButton(
                padding: EdgeInsets.all(12.0),
                shape: StadiumBorder(),
                child: Text(
                  "Ingresar",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.lightBlue,
                onPressed: () {
                  postLogin(_emailController.text, _passwordController.text);
                  if(barIndicator==true)
                   _onLoading();
                  //Navigator.pushNamed(context, "/homePage");
                }, //API Y ROUTE AL HOME PAGE
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(UIData.createAccount);
             
              },
              child: Text(
                "CREA UNA CUENTA",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      );

  void postLogin(email, password) async {
    print(email);
    print(password);
    await requestLoginAPI(context, email, password).then((s) {
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
            new Text("Iniciando Sesion...",
                style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}

import 'package:beta_balmer/pages/firstLogin/page3.dart';
import 'package:beta_balmer/utils/showDialogSingleButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code_input/flutter_verification_code_input.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  static final GlobalKey<ScaffoldState> scaffoldKey =
      new GlobalKey<ScaffoldState>();
  TextEditingController _controller = new TextEditingController();
  int verifCode;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: scaffoldKey,
        appBar: new AppBar(
          leading: new BackButton(
            color: Colors.black
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
              new Text("Verifica tu numero Movil",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              new SizedBox(
                height: 3.0,
              ),
              new Text(
                  "Introduce tu numero de celular y recibe un codigo de activacion",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              new SizedBox(
                height: 5.0,
              ),
              new TextField(
                controller: _controller,
                decoration: const InputDecoration(
                    hintText: "Introduce unicamente numeros"),
                keyboardType: TextInputType.phone,
                maxLines: 1,
              ),
              new SizedBox(
                height: 5.0,
              ),
            
                  new CupertinoButton(
                    child: new Text("Obtener codigo"),
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.transparent,
                    minSize: 10.0,
                    onPressed: () {
                      print("Telefono ${_controller.text}");
                    },
                  ),
                  
                
              
              new SizedBox(
                    height: 50.0,
                  ),
                  VerificationCodeInput(
                    length: 5,
                    keyboardType: TextInputType.number,
                    onCompleted: (String value) {
                      verifCode = value as int;
                      print(verifCode);
                    },
                  ),
                  new SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    child: new Text("Omitir este paso",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold
                        )),
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
       builder: (context) => Page3()
     ));
                          
                        },
                  ),
                  new SizedBox(
                    height: 50.0,
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
                  if(verifCode==null){
                    showDialogSingleButton(context, "Codigo incorrecto", "El codigo que has ingresado es incorrecto", "OK");
    
                  }
                  else{
                    Navigator.of(context).push(MaterialPageRoute(
       builder: (context) => Page3()
     ));
                  }
                  
                },
              ),
            ],
          ),
        ),
      );
}

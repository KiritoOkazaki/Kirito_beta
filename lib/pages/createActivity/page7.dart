import 'package:beta_balmer/model/actividad.dart';
import 'package:beta_balmer/pages/createActivity/Page8.dart';
import 'package:flutter/material.dart';

class Page7Act extends StatefulWidget {
  final Actividad actividad;

  const Page7Act({Key key, this.actividad}) : super(key: key);
  @override
  _Page7ActState createState() => _Page7ActState();
}

class _Page7ActState extends State<Page7Act>
    with SingleTickerProviderStateMixin {
  int _radioValue = 0;
  bool condCancel=false;
  TabController _controller;
  TextEditingController _priceController = new TextEditingController();
  bool _value1 = false;
  Actividad _actividad;

  @override
  void initState() {
    _actividad=widget.actividad;
    super.initState();
    _controller = new TabController(
      length: 2,
      vsync: this,
    );
  }

  void _onChanged1(bool value) => setState(() => _value1 = value);

  Widget conditions() => Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.0, color: Colors.grey),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Text("Condiciones de cancelacion", style: new TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            new SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Radio(
                  activeColor: Colors.green,
                  value: 0,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChange,
                ),
                new SizedBox(
                  height: 10.0,
                ),
                new Expanded(
                  flex: 3,
                  child: new Text("Condicion 1\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",textAlign: TextAlign.left,),
             
                )
                 ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Radio(
                  activeColor: Colors.green,
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChange,
                ),
                new SizedBox(
                  height: 10.0,
                ),
                new Expanded(
                  flex: 3,
                  child: new Text("Condicion 2\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",textAlign: TextAlign.left,),
             
                )
              
              ],
            )
          ],
        ),
      );

  Widget precioForm() => Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Text(
              "Introduce el precio que tendra esta opcion por persona",
              style: new TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 16.0,
            ),
            new TextField(
              controller: _priceController,
              decoration: const InputDecoration(
                labelText: 'Introduce unicamente numeros enteros',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 16.0,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Utiliza esta cantidad \nen todas las opciones"),
                Switch(
                  value: _value1,
                  onChanged: _onChanged1,
                  activeColor: Colors.green,
                ),
              ],
            )
          ],
        ),
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
              _actividad.setPrice=_priceController.text as double;
              _actividad.setCancelacion=condCancel;
               Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context)=> Page8Act(),
                    )
                  );
            }),
      );

  Widget bodyData(BuildContext context) => Container(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              precioForm(),
              SizedBox(
                height: 16.0,
              ),
              conditions(),
              SizedBox(
                height: 16.0,
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
          title: new Text("Precio de actividad",
              style: TextStyle(
                color: Colors.green,
              )),
          backgroundColor: Colors.white70,
          bottom: TabBar(
            controller: _controller,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.black.withOpacity(0.8),
            tabs: const <Tab>[
              const Tab(text: 'Opcion 1'),
              const Tab(text: 'Opcion 2'),
            ],
            indicatorColor: Colors.green,
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: <Widget>[bodyData(context), bodyData(context)],
        ));
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          condCancel=false;
          print("Condicion 1");

          break;
        case 1:
        condCancel=true;
          print("Condicion 2");
          break;

        default:
      }
    });
  }
}

import 'package:flutter/material.dart';
import 'package:beta_balmer/utils/uidata.dart';

class CommonDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                 colors: [const Color(0xFF00827D), const Color(0xFF46A040),const Color(0xFF2E7DE1), const Color(0xFF94348C)],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
              ),
            ),
            accountName: Text(
              "Pawan Kumar",
            ),
            accountEmail: Text(
              "mtechviral@gmail.com",
            ),
            currentAccountPicture: new CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: new AssetImage(UIData.balmerLogo),
            ),
          ),
          new ListTile(
            title: Text(
              "Profile",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.person,
              color: Colors.blue,
            ),
          ),
          new ListTile(
            title: Text(
              "Shopping",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.shopping_cart,
              color: Colors.green,
            ),
          ),
          new ListTile(
            title: Text(
              "Dashboard",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.dashboard,
              color: Colors.red,
            ),
          ),
          new ListTile(
            title: Text(
              "Timeline",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.timeline,
              color: Colors.cyan,
            ),
          ),
          Divider(),
          new ListTile(
            title: Text(
              "Settings",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.settings,
              color: Colors.brown,
            ),
          ),
          Divider(),
          new ListTile(
            title: Text(
              "Salir",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
              ),
              leading: new IconButton(icon: new Icon(Icons.exit_to_app,color: Colors.red,), onPressed: (){
          //Area de funcionamiento del boton salir
          //authenticationBloc.onLogout();
          Navigator.of(context).pushNamedAndRemoveUntil(UIData.loginRoute, (Route <dynamic> route)=> false);
          }),
          )
          
          //MyAboutTile()
        ],
      ),
    );
  }
}

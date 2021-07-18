import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gwc/Pages/EditUser.dart';
import 'package:gwc/Pages/UserInfo.dart';
import 'package:gwc/Pages/password.dart';
import 'package:gwc/helpers/my_textStyles.dart';



class SettingsPage extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  SettingsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar:AppBar(
       iconTheme: IconThemeData(color: Colors.blue),
    
          elevation: 1,
          backgroundColor: Colors.white,
          title: Text("Settings",
              style: MyText.title(context).copyWith(
                color:Colors.blue,
              )),
         
         ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person_pin),
            title: Text('Profile'),
            onTap: (){
            Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditUser()),
                      );
            },
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Change Password'),
            onTap: (){
                Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Password()),
                      );
            },
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Terms and Privacy Policy'),
            onTap:  (){},
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('App Info'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Log Out'),
            onTap: (){},
          ),
         
        ],
      ),
    );
  }
}

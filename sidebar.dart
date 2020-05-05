import 'package:flutter/material.dart';
import 'package:myfirstapp/activity.dart';
import 'package:myfirstapp/main.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width:double.infinity,
              padding:EdgeInsets.all(20),
            color: Colors.deepPurple,
            child:Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height:100,
                    margin: EdgeInsets.only(top: 30,bottom: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: new AssetImage('assets/ishita.jpg'),
                      fit: BoxFit.fill
                      )
                    ),

                    ),

                  Text("Ishita Arora",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white),
                  ),
                  Text("ishita.arora28@gmail.com",
                    style: TextStyle(
                        color: Colors.white),
                  )
                  ]
              )
            ),
              ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile",
            style: TextStyle(fontSize: 18),),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings",
              style: TextStyle(fontSize: 18),),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.power_settings_new),
            title: Text("Log Out",
              style: TextStyle(fontSize: 18),),
            onTap: null,
          ),
            ],
      ),
          );
  }
}

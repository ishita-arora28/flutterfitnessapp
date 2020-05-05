import 'package:flutter/material.dart';
import 'package:myfirstapp/activity.dart';


void main() =>runApp(new MyApp());


class MyApp extends StatelessWidget{
  @override

  Widget build(BuildContext context){
    return MaterialApp(
        home: new LoginPage(),
        theme: new ThemeData(
            primarySwatch: Colors.blue,

        )
    );
  }
}
class LoginPage extends StatefulWidget{
  @override
  State createState() => new LoginPageState();

}

class LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  AnimationController _iconanimationController;
  Animation<double> _iconanimation;

  @override
  void initState() {
    super.initState();
    _iconanimationController = new AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300)
    );
    _iconanimation = new CurvedAnimation(
        parent: _iconanimationController, curve: Curves.easeInCirc);

    _iconanimation.addListener(() => this.setState(() {}));
    _iconanimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
              image: new AssetImage('assets/fit.jpeg'),
              fit: BoxFit.cover,
              color: Colors.black87,
              colorBlendMode: BlendMode.darken
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                  size: _iconanimation.value * 100
              ),
              new Form(
                  child: Container(
                    padding: const EdgeInsets.all(40.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                    new TextFormField(

                        decoration: new InputDecoration(
                        icon: const Icon(Icons.person,color: Colors.white),

                        hintText: "Email id",
                        hintStyle: TextStyle(fontSize: 20.0,
                        color: Colors.white,
                          
                        ),
                        ),
                        cursorColor: Colors.white,
                        style: TextStyle(
                          color: Colors.white
                        ),

                        keyboardType: TextInputType.emailAddress,
                        ),
                      new TextFormField(
                        decoration: new InputDecoration(
                        icon: const Icon(Icons.lock,color: Colors.white),
                        hintText: "Password",
                        hintStyle: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white
                        ),
                        ),
                        cursorColor: Colors.white,
                        style: TextStyle(
                          color: Colors.white
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true
                      ),
                      new Padding(padding: const EdgeInsets.only(top: 50.0)
                      ),
                       new ButtonTheme(
                         minWidth: 1000.0,
                          height: 50.0,
                       child: new RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.0),
                          side:BorderSide(color: Colors.greenAccent)
                        ),
                        child: new Text("Submit",textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25.0
                        ),),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return ActivityPage();
                          }));
                        },
                        textColor: Colors.white,
                        color: Colors.green,
                        elevation: 10.0,
                          ),
                       ),
                      ],
                    ),
                  ),
               ),
            ],
          ),
        ],
      ),
    );
  }

}


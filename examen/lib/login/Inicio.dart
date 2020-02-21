import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/home/home.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

class Inicio extends StatefulWidget {
  Inicio({Key key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final nombre_controller = TextEditingController();
  final contra_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 80, 0, 20),
                  child: Image.asset(
                    "assets/cupping.png",
                    height: 120,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 40, 0, 0),
                child: Text(
                  "Nombre completo:",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
          SizedBox(
            height: 12.0,
          ),
          Container(
            width: 380.0,
            child: TextField(
              controller: nombre_controller,
             // obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
               // labelText: 'Password',
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 20, 0, 0),
                child: Text(
                  "Password:",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
          SizedBox(
            height: 12.0,
          ),
          Container(
            width: 380.0,
            child: TextField(
            controller: contra_controller,

              obscureText: true,
              decoration: InputDecoration(
                filled: false,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                hintText: 'Password',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  height: 50.0,
                  minWidth: 350.0,
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10)),
                  color: Theme.of(context).buttonColor,
                  child: Text(
                    "ENTRAR",
                    style: TextStyle(
                      color: Theme.of(context).textSelectionColor,
                      fontSize: 18,
                      fontFamily: "AkzidenzGrotesk",
                    ),
                  ),
                  onPressed: () {
                    validate(nombre_controller.text, contra_controller.text, context);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("olvidaste la contraseña",
                  style: TextStyle(
                    color: Colors.white
                    
                  ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,10,0,0),
                  child: Text("¿Aun no tienes una cuenta?",
                  style: TextStyle(
                    color: Colors.white
                    
                  ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,10,0,0),
                  child: Text("Registrate",
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline
                  ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

validate(String usuario, String contra, BuildContext context){
 if (usuario == PROFILE_NAME && contra == CONTRA){
   Navigator.of(context).push(
     MaterialPageRoute(builder: (context){
       return Home(title: APP_TITLE,);
       
     }
    
     )
   );
 }
 else{
 return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Error'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Dastos incorrectos.'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Regret'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
 }
}
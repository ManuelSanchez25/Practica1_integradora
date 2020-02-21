import 'package:flutter/material.dart';

class Registro extends StatefulWidget {
  Registro({Key key}) : super(key: key);

  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  bool checkBoxValue = false;
  final nombre_controller = TextEditingController();
  final contra_controller = TextEditingController();
    final email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 80, 0, 20),
                  child: Image.asset(
                    "assets/cupping.png",
                    height: 90,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Text(
                  "Nombre completo:",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
          SizedBox(
            height: 6.0,
          ),
          Container(
            width: 370.0,
            height: 50,
            child: TextField(
              // obscureText: true,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'Anna Smith'
                  // labelText: 'Password',
                  ),
            ),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Text(
                  "Email:",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
          SizedBox(
            height: 6.0,
          ),
          Container(
            width: 370.0,
            height: 50,
            child: TextField(
              // obscureText: true,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'manuel@iteso.mx'
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
            width: 370.0,
            height: 50,
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.visibility_off),
                filled: false,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                hintText: 'Password',
              ),
            ),
          ),
          Container(
            //padding: EdgeInsets.all(10.0),
          
            child: Row(
              
              children: <Widget>[
                new Checkbox(
                  
                    value: checkBoxValue,
                    activeColor: Theme.of(context).buttonColor,
                    onChanged: (bool newValue) {
                      setState(() {
                        
                        checkBoxValue = newValue;
                      });
                    }),
                Text(
                  'ACEPTO TERMINOS Y CONDICIONES DE USO',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
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
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10)),
                  color: Theme.of(context).buttonColor,
                  child: Text(
                    "REGISTRARSE",
                    style: TextStyle(
                      color: Theme.of(context).textSelectionColor,
                      fontSize: 18,
                      fontFamily: "AkzidenzGrotesk",
                    ),
                  ),
                  onPressed: () {},
                ),
 
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text(
                    "¿Ya tienes una cuenta?",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    "INGRESA",
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline),
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

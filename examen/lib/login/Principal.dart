
import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/login/Inicio.dart';
import 'package:practica_integradora_uno/login/Registro.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

class Principal extends StatelessWidget {
  const Principal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           
                backgroundColor:Theme.of(context).backgroundColor,

      body:
      Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Image.asset("assets/cupping.png",
                  height: 150,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: MaterialButton(
              
              height: 50.0,
              minWidth: 350.0,
              color: Theme.of(context).buttonColor,
              child: Text(
                "REGISTRARSE",
                style: 
                TextStyle(
                  color: Theme.of(context).textSelectionColor,
                fontSize: 18,
                fontFamily: "AkzidenzGrotesk",
               ),
              ),
              onPressed: () {
                Navigator.of(context).push(
     MaterialPageRoute(builder: (context){
       return Registro();
       
     }
    
     )
   );
              },
            ),
          ),
         MaterialButton(
            height: 50.0,
            minWidth: 350.0,
            color: Theme.of(context).buttonColor,

            child: Text(
              "INGRESA",
              style: TextStyle(
                  color: Theme.of(context).textSelectionColor,

              fontSize: 18,
              fontFamily: "AkzidenzGrotesk"),
            ),
            onPressed: () {
              Navigator.of(context).push(
     MaterialPageRoute(builder: (context){
       return Inicio();
       
     }
    
     )
   );
            },
          ),
        ],
        
      ),
      
    );
  }
}

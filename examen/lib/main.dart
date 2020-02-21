import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/home/home.dart';
import 'package:practica_integradora_uno/login/Inicio.dart';
import 'package:practica_integradora_uno/login/Principal.dart';
import 'package:practica_integradora_uno/login/Registro.dart';
import 'package:practica_integradora_uno/utils/constants.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      theme: ThemeData(
        textSelectionColor: AZUL_REY,
        backgroundColor: PRIMARY_COLOR,
        buttonColor: Gray_COLOR,
       // canvasColor: Naranja_claro
      ),
      home: Principal(),
    );



    
  }
}

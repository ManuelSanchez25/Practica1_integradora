import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/Coffe/item_coffe.dart';
import 'package:practica_integradora_uno/drinks/item_drinks.dart';
import 'package:practica_integradora_uno/models/product_grains.dart';

class Coffepage extends StatelessWidget {
  final List<ProductGrains> coffeList;
  Coffepage({
    Key key,
    @required this.coffeList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cafe en grano"),
      ),
      body: ListView.builder(
        itemCount: coffeList.length,
        itemBuilder: (BuildContext context, int index) {
          return Itemcoffe(
            coffe: coffeList[index],
          );
        }, 
      ),
    );
  }
}

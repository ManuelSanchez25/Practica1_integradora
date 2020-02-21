import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/Coffe/item_coffe.dart';
import 'package:practica_integradora_uno/cup/item_cup.dart';
import 'package:practica_integradora_uno/drinks/item_drinks.dart';
import 'package:practica_integradora_uno/models/product_cup.dart';
import 'package:practica_integradora_uno/models/product_grains.dart';

class Cuppage extends StatelessWidget {
  final List<ProductCup> cupList;
  Cuppage({
    Key key,
    @required this.cupList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tazas"),
      ),
      body: ListView.builder(
        itemCount: cupList.length,
        itemBuilder: (BuildContext context, int index) {
          return Itemcup(
            cup: cupList[index],
          );
        },
      ),
    );
  }
}

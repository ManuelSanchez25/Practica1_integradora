import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/Coffe/coffe_page.dart';
import 'package:practica_integradora_uno/cart/cart.dart';
import 'package:practica_integradora_uno/cup/cup_page.dart';
import 'package:practica_integradora_uno/drinks/drinks_page.dart';
import 'package:practica_integradora_uno/home/item_home.dart';
import 'package:practica_integradora_uno/models/product_drinks.dart';
import 'package:practica_integradora_uno/models/product_grains.dart';
import 'package:practica_integradora_uno/models/product_cup.dart';

import 'package:practica_integradora_uno/models/product_repository.dart';
import 'package:practica_integradora_uno/profile.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

class Home extends StatefulWidget {
  final String title;
  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => Profile()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
               Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => Cart(productsList: cartalista,)),
              );
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: _openDrinksPage,
            child: ItemHome(
              title: "Bebidas",
              image: "https://i.blogs.es/723857/cafe_como/450_1000.jpg",
            ),
          ),
          GestureDetector(
            onTap: _cafeengrano,
            child: ItemHome(
              title: "Cafe en grano",
              image: "https://www.elplural.com/uploads/s1/34/84/2/cafe.jpeg",
            ),
          ),
          
          GestureDetector(
                      onTap: _openCupsPage,
                      child: ItemHome(
              title: "Tazas",
              image:
                  "https://walkingmexico.com/wp-content/uploads/2015/02/Viajografi%CC%81a-Las-7-mejores-tazas-de-cafe%CC%81-en-el-D.F.-1.jpg",
            ),
          ),
        ],
      ),
    );
  }

  void _openDrinksPage() {
    // TODO: completar en navigator pasando los parametros a la pagina de DrinksPage

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return DrinksPage(drinksList: bebidaslist,);
        },
      ),
    );
  }

  void _cafeengrano() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return Coffepage(coffeList: coffelist);
        },
      ),
    );
  }

  void _openCupsPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return Cuppage(cupList:tazalist);
      }),
    );
  }
}

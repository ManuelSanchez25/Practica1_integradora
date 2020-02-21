import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cart/pago.dart';
import 'package:practica_integradora_uno/drinks/item_drinks.dart';
import 'package:practica_integradora_uno/models/product_drinks.dart';
import 'package:practica_integradora_uno/models/product_item_cart.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

class ItemDrinkDetails extends StatefulWidget {
  final ProductDrinks drink;

  ItemDrinkDetails({Key key, @required this.drink}) : super(key: key);
  @override
  _ItemDrinkDetailsState createState() => _ItemDrinkDetailsState();
}

class _ItemDrinkDetailsState extends State<ItemDrinkDetails> {
  Color gustar() {
    if (widget.drink.liked == true) {
      return Colors.black;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    var precio = widget.drink.productPrice;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.drink.productTitle),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Card(
              elevation: 3,
              margin: EdgeInsets.fromLTRB(30, 10, 30, 0),
              color: Naranja_claro,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.favorite,
                      color: gustar(),
                    ),
                  ),
                  Image.network(
                    "${widget.drink.productImage}",
                    width: 350,
                    height: 250,
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 220, 0),
            child: Column(
              children: <Widget>[
                Text(
                  "${widget.drink.productTitle}",
                  style: TextStyle(fontSize: 30, fontFamily: "AkzidenzGrotesk"),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 10, 00, 0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 100, 0),
                  child: Text(
                    "${widget.drink.productDescription}",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 100, 0),
                child: Text("TAMAÑOS DISPONIBLES"),
              ),
              Text(
                "$precio",
                style: TextStyle(fontSize: 40),
              )
            ],
          ),
          ////////////////
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: Row(
              children: <Widget>[
                FlatButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black)),
                  color: Colors.white,
                  textColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  onPressed: () {
                    setState(() {
                      widget.drink.productSize = ProductSize.CH;
                     widget.drink.productPrice = widget.drink.productPriceCalculator();
                     precio = widget.drink.productPrice;
                    });
                  },
                  child: Text(
                    "Chico",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                RaisedButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black)),
                  onPressed: () {
                     setState(() {
                      widget.drink.productSize = ProductSize.M;
                     widget.drink.productPrice = widget.drink.productPriceCalculator();
                     precio = widget.drink.productPrice;
                    });
                  },
                  color: Colors.white,
                  textColor: Colors.black,
                  child: Text("Mediano", style: TextStyle(fontSize: 14)),
                ),
                SizedBox(width: 10),
                RaisedButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black)),
                  onPressed: () {
                     setState(() {
                      widget.drink.productSize = ProductSize.G;
                     widget.drink.productPrice = widget.drink.productPriceCalculator();
                     precio = widget.drink.productPrice;
                    });
                  },
                  color: Colors.white,
                  textColor: Colors.black,
                  child: Text("Grande", style: TextStyle(fontSize: 14)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Row(
              children: <Widget>[
                MaterialButton(
                  height: 50.0,
                  minWidth: 10.0,
                  color: Theme.of(context).buttonColor,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.black)),
                  child: Text(
                    "AGREGAR AL CARRITO",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: "OpenSans"),
                  ),
                  onPressed: () {
                  anadircarrito();

                  },
                ),
                SizedBox(width: 10),
                 MaterialButton(
                      height: 50.0,
                      minWidth: 10.0,
                      color: Theme.of(context).buttonColor,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.black)),
                      child: Text(
                        "COMPRAR AHORA",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: "OpenSans"),
                      ),
             onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => Pago()),
              );
            },
                    ),

              ],
            ),
          ),
        ],
      ),
    );
  }
 void anadircarrito(){
    if(!productsencarro.contains(widget.drink.productTitle)){
    ProductItemCart producto = new ProductItemCart(productTitle: (widget.drink.productTitle), productAmount: widget.drink.productAmount, productPrice: widget.drink.productPrice, productImage: widget.drink.productImage,liked: widget.drink.liked);
    cartalista.add(producto);
    productsencarro.add(widget.drink.productTitle);
    }
  }
}

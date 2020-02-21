import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cart/pago.dart';
import 'package:practica_integradora_uno/drinks/item_drinks.dart';
import 'package:practica_integradora_uno/models/product_drinks.dart';
import 'package:practica_integradora_uno/models/product_grains.dart';
import 'package:practica_integradora_uno/models/product_item_cart.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

class ItemCoffeDetails extends StatefulWidget {
  final ProductGrains coffe;

  ItemCoffeDetails({Key key, @required this.coffe}) : super(key: key);
  @override
  _ItemCoffeDetailsState createState() => _ItemCoffeDetailsState();
}

class _ItemCoffeDetailsState extends State<ItemCoffeDetails> {
  Color gustar() {
    if (widget.coffe.liked == true) {
      return Colors.black;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    var precio = widget.coffe.productPrice;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.coffe.productTitle),
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
                    "${widget.coffe.productImage}",
                    width: 350,
                    height: 250,
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 240, 0),
            child: Column(
              children: <Widget>[
                Text(
                  "${widget.coffe.productTitle}",
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
                    "${widget.coffe.productDescription}",
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
                      widget.coffe.productWeight = ProductWeight.CUARTO;
                     widget.coffe.productPrice = widget.coffe.productPriceCalculator();
                     precio = widget.coffe.productPrice;
                    });
                  },
                  child: Text(
                    "250 G",
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
                      widget.coffe.productWeight = ProductWeight.KILO ;
                     widget.coffe.productPrice = widget.coffe.productPriceCalculator();
                     precio = widget.coffe.productPrice;
                    });
                  },
                  color: Colors.white,
                  textColor: Colors.black,
                  child: Text("1K", style: TextStyle(fontSize: 14)),
                ),
                SizedBox(width: 10),
                
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
    if(!productsencarro.contains(widget.coffe.productTitle)){
    ProductItemCart producto = new ProductItemCart(productTitle: (widget.coffe.productTitle), productAmount: widget.coffe.productAmount, productPrice: widget.coffe.productPrice, productImage: widget.coffe.productImage, liked: widget.coffe.liked);
    cartalista.add(producto);
    productsencarro.add(widget.coffe.productTitle);
    }
  }
}

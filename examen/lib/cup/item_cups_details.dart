import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cart/pago.dart';
import 'package:practica_integradora_uno/drinks/item_drinks.dart';
import 'package:practica_integradora_uno/models/product_cup.dart';
import 'package:practica_integradora_uno/models/product_drinks.dart';
import 'package:practica_integradora_uno/models/product_item_cart.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

class ItemCupDetails extends StatefulWidget {
  final ProductCup cup;

  ItemCupDetails({Key key, @required this.cup}) : super(key: key);
  @override
  _ItemCupDetailsState createState() => _ItemCupDetailsState();
}

class _ItemCupDetailsState extends State<ItemCupDetails> {
  Color gustar() {
    if (widget.cup.liked == true) {
      return Colors.black;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    var precio = widget.cup.productPrice;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cup.productTitle),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Card(
              elevation: 3,
              margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
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
                    "${widget.cup.productImage}",
                    width: 350,
                    height: 250,
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 30, 200, 0),
            child: Column(
              children: <Widget>[
                Text(
                  "${widget.cup.productTitle}",
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
                    "${widget.cup.productDescription}",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 100, 0),
                child: Text("COLORES DISPONIBLES"),
              ),
              
              Text("Precio"),
             
            ],
          ),
          ////////////////
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: Row(
              children: <Widget>[
                MaterialButton(
                minWidth: 30,
                height: 30,
                  
                  color: Theme.of(context).buttonColor,
                  textColor: Colors.black,
                  
                  padding: EdgeInsets.all(8.0),
                  onPressed: () {
                    setState(() {
                      widget.cup.productColor = ProductColors.BLANCO;
                     widget.cup.productPrice = widget.cup.productPriceCalculator();
                     precio = widget.cup.productPrice;
                    });
                  },
 
                ),
                SizedBox(width: 10),
                MaterialButton(
                 minWidth: 30,
                height: 30,
                  onPressed: () {
                     setState(() {
                      widget.cup.productColor =ProductColors.NARANJA;
                     widget.cup.productPrice = widget.cup.productPriceCalculator();
                     precio = widget.cup.productPrice;
                    });
                  },
                  color: Colors.orange[200],
                  textColor: Colors.black,
                ),
                SizedBox(width: 10),
                MaterialButton(
                  minWidth: 30,
                height: 30,
                  onPressed: () {
                     setState(() {
                      widget.cup.productColor = ProductColors.NEGRO;
                     widget.cup.productPrice = widget.cup.productPriceCalculator();
                     precio = widget.cup.productPrice;
                    });
                  },
                      color: Theme.of(context).backgroundColor,
                  textColor: Colors.black,
                ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: Text(
                     
                  "💲$precio",
                  style: TextStyle(fontSize: 40),
                ),
              )
                  
               
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
                          side: BorderSide(color: Colors.black)
                          ),
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
    if(!productsencarro.contains(widget.cup.productTitle)){
    ProductItemCart producto = new ProductItemCart(productTitle: (widget.cup.productTitle), productAmount: widget.cup.productAmount, productPrice: widget.cup.productPrice, productImage: widget.cup.productImage,liked: widget.cup.liked);
    cartalista.add(producto);
    productsencarro.add(widget.cup.productTitle);
    }
  }
}

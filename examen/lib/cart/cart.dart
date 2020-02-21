import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cart/item_cart.dart';
import 'package:practica_integradora_uno/cart/pago.dart';
import 'package:practica_integradora_uno/models/product_item_cart.dart';

class Cart extends StatefulWidget {
  final List<ProductItemCart> productsList;
  Cart({
    Key key,
    @required this.productsList,
  }) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  double _total = 0;
  @override
  void initState() {
    super.initState();
    for (var item in widget.productsList) {
      _total += (item.productPrice * item.productAmount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: ListView.builder(
              itemCount: widget.productsList.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemCart(
                  onAmountUpdated: _priceUpdate,
                  product: widget.productsList[index],
                );
              },
            ),
          ),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Column(
                children: <Widget>[
                  Text("Total: ",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                  Row(
                    children: <Widget>[
                      Text("\$$_total" " MXN",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Row(children: <Widget>[
                            MaterialButton(
            height: 50.0,
            minWidth: 350.0,
            color: Theme.of(context).buttonColor,

            child: Text(
              "Pagar",
              style: TextStyle(
                  color: Theme.of(context).textSelectionColor,

              fontSize: 18,
              fontFamily: "AkzidenzGrotesk"),
            ),
            onPressed: () {
              Navigator.of(context).push(
     MaterialPageRoute(builder: (context){
       return Pago();
       
     }
    
     )
   );
            },
          ),
                  ],)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _priceUpdate(double newItemPrice) {
    setState(() {
      _total += newItemPrice;
    });
  }
}

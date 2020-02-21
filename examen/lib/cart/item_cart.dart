import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

class ItemCart extends StatefulWidget {
  final dynamic product;
  final ValueChanged<double> onAmountUpdated;
  ItemCart({
    Key key,
    @required this.onAmountUpdated,
    @required this.product,
  }) : super(key: key);

  @override
  _ItemCartState createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(24),
      color: Naranja_claro,
      child: Row(
        children: <Widget>[
          SizedBox(
            height: 12,
          ),
          Column(
            children: <Widget>[
              Image.network(
                "${widget.product.productImage}",
                height: 120,
                width: 120,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Row(children: <Widget>[
Text("${widget.product.productTitle}",
style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,
fontFamily: "OpenSans" ),),
Padding(
  padding: const EdgeInsets.fromLTRB(65, 0, 0, 0),
  child:   Icon(Icons.favorite),
),
              SizedBox(
                height: 12,
              ),
              ],),
              
              SizedBox(
                height: 12,
              ),
              Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.add_circle_outline),
                      onPressed: _addProd),
                  Text("${widget.product.productAmount}"),
                  SizedBox(
                    height: 12,
                  ),
                  IconButton(
                      icon: Icon(Icons.remove_circle), onPressed: _remProd),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "💲${widget.product.productPrice}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                          IconButton(
                            icon:Icon(Icons.restore_from_trash), onPressed: (){
                              eliminar();
                            },),

                    ],
                  )
                ],
              ),
             
              Row(
                children: <Widget>[],
              )
            ],
          ),
          
        ],
      ),
      
    );
    
  }

  void _addProd() {
    setState(() {
      ++widget.product.productAmount;
    });
    widget.onAmountUpdated(widget.product.productPrice);
  }

  void _remProd() {
    if(widget.product.productAmount >0){
       setState(() {
      --widget.product.productAmount;
    });
    widget.onAmountUpdated(-1 * widget.product.productPrice);
    }
   
  }
  void eliminar(){
    cartalista.remove(widget.product);
    productsencarro.remove(widget.product.productTitle);
    setState(() {
      widget.onAmountUpdated(-1* widget.product.productAmount * widget.product.productPrice);

    });
  }
}

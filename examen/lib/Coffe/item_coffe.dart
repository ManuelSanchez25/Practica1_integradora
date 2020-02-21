import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/Coffe/item_coffe_details.dart';
import 'package:practica_integradora_uno/models/product_grains.dart';

class Itemcoffe extends StatefulWidget {
  final ProductGrains coffe;
  Itemcoffe({
    Key key,
    @required this.coffe,
  }) : super(key: key);

  @override
  _ItemDrinksState createState() => _ItemDrinksState();
}

class _ItemDrinksState extends State<Itemcoffe> {
   Color setColor(){
    if (widget.coffe.liked ){
      return Colors.black;
    }
     else{
          return Colors.green;

     }
   
  }
    Color colorIcon = Colors.green;

  @override
  Widget build(BuildContext context) {
     return 
    GestureDetector(
      onTap:_opentitle ,
          child: Card(
        elevation: 4.0,
        margin: EdgeInsets.all(8.0),
        color:Theme.of(context).buttonColor,
        child: Row(
        //  crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(children: <Widget>[
                 Text(
                  "${widget.coffe.productTitle}",
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                               Text("💲"
                  "${widget.coffe.productPrice}",
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(fontWeight: FontWeight.bold,fontSize: 24),
                  textAlign: TextAlign.center,
                  
                ),
                
              ],
          
              ),
              flex: 2,
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5.0),
                  bottomRight: Radius.circular(5.0),
                ),
                child: Image.network(
                  "${widget.coffe.productImage}",
                  fit: BoxFit.fitHeight,
                  height: 180,
                ),
              ),
              flex: 5,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 130),
              child: IconButton(icon: Icon(Icons.favorite,
              color:setColor(),), onPressed: (){
                   Color x = setColor(); 

                   setState ( ( )  { 
                  if( x == Colors.green){
                   // colorIcon = Colors.black;
                 widget.coffe.liked =true;

                  }
                  else{
                  colorIcon = Colors.green;
                    widget.coffe.liked =false;

                  }
                } ) ; 
              }),
            ),
          ],
        ),
      ),
    );
  }
   void _opentitle() {
    // TODO: completar en navigator pasando los parametros a la pagina de DrinksPage

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ItemCoffeDetails(coffe: widget.coffe);
        },
      ),
    );
  }

  }

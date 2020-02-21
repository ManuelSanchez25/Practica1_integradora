
import 'dart:math';

import 'package:flutter/foundation.dart';

enum ProductColors {BLANCO , NEGRO, NARANJA }

class ProductCup {
  final String productTitle; // nombre del producto
  final String productDescription; // descripcion del producto
  final String productImage; // url de imagen del producto
  ProductColors productColor; // tamano del producto
  double productPrice; // precio del producto autocalculado
  final int productAmount; // cantidad de producto por comprar
  bool liked;

  ProductCup({
    @required this.productTitle,
    @required this.productDescription,
    @required this.productImage,
    @required this.productColor,
    @required this.productAmount,
    this.liked = false,
  }) {
    // inicializa el precio de acuerdo al weight del producto
    productPrice = productPriceCalculator();
  }

  double productPriceCalculator() {
    if (this.productColor == ProductColors.BLANCO)
      return (20 + Random().nextInt(40)).toDouble();
    if (this.productColor == ProductColors.NARANJA)
      return (40 + Random().nextInt(60)).toDouble();
    if (this.productColor == ProductColors.NEGRO)
      return (60 + Random().nextInt(80)).toDouble();
    return 9999.0;
  }
}

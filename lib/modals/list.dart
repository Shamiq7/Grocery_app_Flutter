import 'package:flutter/cupertino.dart';
import 'package:grocery_app_flutter/modals/homescreenpgmodals.dart';

final List<Productcards> Productcard = [
  Productcards(
    desc: 'Bread',
    img: Image.asset('images/bread.png'),
    price: '\$20',
    weight: '100g',
  ),
  Productcards(
    desc: 'Toothpaste',
    img: Image.asset('images/pic12.png'),
    price: '\$38',
    weight: '290g',
  ),
  Productcards(
    desc: 'Milk Products',
    img: Image.asset('images/milk.png'),
    price: '\$19',
    weight: '500ml',
  ),
  Productcards(
    desc: 'Soap',
    img: Image.asset('images/soap.png'),
    price: '\$29',
    weight: '500g',
  ),
];

final List<Productcards> product2 = [
  Productcards(
    desc: 'cheeky manderin',
    img: Image.asset('images/pic7.png'),
    price: '\$66',
    weight: '100g',
  ),
  Productcards(
    desc: 'Devious Apple',
    img: Image.asset('images/pic8.png'),
    price: '\$80',
    weight: '200g',
  ),
  Productcards(
    desc: 'Suspicious banana',
    img: Image.asset('images/banana.png'),
    price: '\$29',
    weight: '250g',
  ),
  Productcards(
    desc: 'Juicy Tomatoes',
    img: Image.asset('images/tomato.png'),
    price: '\$39',
    weight: '200g',
  ),
  Productcards(
    desc: 'Money Avacado',
    img: Image.asset('images/avacado.png'),
    price: '\$240',
    weight: '300g',
  ),
  Productcards(
    desc: 'Carrot Gang',
    img: Image.asset('images/carrot.png'),
    price: '\$15',
    weight: '100g',
  ),
  Productcards(
    desc: 'Strawberries',
    img: Image.asset('images/strawberries.png'),
    price: '\$39',
    weight: '200g',
  ),
];

final List<Productcards> product3 = [
  Productcards(
    desc: 'Colgate',
    img: Image.asset('images/colgate.png'),
    price: '\$39',
    weight: '500g',
  ),
  Productcards(
    desc: 'Tide',
    img: Image.asset('images/tide.png'),
    price: '\$59',
    weight: '900g',
  ),
  Productcards(
    desc: 'Dettol',
    img: Image.asset('images/dettol.png'),
    price: '\$50',
    weight: '300 g',
  ),
];

final allProduct = [...Productcard, ...product2, ...product3];

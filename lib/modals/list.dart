import 'package:flutter/cupertino.dart';
import 'package:grocery_app_flutter/modals/homescreenpgmodals.dart';

final List<Productcards> Productcard = [
  Productcards(
    desc: 'Organic Brocclie',
    img: Image.asset('images/picc2.png'),
    price: '\$20',
    weight: '20g',
  ),
  Productcards(
    desc: 'Fresh Apples',
    img: Image.asset('images/pic3.png'),
    price: '\$38',
    weight: '30g',
  ),
  Productcards(
    desc: 'Bright Mangoes',
    img: Image.asset('images/pic4.png'),
    price: '\$10',
    weight: '17g',
  ),
  Productcards(
    desc: 'Fresh Veggies',
    img: Image.asset('images/pic5.png'),
    price: '\$70',
    weight: '120g',
  ),
  Productcards(
    desc: 'Amazing Bananas',
    img: Image.asset('images/pic6.png'),
    price: '\$80',
    weight: '200g',
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
    img: Image.asset('images/pic9.jpg'),
    price: '\$29',
    weight: '250g',
  ),
];

final List<Productcards> product3 = [
  Productcards(
    desc: 'Diabatic Cake',
    img: Image.asset('images/pic10.jpg'),
    price: '\$100',
    weight: '1 pound',
  ),
  Productcards(
    desc: 'Slippery Soap',
    img: Image.asset('images/pic11.jpg'),
    price: '\$66',
    weight: '100g',
  ),
  Productcards(
    desc: 'Mind Toothpaste',
    img: Image.asset('images/pic12.png'),
    price: '\$50',
    weight: '500 g',
  ),
];

final allProduct = [...Productcard, ...product2, ...product3];

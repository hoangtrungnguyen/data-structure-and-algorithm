import 'package:data_structure_and_algorithm/cart_view/cart_view.dart';
import 'package:test/test.dart';

List<Product> products = [
  Product(id: 0, name: 'name 0', price: 100),
  Product(id: 1, name: 'name 1', price: 120),
  Product(id: 2, name: 'name 2', price: 800),
  Product(id: 3, name: 'name 3', price: 855),
  Product(id: 4, name: 'name 4', price: 970),
  Product(id: 5, name: 'name 5', price: 1280),
];

void main() {
  group('''
  CASE 1
  
  Initial cart:
  0. product 0
  1. product 1
  2. product 2
  ''', () {
    late CartView cartView;

    setUp(() {
      cartView = CartView(cartItems: [
        ProductCartItem(index: 0, product: products[0]),
        ProductCartItem(index: 1, product: products[1]),
        ProductCartItem(index: 2, product: products[2]),
      ]);
    });

    tearDown(() {
      cartView = CartView(cartItems: [
        ProductCartItem(index: 0, product: products[0]),
        ProductCartItem(index: 1, product: products[1]),
        ProductCartItem(index: 2, product: products[2]),
      ]);
    });

    test('''
  # Data
    - 
  # Steps
    1. coupon1.is_multiple_product = false ( coupon )
  # Expect
  ''', () {


    });

    test('''
  # Data
    - 
  # Steps
    1. coupon1.is_multiple_product = true
  # Expect
  ''', () {


    });

    test('''
  # Data
    * coupon 1:
       - is_multiple_product = false
       - 
    * coupon 2:  
       - is_multiple_product = false
  # Steps
    1. coupon1.is_multiple_product = false ( coupon )
    2. coupon2.is_multiple_product = false
  # Expect
  ''', () {


    });

    test('''
  # Steps
    1. coupon1.is_multiple_product = false
    2. coupon2.is_multiple_product = true
  # Expect
  
  ''', () {});

    test('''
  # Steps
    1. coupon1.is_multiple_product = true
    2. coupon2.is_multiple_product = true
  # Expect
    1. 
  ''', () {});
  });
}

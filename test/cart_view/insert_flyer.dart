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

void main(){

  test("empty cart", (){

  });

  group('''
  * Initial
    - Empty cart
  * Step
    1. Add flyer
    2. Add product 
  ''', (){

    test('''
    1. add flyer a
    ''', (){
       final CartView cartView = CartView(cartItems: []);
       cartView.addFlyer(Flyer(id: 9, discountValue: 10, productId: 10, template: 'a'));
       expect(cartView.cartItems[0], isA<TemplateFlyerCartItem>());
    });
    test('''
    1. add flyer a
    1. add flyer b
    ''', (){
      final CartView cartView = CartView(cartItems: []);
      cartView.addFlyer(Flyer(id: 9, discountValue: 10, productId: 10, template: 'a'));
      cartView.addFlyer(Flyer(id: 90, discountValue: 10, productId: 10, template: 'b'));

      expect(cartView.cartItems[0], isA<TemplateFlyerCartItem>());
      expect(cartView.cartItems[1], isA<TemplateFlyerCartItem>());
    });

    test('''
    1. add product 
    2. add flyer
    ''', (){
      final CartView cartView = CartView(cartItems: []);
      cartView.addProduct(products[5]);
      cartView.addFlyer(Flyer(id: 9, discountValue: 10, productId: 5, template: 'a'));
      expect(cartView.cartItems[0], isA<FlyerCartItem>());
      expect(cartView.cartItems[1], isA<ProductCartItem>());
    });
  });

  // 1 flyer
  group('Cart does not have product for flyers', (){
    late CartView cartView;

    setUp(() {
      cartView = CartView(cartItems: [
        ProductCartItem(index: 0, product: products[0]),
        ProductCartItem(index: 1, product: products[1]),
        ProductCartItem(index: 2, product: products[2]),
      ]);
    });

    test('case 1', (){
      cartView.addFlyer(Flyer(id: 9, discountValue: 10, productId: 10, template: 'a'));
      expect(cartView.cartItems[3], isA<TemplateFlyerCartItem>());
      print(cartView);
    });
    test('case 2', (){
      cartView.addFlyer(Flyer(id: 9, discountValue: 10, productId: 12, template: 'a'));
      cartView.addFlyer(Flyer(id: 8, discountValue: 10, productId: 12, template: 'a'));
      expect(cartView.cartItems[3], isA<TemplateFlyerCartItem>());
      print(cartView);
    });
  });

}
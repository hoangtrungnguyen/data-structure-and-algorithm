import 'dart:collection';

import 'package:uuid/v4.dart';

void main() {
  final p = Product(id: 4, price: 870, name: 'name 1237');
  final cartItems = <CartItem>[
    ProductCartItem(
        index: 0, product: Product(id: 23, price: 1823, name: 'name1')),
    ProductCartItem(
        index: 1, product: Product(id: 1, price: 700, name: 'name34')),
    ProductCartItem(
        index: 2, product: Product(id: 3, price: 140, name: 'name 892')),
    ProductCartItem(index: 2, product: p),
    ProductCartItem(
        index: 3, product: Product(id: 3, price: 140, name: 'name 892')),
    ProductCartItem(index: 4, product: p)
  ];
  matchIndex(cartItems);

  final cartView = CartView(cartItems: cartItems);

  cartView.addFlyer(Flyer(
    id: 12,
    discountValue: 20,
    productId: 4, template: 'a',
  ));
  print('***************');

  cartView.addFlyer(Flyer(
    id: 9,
    discountValue: 12,
    productId: 4, template: 'a',
  ));
  print('***************');

  cartView.addFlyer(Flyer(
    id: 19,
    discountValue: 23,
    productId: 100, template: 'b',
  ));

  print('***************');
  cartView.addFlyer(Flyer(
    id: 4,
    discountValue: 23,
    productId: 100, template: 'b',
  ));

  print('***************');


  cartView.addFlyer(Flyer(
    id: UuidV4().hashCode,
    discountValue: 56,
    productId: 3, template: 'b',
  ));

  cartView.addFlyer(Flyer(
    id: UuidV4().hashCode,
    discountValue: 40,
    productId: 3, template: 'b',
  ));

  print('***************');


  print('Cart View');
  print(cartView.cartItems.join('\n'));
}

class CartView {
  List<CartItem> cartItems;

  CartView({
    required this.cartItems,
  });

  final Set<Flyer> _cachedFlyer = {};

  void addCoupon(Coupon coupon){

  }

  void addFlyer(Flyer flyer) {
    // 0. Add new flyer to the cache
    _cachedFlyer.add(flyer);
    print(_cachedFlyer);
    // Clear all flyer and flyer template from the CartView.cartItems.
    cartItems.removeWhere((element) => element is FlyerCartItem);
    // 1. select all flyers in the cache for a product item
    // chose flyer base on their priority
    HashMap<Product, Flyer> map = prioritizeFlyer();

    _insertFlyerToCart(map);

    matchIndex(cartItems);

    handleTemplate(map);

    print(cartItems);
  }

  void _insertFlyerToCart(HashMap<Product, Flyer> map) {
    for (final p in map.keys) {
      final indexes = [];
      for (int i = 0; i < cartItems.length; i++) {
        if ((cartItems[i] is ProductCartItem) &&
            (cartItems[i] as ProductCartItem).product.id == p.id) {
          indexes.add(i);
        }
      }
      print('indexes: $indexes');
      int sizeBuffer = 0;
      for (int j in indexes) {
        cartItems.insert(
            j + sizeBuffer,
            FlyerCartItem(
                index: j + sizeBuffer,
                flyer: map[p]!,
                pIndex: j + sizeBuffer + 1));

        sizeBuffer += 1;
      }
    }
  }

  HashMap<Product, Flyer> prioritizeFlyer() {
    HashMap<Product, Flyer> map = HashMap();
    final products =
        Set.of(cartItems.whereType<ProductCartItem>().map((e) => e.product));
    for (final p in products) {
      final applyFlyers =
          _cachedFlyer.where((element) => element.productId == p.id).toList();
      if (applyFlyers.isEmpty) continue;
      final flyer = applyFlyers
          .reduce(((a, b) => a.discountValue > b.discountValue ? a : b));
      map[p] = flyer;
    }
    return map;
  }

  void handleTemplate(HashMap<Product, Flyer> map) {
    final templates = _cachedFlyer.map((e) => e.template);
    for(final t in templates) {
      if(map.values.map((e) => e.template).contains(t)){
        cartItems.removeWhere((element) => (element is TemplateFlyerCartItem) && element.template == t);
      } else {
        cartItems.add(TemplateFlyerCartItem(index: -1, template: t));
      }
    }
    matchIndex(cartItems);
  }

  void addProduct(Product product) {
    cartItems.insert(0, ProductCartItem(index: 0, product: product));
    matchIndex(cartItems);
  }
}

void matchIndex(List<CartItem> cartItems) {
  print('matchIndex');
  for (int i = 0; i < cartItems.length; i++) {
    cartItems[i].setIndex(i);
  }
  print(cartItems.length);
}

class Product implements Comparable<Product> {
  int id;
  int price;
  String name;

  Product({
    required this.id,
    required this.price,
    required this.name,
  });

  @override
  int compareTo(Product other) {
    return price.compareTo(other.price);
  }

  @override
  String toString() {
    return 'Product{id: $id, price: $price, name: $name}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          price == other.price &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ price.hashCode ^ name.hashCode;
}

class Flyer {
  int id;
  int discountValue;
  int productId;
  String template;

  Flyer({
    required this.id,
    required this.discountValue,
    required this.productId,
    required this.template,
  });

  @override
  String toString() {
    return 'Flyer{id: $id, discountValue: $discountValue, productId: $productId, template:$template}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Flyer &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          discountValue == other.discountValue &&
          productId == other.productId;

  @override
  int get hashCode => id.hashCode ^ discountValue.hashCode ^ productId.hashCode;
}

abstract class CartItem {
  abstract int index;

  int quantity = 1;

  void setIndex(int index) {
    this.index = index;
  }
}

class FlyerCartItem extends CartItem {
  int index;
  Flyer flyer;
  int pIndex;

  FlyerCartItem({
    required this.index,
    required this.flyer,
    required this.pIndex,
  });

  @override
  String toString() {
    return 'FlyerCartItem{index: $index, flyer: $flyer, pIndex: $pIndex}';
  }
}

class ProductCartItem extends CartItem {
  int index;
  Product product;

  ProductCartItem({
    required this.index,
    required this.product,
  });

  @override
  String toString() {
    return 'ProductCartItem{index: $index, product: $product}';
  }
}

class TemplateFlyerCartItem extends CartItem {
  int index;
  String template;

  TemplateFlyerCartItem({
    required this.index,
    required this.template,
  });

  @override
  String toString() {
    return 'TemplateFlyerCartItem{index: $index, template:$template}';
  }
}

class CouponCartItem extends CartItem{
  @override
  int index;
  Coupon coupon;
  int pIndex;

  CouponCartItem({
    required this.index,
    required this.coupon,
    required this.pIndex,
  });

  @override
  String toString() {
    return 'CouponCartItem{index: $index, coupon: $coupon, pIndex: $pIndex}';
  }
}

class Coupon{
  int id;
  int amount;
  List<int> productIds;
  bool isMultipleProduct;

  Coupon({
    required this.id,
    required this.amount,
    required this.productIds,
    required this.isMultipleProduct,
  });

}

class _Pair implements Comparable<_Pair> {
  Product product;
  Flyer flyer;

  _Pair(this.product, this.flyer);

  int get totalDiscount =>
      (product.price * ((100 + flyer.discountValue) / 100)).toInt();

  @override
  int compareTo(_Pair other) {
    return totalDiscount.compareTo(other.totalDiscount);
  }
}

typedef _PairComparator = int Function(_Pair a, _Pair b);


import 'package:ecommerce_app_demo/src/model/cart.dart';
import 'package:ecommerce_app_demo/src/model/products.dart';
import 'package:velocity_x/velocity_x.dart';

class Store extends VxStore {
 late ProductModel product;
 late Cart cart;

  Store() {
    product = ProductModel();
    cart = Cart();
    cart.product = product;
  }
}
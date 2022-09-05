import 'package:ecommerce_app_demo/src/model/products.dart';

class Cart {
  
  late ProductModel _product;

  // store Ids

  List<int> itemIds=[];

  // Get product
  // ignore: unnecessary_getters_setters
  ProductModel get product => _product;

  set product(ProductModel newProduct) {

    _product = newProduct;
  }

  // get cart item

  List<Item> get items => itemIds.map((id) => _product.getById(id)).toList();

  // total price
  num get totalPrice=> items.fold(0, (total, current) => total+current.price);

  // add item to cart


  void removed(Item item){
    itemIds.remove(item.id);
  }
}
import 'package:ecommerce_app_demo/src/model/products.dart';

class Cart {

 static final cart = Cart._internel();

 Cart._internel();

 factory Cart()=>cart;

  late ProductModel _product;

  // store Ids

  List<int> itemIds=[];

  // Get product
  ProductModel get product => _product;

  set product(ProductModel newProduct) {

    _product = newProduct;
  }

  // get cart item

  List<Item> get items => itemIds.map((id) => _product.getById(id)).toList();

  // total price
  num get totalPrice=> items.fold(0, (total, current) => total+current.price);

  // add item to cart

  void add(Item item){
    itemIds.add(item.id);
  }

  void removed(Item item){
    itemIds.remove(item.id);
  }
}
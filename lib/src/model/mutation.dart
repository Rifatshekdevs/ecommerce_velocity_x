import 'package:ecommerce_app_demo/src/config/store.dart';
import 'package:ecommerce_app_demo/src/model/products.dart';
import 'package:velocity_x/velocity_x.dart';

class AddMutation extends VxMutation<Store> {
  final Item item;
  AddMutation(this.item);

  @override
  perform() {
    store!.cart.itemIds.add(item.id);
  }
}
class RemovedMutation extends VxMutation<Store> {
  final Item item;
  RemovedMutation(this.item);

  @override
  perform() {
    store!.cart.itemIds.remove(item.id);
  }
}
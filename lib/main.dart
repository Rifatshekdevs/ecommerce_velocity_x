import 'package:ecommerce_app_demo/src/app.dart';
import 'package:ecommerce_app_demo/src/config/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(
    store: Store(),
    child: App()));
}
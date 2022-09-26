// ignore_for_file: deprecated_member_use

import 'package:ecommerce_app_demo/src/config/constants.dart';
import 'package:ecommerce_app_demo/src/config/store.dart';
import 'package:ecommerce_app_demo/src/model/mutation.dart';
import 'package:ecommerce_app_demo/src/model/cart.dart';
import 'package:ecommerce_app_demo/src/model/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item item;
   AddToCart({
 required this.item
   
  });

  @override
  Widget build(BuildContext context) {
    VxState.watch(context,on: [AddMutation,RemovedMutation]);
   final Cart _cart= (VxState.store as Store).cart;
    bool isInCart = _cart.items.contains(item) ?? false;
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(item);
          // setState(() {});
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.iconThemeColor),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          )),
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
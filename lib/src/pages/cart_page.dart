import 'package:ecommerce_app_demo/src/config/constants.dart';
import 'package:ecommerce_app_demo/src/config/ktext.dart';
import 'package:ecommerce_app_demo/src/model/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: "Cart".text.black.make(),
        iconTheme: IconThemeData(color: AppColors.iconThemeColor),
        elevation: 0,
        leading: IconButton(icon:Icon(CupertinoIcons.back), onPressed: () { 
          Get.back();
         },),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      final cart = Cart();

    return SizedBox(
      height: 150,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            KText(
              text: '\$${cart.totalPrice}',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.iconThemeColor,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    AppColors.iconThemeColor,
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  )),
              child: "Buy".text.make(),
            ),
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  @override
  __CartListState createState() => __CartListState();
}

class __CartListState extends State<_CartList> {

  final cart = Cart();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: () {},
        ),
        title: "Item 1".text.make(),
      ),
    );
  }
}

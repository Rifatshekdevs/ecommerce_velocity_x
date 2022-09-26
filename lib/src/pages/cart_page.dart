import 'package:ecommerce_app_demo/src/config/constants.dart';
import 'package:ecommerce_app_demo/src/config/ktext.dart';
import 'package:ecommerce_app_demo/src/config/store.dart';
import 'package:ecommerce_app_demo/src/model/cart.dart';
import 'package:ecommerce_app_demo/src/model/mutation.dart';
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
   final Cart cart= (VxState.store as Store).cart;

    return SizedBox(
      height: 150,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            VxBuilder(
              
              mutations: {RemovedMutation},
             builder: (context, store, status) {
               return KText(
              text: '\$${cart.totalPrice}',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.iconThemeColor,
            );
             },
              ),
            
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: KText(text: 'Buying not supported yet',color: Colors.red,)));
              },
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

class _CartList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemovedMutation]);
     final Cart cart= (VxState.store as Store).cart;


    return cart.items.isEmpty? Center(child: KText(text: 'No data added')): ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: () {
            RemovedMutation(cart.items[index]);
            // setState(() {
              
            // });
          },
        ),
        title: cart.items[index].name.text.make(),
      ),
    );
  }
}

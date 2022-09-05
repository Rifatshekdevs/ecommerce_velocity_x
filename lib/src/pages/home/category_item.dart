import 'package:ecommerce_app_demo/src/config/constants.dart';
import 'package:ecommerce_app_demo/src/model/products.dart';
import 'package:ecommerce_app_demo/src/pages/home/add_to_cart.dart';
import 'package:ecommerce_app_demo/src/pages/home/category_image.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogItem extends StatelessWidget {
  final Item product;
  CatalogItem({required this.product});

  @override
  Widget build(BuildContext context) {

    return VxBox(
      child: Card(
        color: HexColor('#EFF9FB'),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Hero(
              tag: Key(product.id.toString()),
              child: CatalogImage(
                image: product.image,
              ),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                product.name.text.lg
                    .color(AppColors.iconThemeColor)
                    .bold
                    .make(),
             product.desc.text.textStyle(context.captionStyle).make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${product.price}".text.bold.xl.make(),
                    AddToCart(item: product),
                  ],
                ).pOnly(right: 8.0),
              ],
            ))
          ],
        ),
      ),
    ).white.rounded.square(150).make().py16();
  }
}

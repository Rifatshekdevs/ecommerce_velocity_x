import 'package:ecommerce_app_demo/src/config/constants.dart';
import 'package:ecommerce_app_demo/src/model/cart.dart';
import 'package:ecommerce_app_demo/src/model/products.dart';
import 'package:ecommerce_app_demo/src/pages/home/category_image.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogItem extends StatefulWidget {
  final Item product;

  CatalogItem({required this.product});

  @override
  State<CatalogItem> createState() => _CatalogItemState();
}

class _CatalogItemState extends State<CatalogItem> {

  bool isAdded = false;
  Widget build(BuildContext context) {
    return VxBox(
      child: Card(
        color: HexColor('#EFF9FB'),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Hero(
              tag: Key(widget.product.id.toString()),
              child: CatalogImage(
                image: widget.product.image,
              ),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.product.name.text.lg
                    .color(AppColors.iconThemeColor)
                    .bold
                    .make(),
                widget.product.desc.text.textStyle(context.captionStyle).make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${widget.product.price}".text.bold.xl.make(),
                    ElevatedButton(
                      onPressed: () {
                        isAdded= isAdded.toggle();
                        final _product= ProductModel();
                        final _cart = Cart();
                        _cart.product= _product;
                        _cart.add(widget.product);
                        setState(() {
                          
                        });
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            AppColors.iconThemeColor,
                          ),
                          shape: MaterialStateProperty.all(
                            StadiumBorder(),
                          )),
                      child:isAdded? Icon(Icons.done): "Add to cart".text.make(),
                    )
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

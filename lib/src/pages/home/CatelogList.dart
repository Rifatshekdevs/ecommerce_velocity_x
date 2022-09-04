import 'package:ecommerce_app_demo/src/model/products.dart';
import 'package:ecommerce_app_demo/src/pages/home/category_item.dart';
import 'package:ecommerce_app_demo/src/pages/home/details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: ProductModel.items!.length,
      itemBuilder: (context, index) {
        final product = ProductModel.items![index];
        return GestureDetector(
          onTap: (){
            Get.to(DetailsPage(product: product,));
          },
          child: CatalogItem(product: product),
          );
      },
    );
  }
}
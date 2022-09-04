import 'package:ecommerce_app_demo/src/config/constants.dart';
import 'package:ecommerce_app_demo/src/model/products.dart';
import 'package:ecommerce_app_demo/src/pages/cart_page.dart';
import 'package:ecommerce_app_demo/src/pages/home/CatelogList.dart';
import 'package:ecommerce_app_demo/src/pages/home/catelog_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert';

import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/file/product.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    ProductModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.iconThemeColor,
        onPressed: (){
          Get.to(CartPage());
        },
        child: Icon(CupertinoIcons.cart),
        ),
        backgroundColor : AppColors.scaffoldBackgroundColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (ProductModel.items != null && ProductModel.items!.isNotEmpty)
                  CatalogList().expand()
                else
                  CircularProgressIndicator().centered().p16()
              ],
            ),
          ),
        ));
  }
}







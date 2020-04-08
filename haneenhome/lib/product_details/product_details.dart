import 'package:flutter/material.dart';
import 'package:haneenhome/component/themeData.dart';
import 'package:haneenhome/product_details/product_detailsMain.dart';
import 'package:sweets/pages/tabViewBar.dart';
import 'package:sweets/pages/tabViewBar.dart';
import 'package:sweets/pages/tabViewBar.dart';
import 'package:sweets/product_details/product_ingredients.dart';
import 'package:sweets/product_details/product_ingredients.dart';

import '../themeData.dart';
import 'ProductDetail.dart';
import 'product_ingredients.dart';

class ProductDetailsMainScreen extends StatefulWidget {
  static const String id = 'product_details_main_screen';

  @override
  _ProductDetailsMainScreenState createState() =>
      _ProductDetailsMainScreenState();
}

class _ProductDetailsMainScreenState extends State<ProductDetailsMainScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kMainPurpleColorUsed,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'تفاصيل المنتج',
            style: kTitleWhiteTextStyle,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.star,
                size: 25,
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height * 0.1),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.white),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: TabBar(
                        unselectedLabelColor: Colors.blueGrey,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.redAccent),
                        tabs: [
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "تفاصيل",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                          ),
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "المقادير",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                          ),
//                          Tab(
//                            child: Align(
//                              alignment: Alignment.center,
//                              child: Text(
//                                "تعليقات",
//                                style: TextStyle(
//                                    fontWeight: FontWeight.bold, fontSize: 15),
//                              ),
//                            ),
//                          ),
                        ]),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: TabBarView(children: [
            ProductDetails(),
            ProductIngredients(),
            TabViewBar(),
//            ProductComments(),
          ]),
        ),
      ),
    );
  }
}

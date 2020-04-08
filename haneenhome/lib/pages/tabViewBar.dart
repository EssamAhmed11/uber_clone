import 'package:flutter/material.dart';
import 'package:sweets/models/product_model.dart';
import 'package:sweets/pages/CommentCard.dart';
import 'package:sweets/product_details/ProductDetail.dart';
import 'package:sweets/product_details/product_ingredients.dart';
import 'package:sweets/themeData.dart';
import 'package:sweets/utils/apiProvider.dart';

class TabViewBar extends StatefulWidget {
  static const String id = 'commentPage';

  int productId;

  TabViewBar({this.productId});

  @override
  _TabViewBarState createState() => _TabViewBarState();
}

class _TabViewBarState extends State<TabViewBar> {
  ProductModel productDetails;

  getProduct(int productId) async {
    productDetails = await ApiProvide().showProduct(productId);
  }

  @override
  void initState() {
    super.initState();
    getProduct(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
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
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.white),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    unselectedLabelStyle: kTitleWhiteTextStyle,
                    unselectedLabelColor: Color(0xFF979797),
                    labelColor: Colors.white,
                    labelStyle: kTitleWhiteTextStyle,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kRedTabColor),
                    tabs: <Widget>[
                      Tab(
                        child: Text(
                          "تفاصيل",
                        ),
                      ),
                      Tab(
                        child: Text(
                          "المقادير",
                        ),
                      ),
                      Tab(
                        child: Text(
                          "تعليقات",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: TabBarView(
              children: [
                ProductDetails(),
                ProductIngredients(),
                CommentCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sweets/component/FavouriteButton.dart';
import 'package:sweets/component/productcards.dart';
import 'package:sweets/component/reviewButton.dart';
import 'package:sweets/models/product_model.dart';
import 'package:sweets/themeData.dart';
import 'package:sweets/utils/apiProvider.dart';

class ProductDetails extends StatefulWidget {
  static const String id = 'productDetail';

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int _current = 0;
  bool isLoading = true;

  static final List<String> imgList = [
    'assets/images/tart.jpg',
    'assets/images/tart.jpg',
    'assets/images/tart.jpg',
    'assets/images/tart.jpg',
    'assets/images/tart.jpg',
  ];

  final List child = map<Widget>(
    imgList,
    (index, i) {
      return Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          child: Stack(children: <Widget>[
            Image.asset(i, fit: BoxFit.cover, width: 350.0),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          ]),
        ),
      );
    },
  ).toList();

  static List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  List<ProductModel> productList;

  getProducts() async {
    productList = await ApiProvide().getProducts();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.grey[200],
            body: isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: productList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Container(
                                height: 100,
                                width: MediaQuery.of(context).size.width,
                                color: kMainPurpleColorUsed,
                              ),
                              Column(
                                children: <Widget>[
                                  CarouselSlider(
                                    items: child,
                                    autoPlay: false,
                                    aspectRatio: 2.0,
                                    enlargeCenterPage: true,
                                    viewportFraction: 1.0,
                                    onPageChanged: (index) {
                                      setState(() {
                                        _current = index;
                                      });
                                    },
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: map<Widget>(
                                      imgList,
                                      (index, url) {
                                        return Container(
                                          width: 8.0,
                                          height: 8.0,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 5.0),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: _current == index
                                                  ? kRedTabColor
                                                  : KGreyDarkColorUsed),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      FavouriteButton(
                                        onPressed: () {
                                          print('Test Favorite');
                                        },
                                      ),
                                      Text(
                                        '235',
                                        style: kSubTitleBlackTextStyle,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        '${productList[index].title}',
                                        style: kTitleBlackTextStyle,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15),
                                        child: Text(
                                          '${productList[index].category}',
                                          style: kSubTitleBlackTextStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Divider(
                                height: 1,
                                thickness: 1,
                                indent: 15,
                                endIndent: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 15.0),
                                    child: Text(
                                        'ريال' + '${productList[index].price}',
                                        style: kBodyTextStyle.copyWith(
                                            color: Colors.red)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 35.0),
                                    child: Container(
                                      width: 1,
                                      height: 30,
                                      color: Color(0xffD8D8D8),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 4.0),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          '4.5',
                                          style: kSubTitleBlackTextStyle,
                                        ),
                                        ReviewButton(
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 1,
                                    height: 30,
                                    color: Color(0xffD8D8D8),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            'فهد محمد',
                                            style: kSubTitleBlackTextStyle,
                                          ),
                                          Text(
                                            'الرياض',
                                            style: kCityTextStyle.copyWith(
                                                fontSize: 12),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CircleAvatar(
                                          radius: 20,
                                          backgroundImage: AssetImage(
                                              'assets/images/Oval.png'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20, left: 30),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Text(
                                "${productList[index].title}",
                                overflow: TextOverflow.ellipsis,
                                textDirection: TextDirection.rtl,
                                style: kBodyBlackTextStyle,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20, top: 10),
                            child: Text(
                              'منتجات مشابهة',
                              style: kTitleBlackTextStyle,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.30,
                            width: MediaQuery.of(context).size.width,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 9.0, right: 9.0),
                                  child: Productcard(),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 9.0, right: 9.0),
                                  child: Productcard(),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 9.0, right: 9.0),
                                  child: Productcard(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 9.0, right: 9.0),
                                  child: Productcard(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 9.0, right: 9.0),
                                  child: Productcard(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    })),
      ),
    );
  }
}

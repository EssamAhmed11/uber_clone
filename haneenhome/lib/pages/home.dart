import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:sweets/component/cardAlbum.dart';
import 'package:sweets/component/upperListViewCard.dart';
import 'package:sweets/models/product_model.dart';
import 'package:sweets/pages/notMyCard/homegrid.dart';
import 'package:sweets/pages/search_screen.dart';
import 'package:sweets/pages/tabViewBar.dart';
import 'package:sweets/themeData.dart';
import 'package:sweets/utils/apiProvider.dart';

import '../component/reviewButton.dart';
import '../themeData.dart';

class Home extends StatefulWidget {
  static const String id = 'home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  bool isList = true;
  bool isSelected = false;
  bool isLoading = true;
  int range = 0;
  double _lowerValue = 50;
  double _upperValue = 180;

  //------------------------------------
  // This is list for filter screen
  // ----------------------------------
  List<String> SortingOption = [
    'أعلى التقييمات',
    'الأقرب لي',
    'التكلفة من الأعلى إلى الأقل',
    'التكلفة من منخفضة إلى عالية',
  ];

  Widget _widget() {
    if (_selectedIndex == 0)
      return Home();
    else if (_selectedIndex == 1)
      return HomeGrid();
    else if (_selectedIndex == 2) return TabViewBar();
  }

  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

/* created new list inside UI to receive data from our DB */
  List<ProductModel> productList;

  //ProductModel product;

  /* Method to get the data from API provider to our main UI */

  getProducts() async {
    productList = await ApiProvide().getProducts();
    isLoading = false;
    setState(() {});
  }

  /* initial state for our data received from DB*/

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kMainPurpleColorUsed,
          appBar: AppBar(
            backgroundColor: kMainPurpleColorUsed,
            centerTitle: true,
            elevation: 0,
            title: Hero(
              tag: 'logo',
              child: Image.asset(
                'assets/images/bz.png',
                scale: 3,
              ),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.search,
                size: 30,
              ),
              onPressed: () {
                Navigator.pushNamed(context, SearchScreen.id);
                print('Search is working');
              },
            ),
          ),
          body: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      //TODO: avoid overflowed pixel error (need help here!)
                      floating: true,
                      expandedHeight: 150.0,
                      backgroundColor: kMainPurpleColorUsed,
                      flexibleSpace: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            UpperListViewCard(
                              backGroundImage:
                                  AssetImage('assets/images/alldish.jfif'),
                              nameOfCard: 'الكل',
                              onTap: () {
                                //TODO: Change to corresponding action
                                print('List view link is working');
                              },
                            ),
                            UpperListViewCard(
                              backGroundImage:
                                  AssetImage('assets/images/Chinese_image.png'),
                              nameOfCard: 'كيكات',
                              onTap: () {
                                //TODO: Change to corresponding action
                                print('List view link is working');
                              },
                            ),
                            UpperListViewCard(
                              backGroundImage:
                                  AssetImage('assets/images/French_image.png'),
                              nameOfCard: 'براونيز',
                              onTap: () {
                                //TODO: Change to corresponding action
                                print('List view link is working');
                              },
                            ),
                            UpperListViewCard(
                              backGroundImage:
                                  AssetImage('assets/images/Indian_image.png'),
                              nameOfCard: 'حلويات',
                              onTap: () {
                                //TODO: Change to corresponding action
                                print('List view link is working');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30)),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.grey[200],
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(right: 7),
                                      child: Text(
                                        //TODO: need here to separate between number and word
                                        'منتج 56 ',
                                        style: kTitleBlackTextStyle,
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        isList == true
                                            ? InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    isList = false;
                                                  });
                                                },
                                                child: Image.asset(
                                                  'assets/images/list.png',
                                                  scale: 3.5,
                                                ),
                                              )
                                            : InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    isList = true;
                                                  });
                                                },
                                                child: Image.asset(
                                                  'assets/images/grid.png',
                                                  scale: 3.5,
                                                ),
                                              ),
                                        Padding(
                                            padding: EdgeInsets.only(right: 7)),
                                        InkWell(
                                          child: Image.asset(
                                            'assets/images/sort.png',
                                            scale: 3.5,
                                          ),
                                          onTap: () {
                                            showModalBottomSheet(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)),
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Container(
                                                  padding: EdgeInsets.only(
                                                      right: 20, left: 20),
                                                  decoration: new BoxDecoration(
                                                      color: Colors.grey[200],
                                                      borderRadius: new BorderRadius
                                                              .only(
                                                          topLeft: const Radius
                                                              .circular(30.0),
                                                          topRight: const Radius
                                                              .circular(30.0))),
                                                  child: Column(
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 20,
                                                                bottom: 10),
                                                        child: Column(
                                                          children: <Widget>[
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: <
                                                                  Widget>[
                                                                InkWell(
                                                                  onTap: () {
                                                                    Navigator.pushNamed(
                                                                        context,
                                                                        Home.id);
                                                                  },
                                                                  child: Text(
                                                                      'مسح',
                                                                      style:
                                                                          kTitleBlackTextStyle),
                                                                ),
                                                                Text('فلاتر ',
                                                                    style: kTitleBlackTextStyle.copyWith(
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                                InkWell(
                                                                  onTap: () {
                                                                    Navigator.pushNamed(
                                                                        context,
                                                                        Home.id);
                                                                  },
                                                                  child: Text(
                                                                      'تنفيذ',
                                                                      style: kTitleBlackTextStyle.copyWith(
                                                                          color:
                                                                              kRedTabColor)),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Divider(
                                                        height: 1,
                                                        thickness: 1,
                                                        indent: 1,
                                                        endIndent: 1,
                                                      ),
                                                      ListView.builder(
                                                        shrinkWrap: true,
                                                        primary: false,
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        itemCount: SortingOption
                                                            .length,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return SelectedOptionOnFilter(
                                                            optionName:
                                                                '${SortingOption[index]}',
                                                            isSelected: false,
                                                            selectIsDone: 0,
                                                          );
                                                        },
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 250),
                                                        child: Text(
                                                          'السعر',
                                                          style: kCityTextStyle
                                                              .copyWith(
                                                                  fontSize: 16),
                                                        ),
                                                      ),
                                                      FlutterSlider(
                                                        values: [3000, 17000],
                                                        min: 0,
                                                        max: 25000,
                                                        step: 100,
                                                        jump: true,
                                                        rangeSlider: true,
                                                        disabled: false,
                                                        trackBar:
                                                            FlutterSliderTrackBar(
                                                          activeTrackBar:
                                                              BoxDecoration(
                                                                  color:
                                                                      KRedColorUsed),
                                                          inactiveTrackBar:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xffD0D3D9),
                                                          ),
                                                        ),
                                                        handlerAnimation:
                                                            FlutterSliderHandlerAnimation(
                                                                curve: Curves
                                                                    .elasticOut,
                                                                reverseCurve:
                                                                    Curves
                                                                        .bounceIn,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        500),
                                                                scale: 1.5),
                                                        handler:
                                                            FlutterSliderHandler(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Image.asset(
                                                            'assets/images/Scale.png',
                                                          ),
                                                        ),
                                                        rightHandler:
                                                            FlutterSliderHandler(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Image.asset(
                                                            'assets/images/Scale.png',
                                                          ),
                                                        ),
                                                        tooltip:
                                                            FlutterSliderTooltip(
                                                          textStyle:
                                                              kBodyTextStyle,
                                                          leftPrefix: Text(
                                                            'ريال',
                                                            style:
                                                                kBodyTextStyle,
                                                          ),
                                                          rightSuffix: Text(
                                                              'ريال',
                                                              style:
                                                                  kBodyTextStyle),
                                                        ),
                                                        onDragging:
                                                            (handlerIndex,
                                                                lowerValue,
                                                                upperValue) {
                                                          _lowerValue =
                                                              lowerValue;
                                                          _upperValue =
                                                              upperValue;
                                                          setState(() {});
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(right: 7)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.grey[200],
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 10, left: 5, right: 5),
                              child: isList == true
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      primary: false,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: productList.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Stack(
                                          children: <Widget>[
                                            InkWell(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            TabViewBar(
                                                                productId:
                                                                    productList[
                                                                            index]
                                                                        .id)));
                                              },
                                              child: CardAlbum(
                                                widthOfContainer:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.95,
                                                heightOfContainer:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.33,
                                                childUsedInside: Image.network(
                                                  '${productList[index].image}',
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 1,
                                              child: CardAlbum(
                                                colorOfCard: Colors.white,
                                                widthOfContainer:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.95,
                                                childUsedInside: Column(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10,
                                                              left: 10,
                                                              right: 10),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        textDirection:
                                                            TextDirection.rtl,
                                                        children: <Widget>[
                                                          Column(
                                                            textDirection:
                                                                TextDirection
                                                                    .rtl,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: <Widget>[
                                                              SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.5,
                                                                child: Text(
                                                                  '${productList[index].title}',
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style:
                                                                      kTitleBlackTextStyle,
                                                                ),
                                                              ),
                                                              Text(
                                                                '${productList[index].category}',
                                                                style:
                                                                    kSubTitleBlackTextStyle,
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            textDirection:
                                                                TextDirection
                                                                    .rtl,
                                                            children: <Widget>[
                                                              Text(
                                                                '235',
                                                                style:
                                                                    kSubTitleBlackTextStyle,
                                                              ),
                                                              IconButton(
                                                                  icon: Icon(
                                                                    Icons
                                                                        .favorite,
                                                                    color: Colors
                                                                        .red,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        'Like is working');
                                                                  })
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8,
                                                              right: 10),
                                                      child: Divider(
                                                        thickness: 1,
                                                        color:
                                                            KGreyDarkColorUsed,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        textDirection:
                                                            TextDirection.rtl,
                                                        children: <Widget>[
                                                          CircleAvatar(
                                                            radius: 25,
                                                            backgroundImage:
                                                                AssetImage(
                                                                    'assets/images/Oval.png'),
                                                          ),
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: <Widget>[
                                                              Text(
                                                                'مصطفى يونس',
                                                                style:
                                                                    kSubTitleBlackTextStyle,
                                                              ),
                                                              Text(
                                                                'الرياض',
                                                                style:
                                                                    kCityTextStyle,
                                                              ),
                                                            ],
                                                          ),
                                                          VerticalDivider(
                                                            // TODO : is not showing in the UI??!!
                                                            thickness: 5,
                                                            color: Colors.red,
                                                          ),
                                                          Image.asset(
                                                            'assets/images/star.png',
                                                            scale: 2.5,
                                                          ),
                                                          Text(
                                                            '4.5',
                                                            style:
                                                                kSubTitleBlackTextStyle,
                                                          ),
                                                          VerticalDivider(
                                                            // TODO : is not showing in the UI??!!
                                                            thickness: 5,
                                                            color:
                                                                KGreyDarkColorUsed,
                                                          ),
                                                          Text(
                                                            "${productList[index].price}" +
                                                                'ريال',
                                                            style: kBodyTextStyle
                                                                .copyWith(
                                                                    color: Colors
                                                                        .red),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    )
                                  : GridView.builder(
                                      primary: false,
                                      shrinkWrap: true,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              mainAxisSpacing: 20),
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: 5,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, TabViewBar.id);
                                          },
                                          child: Stack(
                                            alignment: Alignment.bottomCenter,
                                            children: <Widget>[
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.45,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.35,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  child: Image.network(
                                                    "${productList[index].image}",
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                              Material(
                                                elevation: 15,
                                              ),
                                              Positioned(
                                                bottom: 1,
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.45,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(10),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Text(
                                                          '${productList[index].title}',
                                                          style:
                                                              kTitleBlackTextStyle,
                                                        ),
                                                        Text(
                                                          '${productList[index].category}',
                                                          style: kCityTextStyle,
                                                        ),
                                                        Divider(
                                                          height: 1,
                                                          thickness: 1,
                                                          indent: 15,
                                                          endIndent: 15,
                                                        ),
                                                        Row(
                                                          children: <Widget>[
                                                            CircleAvatar(
                                                              radius: 15,
                                                              backgroundImage:
                                                                  AssetImage(
                                                                      'assets/images/Oval.png'),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right: 5),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: <
                                                                    Widget>[
                                                                  Text(
                                                                    'فهد محمد',
                                                                    style:
                                                                        kSubTitleBlackTextStyle,
                                                                  ),
                                                                  Text(
                                                                    'الرياض',
                                                                    style:
                                                                        kCityTextStyle,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Divider(
                                                          height: 1,
                                                          thickness: 1,
                                                          indent: 15,
                                                          endIndent: 15,
                                                        ),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 5)),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: <Widget>[
                                                            ReviewButton(),
                                                            Text(
                                                              '4.5',
                                                              style:
                                                                  kSubTitleBlackTextStyle,
                                                            ),
                                                            Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            40)),
                                                            Text(
                                                              "${productList[index].price}" +
                                                                  'ريال ',
                                                              style: kBodyTextStyle
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .red),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
//          bottomNavigationBar: BottomNavigationBar(
//            elevation: 5,
//            backgroundColor: Colors.white,
//            iconSize: 25,
//            unselectedItemColor: KGreyDarkColorUsed,
//            selectedItemColor: KRedColorUsed,
//            onTap: _onItemTapped,
//            currentIndex: _selectedIndex,
//            items: [
//              new BottomNavigationBarItem(
//                  icon: ImageIcon(
//                    AssetImage('assets/images/settings.png'),
//                  ),
//                  title: Text('الاعدادات')),
//              new BottomNavigationBarItem(
//                icon: ImageIcon(
//                  AssetImage('assets/images/CombinedShape.png'),
//                ),
//                title: Text('المفضلة'),
//              ),
//              new BottomNavigationBarItem(
//                icon: ImageIcon(
//                  AssetImage('assets/images/home.png'),
//                ),
//                title: Text('الرئيسية'),
//              ),
//            ],
//          ),
        ),
      ),
    );
  }
}

class SelectedOptionOnFilter extends StatefulWidget {
  final String optionName;
  bool isSelected;
  int selectIsDone;

  SelectedOptionOnFilter(
      {@required this.optionName,
      @required this.isSelected,
      @required this.selectIsDone});

  @override
  _SelectedOptionOnFilterState createState() => _SelectedOptionOnFilterState();
}

class _SelectedOptionOnFilterState extends State<SelectedOptionOnFilter> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
//        setState(() {
//          print('option button is working');
//        });

//        widget.isSelected == true
//            ? widget.selectIsDone = 1
//            : widget.selectIsDone = 0;
//        if (widget.selectIsDone == 1) {
//          setState(() {
//            widget.isSelected = true;
//            print('tab is working');
//          });
//        }
        widget.isSelected == false
            ? setState(() {
                widget.isSelected = true;
                widget.selectIsDone = 1;
              })
            : setState(() {
                widget.isSelected = false;
                widget.selectIsDone = 0;
              });
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 5),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                widget.isSelected == true
                    ? Icon(
                        Icons.check,
                        color: Colors.redAccent,
                        size: 30,
                      )
                    : Icon(
                        Icons.check,
                        color: Colors.white12,
                        size: 30,
                      ),
                Text(widget.optionName, style: kTitleBlackTextStyle),
//              Radio(value: null, groupValue: null, onChanged: null),
              ],
            ),
            Divider(
              height: 1,
              thickness: 1,
              indent: 5,
              endIndent: 5,
            ),
          ],
        ),
      ),
    );
  }
}

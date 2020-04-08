import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sweets/component/cardAlbum.dart';
import 'package:sweets/component/sortingIcon.dart';
import 'package:sweets/component/upperListViewCard.dart';
import 'package:sweets/pages/notMyCard/homegrid.dart';
import 'package:sweets/pages/tabViewBar.dart';
import 'package:sweets/themeData.dart';

class SliverBarCard extends StatefulWidget {
  static const String id = 'SliverBarCard';
  TabController controller;

  @override
  _SliverBarCardState createState() => _SliverBarCardState();
}

class _SliverBarCardState extends State<SliverBarCard> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            elevation: 0,
            backgroundColor: kMainPurpleColorUsed,
            centerTitle: true,
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
                print('Search is working');
              },
            ),
          ),
          body: CustomScrollView(
//            controller: ScrollController(
//                keepScrollOffset: true, initialScrollOffset: 0),
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
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 5, right: 5),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  //TODO: need here to seperate between number and word
                                  'منتج 56 ',
                                  style: kTitleBlackTextStyle,
                                ),
                                SizedBox(
                                  child: Row(
                                    textDirection: TextDirection.rtl,
                                    children: <Widget>[
                                      SortingIcon(
                                        image: AssetImage(
                                            'assets/images/Filter.png'),
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, HomeGrid.id);
                                        },
                                      ),
                                      SortingIcon(
                                        image: AssetImage(
                                            'assets/images/Sort.png'),
                                        onTap: () {
                                          //TODO: change the action
                                          print('grid view is working');
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Stack(
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, TabViewBar.id);
                                },
                                child: CardAlbum(
                                  widthOfContainer:
                                      MediaQuery.of(context).size.width * 0.95,
                                  heightOfContainer:
                                      MediaQuery.of(context).size.height * 0.40,
                                  childUsedInside: Image.asset(
                                    'assets/images/cateringimage.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 25,
                                child: CardAlbum(
                                  colorOfCard: Colors.white,
                                  widthOfContainer:
                                      MediaQuery.of(context).size.width * 0.95,
                                  heightOfContainer:
                                      MediaQuery.of(context).size.height * 0.23,
                                  childUsedInside: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 10, right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          textDirection: TextDirection.rtl,
                                          children: <Widget>[
                                            Column(
                                              textDirection: TextDirection.rtl,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  'كعكة بالمكسرات',
                                                  style: kTitleBlackTextStyle,
                                                ),
                                                Text(
                                                  'كيكات',
                                                  style: kBodyTextStyle,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              textDirection: TextDirection.rtl,
                                              children: <Widget>[
                                                Text(
                                                  '235',
                                                  style: kBodyTextStyle,
                                                ),
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.favorite,
                                                    color: Colors.red,
                                                  ),
                                                  onPressed: () {
                                                    print('Like is working');
                                                  },
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 10),
                                        child: Divider(
                                          thickness: 1,
                                          color: KGreyDarkColorUsed,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 10, right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          textDirection: TextDirection.rtl,
                                          children: <Widget>[
                                            CircleAvatar(
                                              radius: 25,
                                              backgroundImage: AssetImage(
                                                  'assets/images/Oval.png'),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  'فهد محمد',
                                                  style: kBodyTextStyle
                                                      .copyWith(fontSize: 18),
                                                ),
                                                Text(
                                                  'الرياض',
                                                  style: kBodyTextStyle,
                                                ),
                                              ],
                                            ),
                                            VerticalDivider(
                                              // TODO : is not showing in the UI??!!
                                              thickness: 5,
                                              color: Colors.red,
                                            ),
                                            FaIcon(
                                              FontAwesomeIcons.star,
                                              color: KRedColorUsed,
                                            ),
                                            Text(
                                              '4.5',
                                              style: kBodyTextStyle,
                                            ),
                                            VerticalDivider(
                                              // TODO : is not showing in the UI??!!
                                              thickness: 5,
                                              color: KGreyDarkColorUsed,
                                            ),
                                            Text(
                                              'ريال 25',
                                              style: kTitleBlackTextStyle
                                                  .copyWith(color: Colors.red),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, TabViewBar.id);
                                },
                                child: CardAlbum(
                                  widthOfContainer:
                                      MediaQuery.of(context).size.width * 0.95,
                                  heightOfContainer:
                                      MediaQuery.of(context).size.height * 0.40,
                                  childUsedInside: Image.asset(
                                    'assets/images/cateringimage.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 25,
                                child: CardAlbum(
                                  colorOfCard: Colors.white,
                                  widthOfContainer:
                                      MediaQuery.of(context).size.width * 0.95,
                                  heightOfContainer:
                                      MediaQuery.of(context).size.height * 0.23,
                                  childUsedInside: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 10, right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          textDirection: TextDirection.rtl,
                                          children: <Widget>[
                                            Column(
                                              textDirection: TextDirection.rtl,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  'كعكة بالمكسرات',
                                                  style: kTitleBlackTextStyle,
                                                ),
                                                Text(
                                                  'كيكات',
                                                  style: kBodyTextStyle,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              textDirection: TextDirection.rtl,
                                              children: <Widget>[
                                                Text(
                                                  '235',
                                                  style: kBodyTextStyle,
                                                ),
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.favorite,
                                                    color: Colors.red,
                                                  ),
                                                  onPressed: () {
                                                    print('Like is working');
                                                  },
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 10),
                                        child: Divider(
                                          thickness: 1,
                                          color: KGreyDarkColorUsed,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 10, right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          textDirection: TextDirection.rtl,
                                          children: <Widget>[
                                            CircleAvatar(
                                              radius: 25,
                                              backgroundImage: AssetImage(
                                                  'assets/images/Oval.png'),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  'فهد محمد',
                                                  style: kBodyTextStyle
                                                      .copyWith(fontSize: 18),
                                                ),
                                                Text(
                                                  'الرياض',
                                                  style: kBodyTextStyle,
                                                ),
                                              ],
                                            ),
                                            VerticalDivider(
                                              // TODO : is not showing in the UI??!!
                                              thickness: 5,
                                              color: Colors.red,
                                            ),
                                            FaIcon(
                                              FontAwesomeIcons.star,
                                              color: KRedColorUsed,
                                            ),
                                            Text(
                                              '4.5',
                                              style: kBodyTextStyle,
                                            ),
                                            VerticalDivider(
                                              // TODO : is not showing in the UI??!!
                                              thickness: 5,
                                              color: KGreyDarkColorUsed,
                                            ),
                                            Text(
                                              'ريال 25',
                                              style: kTitleBlackTextStyle
                                                  .copyWith(color: Colors.red),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, TabViewBar.id);
                                },
                                child: CardAlbum(
                                  widthOfContainer:
                                      MediaQuery.of(context).size.width * 0.95,
                                  heightOfContainer:
                                      MediaQuery.of(context).size.height * 0.40,
                                  childUsedInside: Image.asset(
                                    'assets/images/cateringimage.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 25,
                                child: CardAlbum(
                                  colorOfCard: Colors.white,
                                  widthOfContainer:
                                      MediaQuery.of(context).size.width * 0.95,
                                  heightOfContainer:
                                      MediaQuery.of(context).size.height * 0.23,
                                  childUsedInside: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 10, right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          textDirection: TextDirection.rtl,
                                          children: <Widget>[
                                            Column(
                                              textDirection: TextDirection.rtl,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  'كعكة بالمكسرات',
                                                  style: kTitleBlackTextStyle,
                                                ),
                                                Text(
                                                  'كيكات',
                                                  style: kBodyTextStyle,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              textDirection: TextDirection.rtl,
                                              children: <Widget>[
                                                Text(
                                                  '235',
                                                  style: kBodyTextStyle,
                                                ),
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.favorite,
                                                    color: Colors.red,
                                                  ),
                                                  onPressed: () {
                                                    print('Like is working');
                                                  },
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 10),
                                        child: Divider(
                                          thickness: 1,
                                          color: KGreyDarkColorUsed,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 10, right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          textDirection: TextDirection.rtl,
                                          children: <Widget>[
                                            CircleAvatar(
                                              radius: 25,
                                              backgroundImage: AssetImage(
                                                  'assets/images/Oval.png'),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  'فهد محمد',
                                                  style: kBodyTextStyle
                                                      .copyWith(fontSize: 18),
                                                ),
                                                Text(
                                                  'الرياض',
                                                  style: kBodyTextStyle,
                                                ),
                                              ],
                                            ),
                                            VerticalDivider(
                                              // TODO : is not showing in the UI??!!
                                              thickness: 5,
                                              color: Colors.red,
                                            ),
                                            FaIcon(
                                              FontAwesomeIcons.star,
                                              color: KRedColorUsed,
                                            ),
                                            Text(
                                              '4.5',
                                              style: kBodyTextStyle,
                                            ),
                                            VerticalDivider(
                                              // TODO : is not showing in the UI??!!
                                              thickness: 5,
                                              color: KGreyDarkColorUsed,
                                            ),
                                            Text(
                                              'ريال 25',
                                              style: kTitleBlackTextStyle
                                                  .copyWith(color: Colors.red),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, TabViewBar.id);
                                },
                                child: CardAlbum(
                                  widthOfContainer:
                                      MediaQuery.of(context).size.width * 0.95,
                                  heightOfContainer:
                                      MediaQuery.of(context).size.height * 0.40,
                                  childUsedInside: Image.asset(
                                    'assets/images/cateringimage.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 25,
                                child: CardAlbum(
                                  colorOfCard: Colors.white,
                                  widthOfContainer:
                                      MediaQuery.of(context).size.width * 0.95,
                                  heightOfContainer:
                                      MediaQuery.of(context).size.height * 0.23,
                                  childUsedInside: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 10, right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          textDirection: TextDirection.rtl,
                                          children: <Widget>[
                                            Column(
                                              textDirection: TextDirection.rtl,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  'كعكة بالمكسرات',
                                                  style: kTitleBlackTextStyle,
                                                ),
                                                Text(
                                                  'كيكات',
                                                  style: kBodyTextStyle,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              textDirection: TextDirection.rtl,
                                              children: <Widget>[
                                                Text(
                                                  '235',
                                                  style: kBodyTextStyle,
                                                ),
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.favorite,
                                                    color: Colors.red,
                                                  ),
                                                  onPressed: () {
                                                    print('Like is working');
                                                  },
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 10),
                                        child: Divider(
                                          thickness: 1,
                                          color: KGreyDarkColorUsed,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 10, right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          textDirection: TextDirection.rtl,
                                          children: <Widget>[
                                            CircleAvatar(
                                              radius: 25,
                                              backgroundImage: AssetImage(
                                                  'assets/images/Oval.png'),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  'فهد محمد',
                                                  style: kBodyTextStyle
                                                      .copyWith(fontSize: 18),
                                                ),
                                                Text(
                                                  'الرياض',
                                                  style: kBodyTextStyle,
                                                ),
                                              ],
                                            ),
                                            VerticalDivider(
                                              // TODO : is not showing in the UI??!!
                                              thickness: 5,
                                              color: Colors.red,
                                            ),
                                            FaIcon(
                                              FontAwesomeIcons.star,
                                              color: KRedColorUsed,
                                            ),
                                            Text(
                                              '4.5',
                                              style: kBodyTextStyle,
                                            ),
                                            VerticalDivider(
                                              // TODO : is not showing in the UI??!!
                                              thickness: 5,
                                              color: KGreyDarkColorUsed,
                                            ),
                                            Text(
                                              'ريال 25',
                                              style: kTitleBlackTextStyle
                                                  .copyWith(color: Colors.red),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

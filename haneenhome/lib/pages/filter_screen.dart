import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:haneenhome/component/homeCardGrid.dart';
import 'package:sweets/pages/notMyCard/homeCardGrid.dart';

import 'notMyCard/homecard.dart';

class FilterScreen extends StatefulWidget {
  static const String id = 'Filterscreen';

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isListed = false;

  double _lowerValue = 50;
  double _upperValue = 180;

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        context: context,
        builder: (builder) {
          return Container(
            height: MediaQuery.of(context).size.height * 1,
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(20.0),
                topRight: const Radius.circular(20.0),
              ),
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.63,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 25.0, right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'مسح',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Text(
                          'فلاتر ',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'تنفيذ',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6.0),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      indent: 15,
                      endIndent: 15,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Icon(
                            Icons.check,
                            color: Colors.redAccent,
                            size: 30,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Text(
                            'أعلى التقييمات',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      indent: 15,
                      endIndent: 15,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Text(
                            'الأقرب لي',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      indent: 15,
                      endIndent: 15,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Text(
                            'التكلفة من الأعلى إلى الأقل',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      indent: 15,
                      endIndent: 15,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'تكلفة منخفضة إلى عالية',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      indent: 15,
                      endIndent: 15,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Text(
                          'السعر',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.centerLeft,
                            child: FlutterSlider(
                              values: [3000, 17000],
                              rangeSlider: true,
//rtl: true,

//                ignoreSteps: [
//                  FlutterSliderIgnoreSteps(from: 8000, to: 12000),
//                  FlutterSliderIgnoreSteps(from: 18000, to: 22000),
//                ],
                              max: 25000,
                              min: 0,
                              step: 100,
                              jump: true,
                              trackBar: FlutterSliderTrackBar(
                                inactiveTrackBarHeight: 2,
                                activeTrackBarHeight: 3,
                              ),
                              disabled: false,
                              handler: customHandler(Icons.chevron_right),
                              rightHandler: customHandler(Icons.chevron_left),
                              tooltip: FlutterSliderTooltip(
                                leftPrefix: Text('ريال'),
                                rightSuffix: Text('ريال'),
                                textStyle: TextStyle(
                                    fontSize: 18, color: Colors.black45),
                              ),

                              onDragging:
                                  (handlerIndex, lowerValue, upperValue) {
                                _lowerValue = lowerValue;
                                _upperValue = upperValue;
                                setState(() {});
                              },
                            )),
                      ),
//
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Color(0xff9267FD),
            height: 400,
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 15,
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).padding.left + 125),
                          child: Image.asset(
                            'assets/images/bz.png',
                            scale: 3,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).padding.left +
                                      120),
                              child: Image.asset(
                                'assets/images/Header.png',
                                scale: 3,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top + 10),
                      child: SizedBox(
                        height: 120.0,
                        width: 422.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).padding.left + 5.0,
                                  right: MediaQuery.of(context).padding.right +
                                      5.0),
                              child: Image.asset(
                                'assets/images/American.png',
                                scale: 2,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).padding.left + 5.0,
                                  right: MediaQuery.of(context).padding.right +
                                      5.0),
                              child: Image.asset(
                                'assets/images/Indian.png',
                                scale: 2,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).padding.left + 5.0,
                                  right: MediaQuery.of(context).padding.right +
                                      5.0),
                              child: Image.asset(
                                'assets/images/French.png',
                                scale: 2,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).padding.left + 5.0,
                                  right: MediaQuery.of(context).padding.right +
                                      5.0),
                              child: Image.asset(
                                'assets/images/Chinese.png',
                                scale: 2,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).padding.left + 5.0,
                                  right: MediaQuery.of(context).padding.right +
                                      5.0),
                              child: Image.asset(
                                'assets/images/All.png',
                                scale: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 230.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.grey[50]),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top + 0.8),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    InkWell(
                                      onTap: _modalBottomSheetMenu,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .padding
                                                    .left +
                                                5.0,
                                            right: MediaQuery.of(context)
                                                    .padding
                                                    .right +
                                                5.0),
                                        child: Image.asset(
                                          'assets/images/Sort.png',
                                          scale: 4,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          isListed = !isListed;
                                        });
                                      },
                                      child: Image.asset(
                                        'assets/images/Filter.png',
                                        scale: 4,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right:
                                          MediaQuery.of(context).padding.right +
                                              8.0),
                                  child: Text(
                                    '56 منتج',
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Expanded(
                                child: isListed == false
                                    ? ListView(
                                        children: <Widget>[
                                          HomeCard(),
                                          HomeCard(),
                                          HomeCard(),
                                        ],
                                      )
                                    : GridView.count(
                                        crossAxisCount: 2,
                                        childAspectRatio: MediaQuery.of(context)
                                                    .devicePixelRatio <=
                                                2
                                            ? MediaQuery.of(context)
                                                    .devicePixelRatio *
                                                0.45
                                            : MediaQuery.of(context)
                                                            .devicePixelRatio >=
                                                        2 &&
                                                    MediaQuery
                                                                .of(context)
                                                            .devicePixelRatio <=
                                                        3
                                                ? MediaQuery.of(context)
                                                        .devicePixelRatio *
                                                    0.2
                                                : MediaQuery.of(context)
                                                        .devicePixelRatio *
                                                    0.21,
                                        children: <Widget>[
                                          HomeCardGrid(),
                                          HomeCardGrid(),
                                          HomeCardGrid(),
                                          HomeCardGrid(),
                                        ],
                                      )),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        iconSize: 25,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Color(0xffFF3541),
        items: [
          new BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/home.png'),
            ),
            title: Text('الرئيسية'),
          ),
          new BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/CombinedShape.png'),
            ),
            title: Text('المفضلة'),
          ),
          new BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/settings.png'),
              ),
              title: Text('الاعدادات')),
        ],
      ),
    );
  }

  customHandler(IconData chevron_left) {}
}

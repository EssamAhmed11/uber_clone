import 'package:flutter/material.dart';
import 'package:haneenhome/component/themeData.dart';
import 'package:sweets/component/commentBox.dart';
import 'package:sweets/component/commentBox.dart';

class CommentCard extends StatefulWidget {
  static const String id = 'commentcard';

  @override
  _CommentCardState createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            primary: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  color: kMainPurpleColorUsed,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20, right: 18.0),
                    child: Text(
                      '45 تعليق',
                      style: kTitleWhiteTextStyle,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      CommentBox(
                        imageOfCommenter: AssetImage('assets/images/Oval.png'),
                        nameOfCommenter: 'فهد محمد',
                        commentMessage:
                            'كيكة التمر بالمكسرات حلى سهل و سريع ، كما انها تصلح كحلى صباحية تبدأ بها اسرتك يومها لتمنحها الطاقة و النشاط مثل كب كيك ، بان كيك ، و كيكة السينابون',
                      ),
                      CommentBox(
                        imageOfCommenter: AssetImage('assets/images/Oval.png'),
                        nameOfCommenter: 'فهد محمد',
                        commentMessage:
                            'كيكة التمر بالمكسرات حلى سهل و سريع ، كما انها تصلح كحلى صباحية تبدأ بها اسرتك يومها لتمنحها الطاقة و النشاط مثل كب كيك ، بان كيك ، و كيكة السينابون',
                      ),
                      CommentBox(
                        imageOfCommenter: AssetImage('assets/images/Oval.png'),
                        nameOfCommenter: 'فهد محمد',
                        commentMessage:
                            'كيكة التمر بالمكسرات حلى سهل و سريع ، كما انها تصلح كحلى صباحية تبدأ بها اسرتك يومها لتمنحها الطاقة و النشاط مثل كب كيك ، بان كيك ، و كيكة السينابون',
                      ),
                      CommentBox(
                        imageOfCommenter: AssetImage('assets/images/Oval.png'),
                        nameOfCommenter: 'فهد محمد',
                        commentMessage:
                            'كيكة التمر بالمكسرات حلى سهل و سريع ، كما انها تصلح كحلى صباحية تبدأ بها اسرتك يومها لتمنحها الطاقة و النشاط مثل كب كيك ، بان كيك ، و كيكة السينابون',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            suffixIcon: RectangleButton(
              functionOfRoundedButton: () {
                print('comment button is working');
              },
              nameOfRoundedButton: 'ارسل',
            ),
            hintText: 'اكتب تعليقك',
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
            ),
          ),
        ),
      ),
    );
  }
}

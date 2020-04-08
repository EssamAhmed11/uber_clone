import 'package:flutter/material.dart';
import 'package:haneenhome/component/themeData.dart';

class CommentBox extends StatelessWidget {
  final ImageProvider imageOfCommenter;
  final String nameOfCommenter;
  final String commentMessage;

  const CommentBox(
      {this.imageOfCommenter, this.commentMessage, this.nameOfCommenter});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 25.0, right: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: imageOfCommenter,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Text(
                        nameOfCommenter,
                        style: kTitleBlackTextStyle,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.favorite),
                  color: kRedTabColor,
                  disabledColor: KGreyDarkColorUsed,
                  onPressed: () {
                    print('Test Favorite');
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 60, left: 10),
            child: Text(
              commentMessage,
              style: kBodyBlackTextStyle,
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
        ],
      ),
    );
  }
}

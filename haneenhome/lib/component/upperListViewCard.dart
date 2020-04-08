import 'package:flutter/material.dart';
import 'package:haneenhome/component/themeData.dart';

class UpperListViewCard extends StatelessWidget {
  final String nameOfCard;
  final Function onTap;
  final ImageProvider backGroundImage;

  const UpperListViewCard({
    this.nameOfCard,
    @required this.onTap,
    this.backGroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 10, left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: backGroundImage,
              radius: 40,
            ),
            Text(
              nameOfCard,
              style: kTitleWhiteTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}

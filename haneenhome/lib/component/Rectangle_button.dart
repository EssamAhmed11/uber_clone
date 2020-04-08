import 'package:flutter/material.dart';
import 'package:haneenhome/component/themeData.dart';

class RectangleButton extends StatelessWidget {
  final String nameOfRoundedButton;
  final Function functionOfRoundedButton;

  const RectangleButton(
      {@required this.functionOfRoundedButton,
      @required this.nameOfRoundedButton});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Material(
        elevation: 8.0,
        color: kRedTabColor,
        borderRadius: BorderRadius.circular(10.0),
        child: MaterialButton(
          onPressed: functionOfRoundedButton,
          minWidth: 100.0,
          height: 4.0,
          child: Text(
            nameOfRoundedButton,
            style: kTitleWhiteTextStyle,
          ),
        ),
      ),
    );
  }
}

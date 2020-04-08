import 'package:flutter/material.dart';
import 'package:haneenhome/component/themeData.dart';

class IngredientsBox extends StatelessWidget {
  final ImageProvider imageOfIngredients;
  final String textOfIngredients;

  const IngredientsBox({
    this.imageOfIngredients,
    this.textOfIngredients,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 25.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ImageIcon(
                imageOfIngredients,
                size: 20,
                color: KRedColorUsed,
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Text(
                  textOfIngredients,
                  style: kBodyTextStyle,
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
      ],
    );
  }
}

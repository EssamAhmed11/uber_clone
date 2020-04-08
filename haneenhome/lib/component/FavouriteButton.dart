import 'package:flutter/material.dart';
import 'package:haneenhome/component/themeData.dart';

class FavouriteButton extends StatelessWidget {
  final Function onPressed;

  const FavouriteButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: IconButton(
          icon: Icon(Icons.favorite),
          color: kRedTabColor,
          disabledColor: KGreyDarkColorUsed,
          onPressed: onPressed),
    );
  }
}

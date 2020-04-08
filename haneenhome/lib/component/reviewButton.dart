import 'package:flutter/material.dart';

class ReviewButton extends StatelessWidget {
  final Function onPressed;

  const ReviewButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Image.asset(
        'assets/images/star.png',
        scale: 4,
      ),
    );
  }
}

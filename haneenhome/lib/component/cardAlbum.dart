import 'package:flutter/material.dart';

class CardAlbum extends StatelessWidget {
  final Widget childUsedInside;
  final double heightOfContainer;
  final double widthOfContainer;
  final Color colorOfCard;
  final Function onTap;

  const CardAlbum({
    this.childUsedInside,
    this.colorOfCard,
    @required this.heightOfContainer,
    @required this.widthOfContainer,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: widthOfContainer,
        decoration: BoxDecoration(
          color: colorOfCard,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: childUsedInside),
      ),
    );
  }
}

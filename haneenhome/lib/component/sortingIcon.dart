import 'package:flutter/material.dart';

class SortingIcon extends StatelessWidget {
  final ImageProvider image;
  final Function onTap;

  const SortingIcon({
    this.image,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: onTap,
        child: CircleAvatar(
          radius: 20,
          foregroundColor: Colors.red,
          backgroundColor: Colors.white,
          backgroundImage: image,
        ),
      ),
    );
  }
}

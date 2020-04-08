import 'package:flutter/material.dart';
import 'package:haneenhome/component/themeData.dart';

class MainAppBar extends StatelessWidget {
  final Widget listViewOfApp;
  final Widget rightIconOfApp;

  const MainAppBar({this.listViewOfApp, this.rightIconOfApp});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      //Here is the sliver appbar including Logo, search bar and horizontal list view
      //TODO: correct the value to be responsive
      stretch: true,
      expandedHeight: 250,
      forceElevated: true,
      floating: true,
      pinned: true,
      backgroundColor: kMainPurpleColorUsed,
      actions: <Widget>[rightIconOfApp],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(215.0),
        child: listViewOfApp,
      ),
    );
  }
}

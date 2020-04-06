import 'package:flutter/material.dart';
import 'package:uberclone/Screens/home.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Uber Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Uber Clone'),
    );
  }
}

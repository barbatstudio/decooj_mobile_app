import 'package:decooj_buyers/features/main_screen/main_screen_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'دکوژ',
      theme: ThemeData(
        fontFamily: 'Iran_Yekan',
        primarySwatch: Colors.blueGrey,
      ),
      routes: {
        // '/': (context) => NoteListView(),
        '/': (context) =>MainScreenView()
        // '/slides': (context) => SlideScreen(),
      },
      initialRoute: '/',
    );
  }
}



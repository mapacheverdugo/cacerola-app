import 'package:cacerola/cacerola_screen.dart';
import 'package:cacerola/informacion_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(CacerolaApp());

class CacerolaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cacerola',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          brightness: Brightness.light,
          iconTheme: IconThemeData(
            color: Colors.grey
          ),
          elevation: 0
        )
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => CacerolaScreen(),
        '/informacion': (context) => InformacionScreen(),
      },
    );
  }
}

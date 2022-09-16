import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty/home/screens/ui/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //quitar el banner
      title: 'Personajes Rick y morty',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHome(),
    );
  }
}

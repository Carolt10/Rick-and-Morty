import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.network(
              'https://www.reporterdiario.com.br/wp-content/uploads/2020/08/rick-morty-41-01b4.jpeg'),
          const Text('Holaa'),
        ],
      ),
    );
  }
}

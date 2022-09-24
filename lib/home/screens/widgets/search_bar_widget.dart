import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        left: 8.0,
        right: 8.0,
      ),
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: TextField(
        cursorColor: Colors.grey.shade400,
        decoration: InputDecoration(
            prefixIcon: Icon(CupertinoIcons.search),
            hintText: 'Buscar personajes',
            border: InputBorder.none,
            hintStyle: TextStyle(fontSize: 18)),
      ),
    );
  }
}

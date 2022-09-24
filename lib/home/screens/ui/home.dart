import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty/home/controllers/home-controller.dart';
import 'package:flutter_rick_and_morty/home/models/character.dart';
import 'package:flutter_rick_and_morty/home/screens/widgets/character-card.dart';
import 'package:flutter_rick_and_morty/home/screens/widgets/search_bar_widget.dart';
import 'package:flutter_rick_and_morty/utils/widgets/my-drawer.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            const Text(
              'Personajes ',
              style: TextStyle(fontSize: 20, color: Colors.black54),
            ),
            Text(
              'Rick y Morty',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black87),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [getCharacters()],
      )),
    );
  }

  // ignore: dead_code
  FutureBuilder<List<CharacterDTO>> getCharacters() =>
      FutureBuilder<List<CharacterDTO>>(
          future: homeController.getCharacters(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return SizedBox(
                height: 300,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            final List<CharacterDTO> characters = snapshot.data ?? [];
            final bool characterCounter = characters.isNotEmpty;
            if (characterCounter) {
              return _buildMyCharacters(characters);
            } else {
              return Container();
            }
          });

  Widget _buildMyCharacters(List<CharacterDTO> characters) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 5,
            left: 30,
            right: 30,
          ),
          child: SearchBarWidget(),
        ),
        SizedBox(height: 20),
        Container(
          child: GridView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: characters.length,
            itemBuilder: (context, index) {
              return CharacterCard(characterDTO: characters[index]);
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 30,
              childAspectRatio: 0.8,
            ),
          ),
        )
      ],
    );
  }
}

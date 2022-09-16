import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty/home/controllers/home-controller.dart';
import 'package:flutter_rick_and_morty/home/models/character.dart';
import 'package:flutter_rick_and_morty/home/screens/widgets/character-card.dart';
import 'package:flutter_rick_and_morty/utils/widgets/my-drawer.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personajes Rick y Morty',
        ),
      ),
      drawer: Drawer(child: MyDrawer()),
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
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: characters.length,
        itemBuilder: (context, index) {
          return CharacterCard(characterDTO: characters[index]);
        });
  }
}

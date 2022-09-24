import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty/home/models/character.dart';
import 'package:flutter_rick_and_morty/home/screens/ui/character_detail.dart';
import 'package:flutter_rick_and_morty/home/screens/ui/home.dart';
import 'package:flutter_rick_and_morty/home/screens/widgets/search_bar_widget.dart';

class CharacterCard extends StatefulWidget {
  final CharacterDTO characterDTO;
  const CharacterCard({Key? key, required this.characterDTO}) : super(key: key);

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CharacterDetail(
                    characterDTO: widget.characterDTO,
                    myVoidCallback: () {
                      setState(() {});
                    },
                  )),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Image border
                  child: Image.network(
                    widget.characterDTO.image,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Positioned(
                    top: 5,
                    bottom: 180,
                    right: 5,
                    width: 60,
                    child: Icon(
                      Icons.circle,
                      color: widget.characterDTO.isFavorite
                          ? Colors.greenAccent
                          : Colors.grey,
                      size: 50,
                    )),
                Positioned(
                  top: 5,
                  bottom: 180,
                  right: 5,
                  width: 60,
                  child: Icon(
                    widget.characterDTO.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            flex: 2,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.characterDTO.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              textAlign: TextAlign.left,
              softWrap: true,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.circle,
                color: Colors.greenAccent,
                size: 14,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.characterDTO.status,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

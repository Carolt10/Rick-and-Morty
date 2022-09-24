import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty/home/controllers/home-controller.dart';
import 'package:flutter_rick_and_morty/home/models/character.dart';
import 'package:flutter_rick_and_morty/home/screens/widgets/character-card.dart';
import 'package:flutter_rick_and_morty/utils/widgets/my-drawer.dart';

class CharacterDetail extends StatefulWidget {
  final CharacterDTO characterDTO;
  final VoidCallback myVoidCallback;
  const CharacterDetail(
      {Key? key, required this.characterDTO, required this.myVoidCallback})
      : super(key: key);

  @override
  State<CharacterDetail> createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {
  get builder => null;

  @override
  Widget build(BuildContext context) {
    var color2 = null;
    var icons = Icons;
    var center = Center();
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Container(
                  child: Center(
                      child: Image.network(
                    widget.characterDTO.image,
                    alignment: Alignment.topCenter,
                    fit: BoxFit.fill,
                    width: 500,
                  )),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  widget.characterDTO.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 28,
                  ),
                  textAlign: TextAlign.left,
                  softWrap: true,
                ),
              ),
              //////

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8)),
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Estado',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: Colors.greenAccent,
                                size: 14,
                              ),
                              Text(
                                widget.characterDTO.status,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black87),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    flex: 8,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8)),
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Especie',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.characterDTO.species,
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black87),
                              textAlign: TextAlign.left,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    flex: 8,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8)),
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Text(
                            'Genero',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            widget.characterDTO.gender,
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              //

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Datos personaje',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),

              ///

              if (!widget.characterDTO.type.isEmpty)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Tipo',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.characterDTO.type,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Debut',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      widget.characterDTO.debut,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Locación',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.characterDTO.location,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 60,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.greenAccent,
                width: 2.0,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: GestureDetector(
            onTap: () {
              setState(() {
                widget.characterDTO.isFavorite =
                    !widget.characterDTO.isFavorite;
                widget.myVoidCallback.call();
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (!widget.characterDTO.isFavorite)
                  Icon(
                    Icons.favorite_border,
                    color: Colors.greenAccent,
                    size: 20,
                  ),
                if (widget.characterDTO.isFavorite)
                  Icon(
                    Icons.favorite,
                    color: Colors.greenAccent,
                    size: 20,
                  ),
                Text(
                  '  Añadir a favoritos',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ));
  }
}

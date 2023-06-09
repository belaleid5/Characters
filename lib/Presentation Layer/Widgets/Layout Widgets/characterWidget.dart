import 'package:flutter/material.dart';

import '../../../Data Layer/Models/Characters/characters.dart';

class CharacterWidget extends StatelessWidget {
  CharactersModel characterItem;
  CharacterWidget({required this.characterItem, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    width: double.infinity,
    margin: const EdgeInsets.all(8),
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white
    ),
    child: GridTile(
      footer: Text(characterItem.fullName!,
        textAlign: TextAlign.center,
        style: const TextStyle(
          height: 1.6,
          fontSize: 13,
          color:Colors.white
        ),
        ),
      child: characterItem.imageUrl!.isNotEmpty?
      FadeInImage.assetNetwork(
        placeholder:"assets/background.jpg",
        image: characterItem.imageUrl!,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
        ): Image.asset("assets/background.jpg"),
        )
    );
  }
}
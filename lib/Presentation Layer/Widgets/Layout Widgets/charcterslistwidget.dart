import 'package:flutter/material.dart';
import '../../../Data Layer/Models/Characters/charactercollection.dart';
import '../Custom/loadingwidget.dart';
import 'characterWidget.dart';

class CharactersListWidget extends StatefulWidget {
  CharacterCollection characterCollection;
  ScrollController characterController ;
  CharactersListWidget({required this.characterCollection, 
  required this.characterController,Key? key}) : super(key: key);

  @override
  State<CharactersListWidget> createState() => _CharactersListWidgetState();
}

class _CharactersListWidgetState extends State<CharactersListWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
     controller: widget.characterController,
     slivers: [
      SliverGrid(
        delegate:SliverChildBuilderDelegate(
          (context, index){
           return CharacterWidget(characterItem:widget.
           characterCollection.character![index],);
          },
          childCount: widget.characterCollection.character!.length
          ), 
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
         childAspectRatio: 2/3,
         crossAxisCount: 2,
         mainAxisSpacing: 1,
         crossAxisSpacing: 1
        )
        ),
      SliverToBoxAdapter(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const LoadingWidget(),
          )
      )
     ],
    );
  }
}
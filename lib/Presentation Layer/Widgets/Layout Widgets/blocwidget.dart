import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Business Logic Layer/Characters/bloc/characters_bloc.dart';
import '../../../Data Layer/Models/Characters/charactercollection.dart';
import '../Custom/loadingwidget.dart';
import 'charcterslistwidget.dart';

Widget buildLayoutBloc(CharacterCollection charatcterCollection,
 ScrollController characterController){
 return BlocBuilder<CharactersBloc,CharactersState>(
   builder: (context, state) {
    if(state is CharactersLoaded){
     charatcterCollection = state.characterCollection;
     return CharactersListWidget(characterCollection: charatcterCollection,
     characterController: characterController,);
    }
    else if(state is CharactersLoading){
      return const LoadingWidget();
    }
    else if(state is CharactersError){
      return const Text("Error Happen For Retrieving Data");
    }
     return Container();
   },
 );
}


import 'package:exam_cubit/Helpers/Route/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Business Logic Layer/Characters/bloc/characters_bloc.dart';
import '../../Data Layer/Api Services/charactersapi.dart';
import '../../Data Layer/Repositories/charactersRepositories.dart';
import '../../Presentation Layer/Modules/characterdetails.dart';
import '../../Presentation Layer/Modules/layout.dart';
import '../../Presentation Layer/Modules/login.dart';

class AppRouting {
  late CharactersRepositories charactersRepositories;
  AppRouting() {
    charactersRepositories =
        CharactersRepositories(charactersApi: CharactersApi());
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CharactersBloc(charactersRepositories),
            child: const LoginPage(),
          ),
        );
      case layoutScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CharactersBloc(charactersRepositories),
            child: const LayoutScreen(),
          ),
        );

      case characterDetails:
        return MaterialPageRoute(
          builder: (_) => const CharacterDetailsScreen(),
        );
      default:
    }
  }
}

import '../Api Services/charactersapi.dart';
import '../Models/Characters/characters.dart';

class CharactersRepositories{
  final CharactersApi charactersApi;
  CharactersRepositories({required this.charactersApi});

  Future<List<CharactersModel>> getCharacters()async{
    var characters = await charactersApi.getCharacters();
    List<Map<String,dynamic>> items = List<Map<String,dynamic>>
    .from(characters);
    List<CharactersModel> seriesCharacters = CharactersModel.fromData(items);
    return seriesCharacters;
  }
}
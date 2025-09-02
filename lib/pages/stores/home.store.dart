import 'package:mobx/mobx.dart';
import 'package:rick_and_morty/models/character.model.dart';
import 'package:rick_and_morty/services/rick_morty_api.service.dart';

// Include generated file
part 'home.store.g.dart';

// This is the class used by rest of your codebase
class HomeStore = HomeStoreBase with _$HomeStore;

// The store-class
abstract class HomeStoreBase with Store {
  final _service = RickMortyApiService();
  int page = 1;
  HomeStoreBase();

  @observable
  bool isLoading = false;

  @observable
  ObservableList<Character> characters = <Character>[].asObservable();

  @action
  Future<void> loadCharacters() async {
    isLoading = true;
    print('Loading page $page');
    final response = await _service.loadCharacters(page: page);
    page += 1;
    characters.addAll(response.results);
    isLoading = false;
  }
}

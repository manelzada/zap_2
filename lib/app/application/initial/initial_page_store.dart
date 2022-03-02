import 'package:mobx/mobx.dart';
part 'initial_page_store.g.dart';

class InitialPageStore = _InitialPageStoreBase with _$InitialPageStore;

abstract class _InitialPageStoreBase with Store {
  @observable
  String? errorName = '';

  @action
  void changeErrorName(String? value) => errorName;
}

import 'package:mobx/mobx.dart';
import 'package:vacinados_ada/app/repository/hive_repository.dart';

part 'vacinados_store.g.dart';

class VacinadosStore = VacinadosStoreBase with _$VacinadosStore;

abstract class VacinadosStoreBase with Store {
  final HiveRepository _repository;

  VacinadosStoreBase(this._repository) {
    _repository.getList();
  }

  Future<void> save() async {
    _repository.savePerson();
  }
}

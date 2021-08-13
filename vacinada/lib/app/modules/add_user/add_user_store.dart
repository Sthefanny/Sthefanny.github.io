import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

import '../../models/vacinado_model.dart';

part 'add_user_store.g.dart';

class AddUserStore = AddUserStoreBase with _$AddUserStore;

abstract class AddUserStoreBase with Store {
  FirebaseFirestore _db;
  late CollectionReference _user;

  @observable
  List<QueryDocumentSnapshot> users = <QueryDocumentSnapshot>[];

  AddUserStoreBase(this._db) {
    _user = _db.collection('user');
  }

  Future<bool> addUser(VacinadoModel user) {
    return _user
        .add({
          'name': user.name,
          'turn': user.turn,
          'firstDoseTaken': user.firstDoseTaken,
          'secondDoseTaken': user.secondDoseTaken,
        })
        .then((value) => true)
        .catchError((error) => false);
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:vacinados_ada/app/models/vacinado_model.dart';

part 'vacinados_store.g.dart';

class VacinadosStore = VacinadosStoreBase with _$VacinadosStore;

abstract class VacinadosStoreBase with Store {
  FirebaseFirestore _db;
  late CollectionReference _user;

  @observable
  List<QueryDocumentSnapshot> users = <QueryDocumentSnapshot>[];

  @observable
  int morningCount = 0;

  @observable
  int afternoonCount = 0;

  VacinadosStoreBase(this._db) {
    _user = _db.collection('user');
    load();
  }

  @action
  Future<List<QueryDocumentSnapshot>> load() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    List<QueryDocumentSnapshot> users = <QueryDocumentSnapshot>[];
    await _user.get().then((querySnapshot) => {
          querySnapshot.docs.forEach((doc) {
            return users.add(doc);
          })
        });
    return users;
  }

  @action
  Future<void> getMorningCount() async {
    await _user.where('turn', isEqualTo: 'Manhã').get().then((value) => morningCount = value.size);
  }

  @action
  Future<void> getAfternoonCount() async {
    await _user.where('turn', isEqualTo: 'Tarde').get().then((value) => afternoonCount = value.size);
  }

  Future<void> addUser(VacinadoModel user) {
    return _user
        .add({
          'name': user.name,
          'turn': user.turn,
          'firstDoseTaken': user.firstDoseTaken,
          'secondDoseTaken': user.secondDoseTaken,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  void deleteUser(String id) {
    _user.doc(id).delete().then((value) => print("User Deleted")).catchError((error) => print("Failed to delete user: $error"));
  }
}

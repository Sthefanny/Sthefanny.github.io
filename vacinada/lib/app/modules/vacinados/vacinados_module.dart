import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vacinados_ada/app/modules/add_user/add_user_store.dart';
import '../add_user/add_user_page.dart';

import 'vacinados_page.dart';
import 'vacinados_store.dart';

class VacinadosModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => VacinadosStore(FirebaseFirestore.instance)),
    Bind.lazySingleton((i) => AddUserStore(FirebaseFirestore.instance)),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => VacinadosPage()),
    ChildRoute('/addUser', child: (_, args) => AddUserPage()),
  ];
}

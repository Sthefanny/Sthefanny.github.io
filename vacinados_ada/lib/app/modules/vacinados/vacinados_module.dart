import 'package:flutter_modular/flutter_modular.dart';

import 'vacinados_page.dart';
import 'vacinados_store.dart';

class VacinadosModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => VacinadosStore(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => VacinadosPage()),
  ];
}

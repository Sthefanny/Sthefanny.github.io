import 'package:flutter_modular/flutter_modular.dart';
import 'package:vacinados_ada/app/repository/hive_repository.dart';

import 'modules/home/home_module.dart';
import 'modules/vacinados/vacinados_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HiveRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute('/vacinados', module: VacinadosModule()),
  ];
}

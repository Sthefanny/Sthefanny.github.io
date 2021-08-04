import 'package:hive/hive.dart';

import '../models/vacinado_model.dart';

class HiveRepository {
  Future<void> getList() async {
    var box = await Hive.openBox('vacinadosDB');

    var vacinados = box.get('vacinados');

    print(vacinados);

    return vacinados;
  }

  Future<void> savePerson() async {
    var box = await Hive.openBox('vacinadosDB');

    var person = VacinadoModel(name: 'Stel', turn: 'Tarde');
    box.add(person);
    person.save();
  }
}

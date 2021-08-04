import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class VacinadoModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String turn;

  @HiveField(2)
  bool firstDoseTaken;

  @HiveField(3)
  DateTime? firstDoseDate;

  @HiveField(4)
  bool secondDoseTaken;

  @HiveField(4)
  DateTime? secondDoseDate;

  VacinadoModel({
    required this.name,
    required this.turn,
    this.firstDoseTaken = false,
    this.firstDoseDate,
    this.secondDoseTaken = false,
    this.secondDoseDate,
  });
}

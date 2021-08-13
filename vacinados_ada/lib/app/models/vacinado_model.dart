import 'package:json_annotation/json_annotation.dart';

part 'vacinado_model.g.dart';

@JsonSerializable()
class VacinadoModel {
  String? id;
  String name;
  String turn;
  String? vacina;
  bool firstDoseTaken;
  bool secondDoseTaken;

  VacinadoModel({
    this.id,
    required this.name,
    required this.turn,
    this.vacina,
    this.firstDoseTaken = false,
    this.secondDoseTaken = false,
  });

  factory VacinadoModel.fromJson(Map<String, dynamic> json) => _$VacinadoModelFromJson(json);
  Map<String, dynamic> toJson() => _$VacinadoModelToJson(this);
}

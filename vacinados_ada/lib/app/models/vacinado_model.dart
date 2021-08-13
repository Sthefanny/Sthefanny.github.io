import 'package:json_annotation/json_annotation.dart';

part 'vacinado_model.g.dart';

@JsonSerializable()
class VacinadoModel {
  String name;
  String turn;
  bool firstDoseTaken;
  bool secondDoseTaken;

  VacinadoModel({
    required this.name,
    required this.turn,
    this.firstDoseTaken = false,
    this.secondDoseTaken = false,
  });

  factory VacinadoModel.fromJson(Map<String, dynamic> json) => _$VacinadoModelFromJson(json);
  Map<String, dynamic> toJson() => _$VacinadoModelToJson(this);
}

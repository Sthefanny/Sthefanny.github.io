import 'package:json_annotation/json_annotation.dart';

part 'experience_model.g.dart';

@JsonSerializable()
class ExperiencesModel {
  final List<ExperienceModel> experiences;

  ExperiencesModel({
    required this.experiences,
  });

  factory ExperiencesModel.fromJson(Map<String, dynamic> json) => _$ExperiencesModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExperiencesModelToJson(this);
}

@JsonSerializable()
class ExperienceModel {
  final String initialDate;
  final String finalDate;
  final String jobTitle;
  final String company;
  final String description;

  ExperienceModel({
    required this.initialDate,
    required this.finalDate,
    required this.jobTitle,
    required this.company,
    required this.description,
  });

  factory ExperienceModel.fromJson(Map<String, dynamic> json) => _$ExperienceModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExperienceModelToJson(this);
}

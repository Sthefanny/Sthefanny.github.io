import 'package:json_annotation/json_annotation.dart';

part 'education_model.g.dart';

@JsonSerializable()
class EducationsModel {
  final List<EducationModel> educations;

  EducationsModel({
    required this.educations,
  });

  factory EducationsModel.fromJson(Map<String, dynamic> json) => _$EducationsModelFromJson(json);
  Map<String, dynamic> toJson() => _$EducationsModelToJson(this);
}

@JsonSerializable()
class EducationModel {
  final String initialDate;
  final String finalDate;
  final String university;
  final String location;
  final String course;

  EducationModel({
    required this.initialDate,
    required this.finalDate,
    required this.university,
    required this.location,
    required this.course,
  });

  factory EducationModel.fromJson(Map<String, dynamic> json) => _$EducationModelFromJson(json);
  Map<String, dynamic> toJson() => _$EducationModelToJson(this);
}

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_resume/app/common/models/education_model.dart';
import 'package:mobx/mobx.dart';

import '../../app_store.dart';
import '../../common/enums/language_enum.dart';
import '../../common/models/experience_model.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final AppStore appStore;

  HomeStoreBase(this.appStore);

  @observable
  ObservableList<ExperienceModel> experiences = ObservableList<ExperienceModel>();

  @observable
  ObservableList<EducationModel> educations = ObservableList<EducationModel>();

  @action
  void setExperiences(List<ExperienceModel> value) => experiences = value.asObservable();

  @action
  void setEducations(List<EducationModel> value) => educations = value.asObservable();

  Future<void> loadExperiences() async {
    String jsonString = await rootBundle.loadString('assets/json/experiences_${_getLanguage()}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    final result = ExperiencesModel.fromJson(jsonMap);

    setExperiences(result.experiences);
  }

  Future<void> loadEducations() async {
    String jsonString = await rootBundle.loadString('assets/json/educations_${_getLanguage()}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    final result = EducationsModel.fromJson(jsonMap);

    setEducations(result.educations);
  }

  String _getLanguage() {
    String? language;
    switch (appStore.language) {
      case LanguageEnum.portuguese:
        language = 'pt';
        break;
      case LanguageEnum.english:
        language = 'en';
        break;
    }
    return language;
  }
}

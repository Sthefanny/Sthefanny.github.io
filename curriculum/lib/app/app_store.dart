import 'dart:ui';

import 'package:mobx/mobx.dart';

import 'common/enums/language_enum.dart';

part 'app_store.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  @observable
  Locale? locale = Locale('pt');

  @observable
  LanguageEnum language = LanguageEnum.portuguese;

  @action
  void setLanguage(LanguageEnum value) => language = value;

  @action
  void setLocale(LanguageEnum value) {
    setLanguage(value);

    switch (value) {
      case LanguageEnum.portuguese:
        locale = Locale('pt');
        break;
      case LanguageEnum.english:
        locale = Locale('en');
        break;
    }
  }
}

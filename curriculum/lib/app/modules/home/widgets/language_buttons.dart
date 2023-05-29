import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_store.dart';
import '../../../common/enums/language_enum.dart';
import '../home_store.dart';

class LanguageButtons extends StatefulWidget {
  LanguageButtons({super.key});

  @override
  State<LanguageButtons> createState() => _LanguageButtonsState();
}

class _LanguageButtonsState extends State<LanguageButtons> {
  late AppStore _appStore;
  late HomeStore _homeStore;

  @override
  void initState() {
    super.initState();
    _appStore = Modular.get<AppStore>();
    _homeStore = Modular.get<HomeStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.2.sw,
      height: 0.06.sh,
      margin: EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton(
                  text: 'ENG',
                  action: () {
                    _appStore.setLocale(LanguageEnum.english);
                    _homeStore
                      ..loadExperiences()
                      ..loadEducations();
                  }),
              _buildButton(
                  text: 'PT-BR',
                  action: () {
                    _appStore.setLocale(LanguageEnum.portuguese);
                    _homeStore
                      ..loadExperiences()
                      ..loadEducations();
                  }),
            ],
          ),
          // _buildButton(text: 'Download PDF', action: () => _generatePdf()),
        ],
      ),
    );
  }

  Widget _buildButton({required String text, required Function action}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.sp),
      child: ElevatedButton(
        onPressed: () => action(),
        child: Text(text),
      ),
    );
  }
}

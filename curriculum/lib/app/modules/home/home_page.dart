import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../common/configs/color_config.dart';
import 'widgets/language_buttons.dart';
import 'widgets/resume_wiget.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          backgroundColor: ColorConfig.background,
          body: Stack(
            children: [
              ResumeWidget(),
              LanguageButtons(),
            ],
          ),
        );
      },
    );
  }
}

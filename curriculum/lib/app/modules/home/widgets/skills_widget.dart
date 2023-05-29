import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../l10n/generated/l10n.dart';
import '../../../common/configs/color_config.dart';
import '../../../common/configs/text_style_config.dart';
import '../../../common/widgets/score_widget.dart';

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildIcon(),
                _buildTitle(context),
              ],
            ),
          ),
          _buildSkills(context),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return Padding(
      padding: EdgeInsets.only(right: 4.w, bottom: 5.h),
      child: FaIcon(FontAwesomeIcons.puzzlePiece, color: ColorConfig.background, size: 18.w),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      S.of(context).skills,
      style: TextStyleConfig.title,
    );
  }

  Widget _buildSkills(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSkill(title: 'Flutter', score: 4),
          _buildSkill(title: 'Dart', score: 4),
          _buildSkill(title: 'C#', score: 3),
          _buildSkill(title: '.Net Framework', score: 2),
          _buildSkill(title: 'Web Api', score: 3),
          _buildSkill(title: 'HTML', score: 3),
          _buildSkill(title: 'Javascript', score: 2),
          _buildSkill(title: 'CSS', score: 2),
          _buildSkill(title: 'React JS', score: 1),
          _buildSkill(title: 'React Native', score: 1),
        ],
      ),
    );
  }

  Widget _buildSkill({required String title, required int score}) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 5.h, 5.w, 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyleConfig.infoTitle),
          ScoreWidget(score: score),
        ],
      ),
    );
  }
}

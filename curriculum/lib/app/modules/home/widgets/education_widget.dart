import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../l10n/generated/l10n.dart';
import '../../../common/configs/color_config.dart';
import '../../../common/configs/text_style_config.dart';
import '../home_store.dart';

class EducationWidget extends StatefulWidget {
  const EducationWidget({super.key});

  @override
  State<EducationWidget> createState() => _EducationWidgetState();
}

class _EducationWidgetState extends State<EducationWidget> {
  late final HomeStore _store;

  @override
  void initState() {
    super.initState();
    _store = Modular.get<HomeStore>()..loadEducations();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildLine(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildIconAndTitle(context),
            Container(
              margin: EdgeInsets.only(top: 15.h),
              child: _buildExperiences(context),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLine() {
    return Positioned(
      left: 28.w,
      top: 17.h,
      bottom: 0,
      child: Container(
        width: 1.sp,
        color: ColorConfig.grey,
      ),
    );
  }

  Widget _buildIconAndTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: Row(
        children: [
          _buildIcon(),
          _buildTitle(context),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return Padding(
      padding: EdgeInsets.only(right: 4.w),
      child: FaIcon(FontAwesomeIcons.graduationCap, color: ColorConfig.background, size: 16.w),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      S.of(context).education,
      style: TextStyleConfig.title,
    );
  }

  Widget _buildCircle() {
    return Transform.translate(
      offset: Offset(-9.5.w, 3.h),
      child: FaIcon(FontAwesomeIcons.solidCircle, color: ColorConfig.background, size: 6.w),
    );
  }

  Widget _buildExperiences(BuildContext context) {
    return Observer(
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ..._store.educations.map(
              (experience) => _buildExperience(
                initialDate: experience.initialDate,
                finalDate: experience.finalDate,
                university: experience.university,
                location: experience.location,
                course: experience.course,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildExperience({required String initialDate, required String finalDate, required String university, required String location, required String course}) {
    return Transform.translate(
      offset: Offset(-15.w, 0),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDates(initialDate: initialDate, finalDate: finalDate),
            _buildCircle(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _builduniversity(university),
                  _buildlocation(location),
                  _buildcourse(course),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDates({required String initialDate, required String finalDate}) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: SizedBox(
        width: 40.w,
        child: Text(
          '$initialDate - $finalDate',
          style: TextStyleConfig.dateBody,
        ),
      ),
    );
  }

  Widget _builduniversity(String university) {
    return Text(university, style: TextStyleConfig.infoTitle);
  }

  Widget _buildlocation(String location) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Text(location, style: TextStyleConfig.infoBody.copyWith(fontWeight: FontWeight.w500)),
    );
  }

  Widget _buildcourse(String course) {
    return Text(
      course,
      style: TextStyleConfig.infoBody,
      textAlign: TextAlign.justify,
    );
  }
}

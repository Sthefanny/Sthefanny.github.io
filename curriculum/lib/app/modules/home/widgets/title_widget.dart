import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../l10n/generated/l10n.dart';
import '../../../common/configs/color_config.dart';
import '../../../common/configs/text_style_config.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildIcon(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildName(),
            _buildTitle(context),
          ],
        ),
      ],
    );
  }

  Widget _buildIcon() {
    return Padding(
      padding: EdgeInsets.only(right: 8.w),
      child: FaIcon(FontAwesomeIcons.earthAmericas, color: ColorConfig.background, size: 50.w),
    );
  }

  Widget _buildName() {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.sp),
      child: Text(
        'Sthefanny Gonzaga',
        style: TextStyleConfig.h1,
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      S.of(context).jobTitle,
      style: TextStyleConfig.h2,
    );
  }
}

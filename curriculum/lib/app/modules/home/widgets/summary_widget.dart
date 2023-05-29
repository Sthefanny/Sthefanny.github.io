import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../l10n/generated/l10n.dart';
import '../../../common/configs/color_config.dart';
import '../../../common/configs/text_style_config.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key});

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
              margin: EdgeInsets.only(top: 15.h, bottom: 20.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCircle(),
                  _buildDescription(context),
                ],
              ),
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
        width: 1.w,
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
      child: FaIcon(FontAwesomeIcons.bullseye, color: ColorConfig.background, size: 16.w),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      S.of(context).summary,
      style: TextStyleConfig.title,
    );
  }

  Widget _buildCircle() {
    return Padding(
      padding: EdgeInsets.only(left: 25.5.w, top: 3.h),
      child: FaIcon(FontAwesomeIcons.solidCircle, color: ColorConfig.background, size: 6.w),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 10.w),
        child: Text(
          S.of(context).summaryDescription,
          style: TextStyleConfig.infoBody,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}

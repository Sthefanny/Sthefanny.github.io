import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../configs/color_config.dart';

class ScoreWidget extends StatelessWidget {
  final maxScore = 5;
  final int score;
  const ScoreWidget({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Container(child: _buildScore());
  }

  Widget _buildScore() {
    var list = <Widget>[];

    for (var i = 0; i < maxScore; i++) {
      list.add(_buildCircle(isFilled: i < score));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        ...list,
      ],
    );
  }

  Widget _buildCircle({bool isFilled = false}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0.5.w),
      width: 8.w,
      height: 8.h,
      decoration: BoxDecoration(
        color: isFilled ? ColorConfig.background : ColorConfig.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}

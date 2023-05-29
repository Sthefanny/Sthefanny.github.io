import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'education_widget.dart';
import 'languages_widget.dart';
import 'lastest_experiences_widget.dart';
import 'personal_info_widget.dart';
import 'skills_widget.dart';
import 'summary_widget.dart';
import 'title_widget.dart';

class ResumeWidget extends StatelessWidget {
  const ResumeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 510.w,
          maxWidth: 900.w,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
            width: 540.w,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: _buildLeft()),
                    _buildRight(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLeft() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWidget(),
        Padding(
          padding: EdgeInsets.only(left: 10.w, right: 20.w, top: 10.h),
          child: Column(
            children: [
              SummaryWidget(),
              LastestExperiences(),
              EducationWidget(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRight() {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 100.w,
        maxWidth: 170.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PersonalInfoWidget(),
          SkillsWidget(),
          LanguagesWidget(),
        ],
      ),
    );
  }
}

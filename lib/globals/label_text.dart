import 'package:flutter/material.dart';
import 'package:todo/globals/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabelText extends StatelessWidget {
  final String text;

  LabelText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 12.h,
        bottom: 24.h,
      ),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          color: AppColors.textLabelLight,
          letterSpacing: 2.0,
        ),
      ),
    );
  }
}

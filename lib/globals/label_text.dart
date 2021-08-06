import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/globals/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/state.dart';

class LabelText extends StatelessWidget {
  final String text;

  LabelText({required this.text});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: true);
    return Padding(
      padding: EdgeInsets.only(
        top: 12.h,
        bottom: 24.h,
      ),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: appState.appTheme == AppTheme.LIGHT
              ? AppColors.textLabelLight
              : AppColors.textLabelDark,
          letterSpacing: 2.0,
        ),
      ),
    );
  }
}

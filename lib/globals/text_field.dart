import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final Function validator;

  AppTextField({
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 32.h),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: 8.h,
            horizontal: 32.w,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(80.r),
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(80.r),
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(80.r),
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0.0,
            ),
          ),
          fillColor: AppColors.bgAddTaskFieldLight,
          filled: true,
          hintText: hintText,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubmitTaskButton extends StatelessWidget {
  final VoidCallback onPressed;

  SubmitTaskButton({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 32.h),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0.0),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: 8.h),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(80.r),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          'Create task'.toUpperCase(),
        ),
      ),
    );
  }
}
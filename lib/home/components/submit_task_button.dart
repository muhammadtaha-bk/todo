import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubmitTaskButton extends StatelessWidget {
  final TextEditingController title;
  final TextEditingController? description;
  final TextEditingController? startDate;
  final TextEditingController? startTime;
  final VoidCallback onPressed;

  SubmitTaskButton({
    required this.title,
    this.description,
    this.startDate,
    this.startTime,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
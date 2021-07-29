import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerticalSizedBox extends StatelessWidget {
  final bool? isDivider;

  VerticalSizedBox({this.isDivider = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 8.h,
        ),
        SizedBox(
          height: 32.h,
          width: double.infinity,
          child: isDivider! ? Divider() : null,
        ),
        SizedBox(
          height: 16.h,
        ),
      ],
    );
  }
}

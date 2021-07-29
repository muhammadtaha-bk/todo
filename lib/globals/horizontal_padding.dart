import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalPadding extends StatelessWidget {
  final Widget child;

  HorizontalPadding({required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 56.w,
      ),
      child: child,
    );
  }
}

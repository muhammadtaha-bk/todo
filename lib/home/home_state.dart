import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/home/components/bottom_sheet_view.dart';
import 'package:todo/globals/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/state.dart';

class HomeState extends ChangeNotifier {

  // TODO: move to view
  void showBottomSheet(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: appState.appTheme == AppTheme.LIGHT
          ? AppColors.bgLight
          : AppColors.bgDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(80.r),
          topLeft: Radius.circular(80.r),
        ),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: ModalBottomSheet(),
        );
      },
    );
  }

  final addItem = TextEditingController();
  final title = TextEditingController();
  final description = TextEditingController();
  final startDate = TextEditingController();
  final startTime = TextEditingController();
}

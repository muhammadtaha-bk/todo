import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/task.dart';
import 'package:todo/state.dart';

class TodoItemCard extends StatelessWidget {
  final Task todoTask;
  final VoidCallback onMarkComplete;

  TodoItemCard({
    required this.todoTask,
    required this.onMarkComplete,
  });

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 56.w),
      margin: EdgeInsets.only(bottom: 24.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        color: appState.appTheme == AppTheme.LIGHT
            ? Colors.white
            : Color(0xff44446B),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.07),
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          iconTheme: IconThemeData(
              size: 48.sp,
              color: appState.appTheme == AppTheme.LIGHT
                  ? Colors.black
                  : Colors.white,
          ),
        ),
        child: ExpansionTile(
            leading: IconButton(
              onPressed: onMarkComplete,
              icon: Icon(
                Icons.check_box_outline_blank,
                color: Colors.green,
              ),
            ),
            childrenPadding: EdgeInsets.only(
              left: 240.w,
              right: 120.w,
            ),
            // childrenPadding: EdgeInsets.symmetric(horizontal: 240.w),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todoTask.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 60.sp,
                    color: appState.appTheme == AppTheme.LIGHT
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
                Text(
                  '${todoTask.startTime} - ${todoTask.startDate}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: appState.appTheme == AppTheme.LIGHT
                          ? Color(0xff6e6f84)
                          : Color(0xffC1C1DD),
                      fontSize: 36.sp),
                ),
              ],
            ),
            // subtitle: Text(
            //   '${todoTask.startTime} - ${todoTask.startDate}',
            //   maxLines: 1,
            //   overflow: TextOverflow.ellipsis,
            //   style: TextStyle(
            //       fontWeight: FontWeight.w400,
            //       color: Colors.grey,
            //       fontSize: 36.sp),
            // ),
            children: [
              //TODO
              Container(
                width: double.infinity,
                child: Text(
                  todoTask.description == ''
                      ? 'no description'
                      : '${todoTask.description}',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: appState.appTheme == AppTheme.LIGHT
                        ? Colors.grey
                        : Colors.grey.shade300,
                    fontSize: 48.sp,
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}

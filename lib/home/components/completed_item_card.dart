import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/task.dart';
import 'package:todo/state.dart';

class CompletedItemCard extends StatelessWidget {
  final Task completedTask;
  final onDelete;

  CompletedItemCard({required this.completedTask, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);

    return Container(
      color: appState.appTheme == AppTheme.LIGHT
          ? Colors.white
          : Color(0xff44446B),
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 56.w),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              // TODO
            },
            icon: Icon(
              Icons.check_box_outlined,
              color: Colors.green,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                completedTask.title,
                style: TextStyle(
                    color: appState.appTheme == AppTheme.LIGHT
                        ? Colors.black
                        : Colors.white,
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.bold,
                    fontSize: 60.sp),
              ),
              Text(
                '${completedTask.startTime} - ${completedTask.startDate}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    fontSize: 36.sp),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: onDelete,
            icon: Icon(
              Icons.delete_outline,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }
}

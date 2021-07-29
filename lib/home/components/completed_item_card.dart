import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/model/task.dart';

class CompletedItemCard extends StatelessWidget {
  final Task completedTask;

  CompletedItemCard({required this.completedTask});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 56.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              // TODO
            },
            icon: Icon(
              Icons.check_circle,
              color: Colors.green,
            ),
          ),
          Text(
            completedTask.title,
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
              color: Colors.grey,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                color: Colors.grey,
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                '${completedTask.startDate}',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/model/task.dart';

class TodoItemCard extends StatelessWidget {
  final Task todoTask;
  final VoidCallback onMarkComplete;

  TodoItemCard({required this.todoTask, required this.onMarkComplete});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 56.w),
      margin: EdgeInsets.only(bottom: 24.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onMarkComplete,
            icon: Icon(
              Icons.circle_outlined,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todoTask.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${todoTask.description}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                size: 48.sp,
              ),
              SizedBox(
                width: 12.w,
              ),
              Text(
                '${todoTask.startDate}',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

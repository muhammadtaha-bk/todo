import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/globals/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/globals/horizontal_padding.dart';
import 'package:todo/globals/label_text.dart';
import 'package:todo/globals/vertical_sized_box.dart';
import 'package:todo/home/components/completed_item_card.dart';
import 'package:todo/home/components/todo_item_card.dart';
import 'package:todo/home/home_state.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomeState>(context, listen: true);
    return Scaffold(
      backgroundColor: AppColors.bgLight,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              HorizontalPadding(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            print('pressed');
                          },
                          icon: Icon(
                            Icons.menu_outlined,
                            size: 112.sp,
                          ),
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(0xffFBDCA9),
                              radius: 12.r,
                              child: CircleAvatar(
                                backgroundColor: Color(0xffF5A623),
                                radius: 6.r,
                              ),
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Text(
                              'easyapproach'.toUpperCase(),
                              style: TextStyle(
                                fontSize: 72.sp,
                                color: AppColors.textLabelLight,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    VerticalSizedBox(),
                    TextField(
                      controller: state.addItem,
                      readOnly: true,
                      showCursor: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 8.h,
                          horizontal: 32.w,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80.r),
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80.r),
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80.r),
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0.0),
                        ),
                        fillColor: AppColors.bgAddTaskFieldLight,
                        filled: true,
                        hintText: 'Add Item',
                        suffixIcon: Container(
                          margin: EdgeInsets.all(16.r),
                          child: CircleAvatar(
                            child: IconButton(
                              onPressed: () {
                                state.showBottomSheet(context);
                              },
                              icon: Icon(Icons.add),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              VerticalSizedBox(
                isDivider: true,
              ),
              HorizontalPadding(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelText(text: 'Todo'),
                    SizedBox(height: 12.h),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.todoList.length,
                      itemBuilder: (context, index) {
                        return TodoItemCard(
                            todoTask: state.todoList.elementAt(index), onMarkComplete: () {
                              state.completeTask(index);
                        },);
                      },
                      shrinkWrap: true,
                    ),
                    VerticalSizedBox(),
                    LabelText(text: 'Completed'),
                    SizedBox(height: 12.h),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.completedList.length,
                      itemBuilder: (context, index) {
                        return CompletedItemCard(
                            completedTask:
                                state.completedList.elementAt(index),);
                      },
                      shrinkWrap: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeState(),
      child: HomeView(),
    );
  }
}

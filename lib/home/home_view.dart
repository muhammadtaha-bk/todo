import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:todo/globals/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/globals/horizontal_padding.dart';
import 'package:todo/globals/label_text.dart';
import 'package:todo/globals/vertical_sized_box.dart';
import 'package:todo/home/components/completed_item_card.dart';
import 'package:todo/home/components/todo_item_card.dart';
import 'package:todo/home/home_state.dart';
import 'package:todo/model/task.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/state.dart';

class HomeView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomeState>(context, listen: true);
    final appState = Provider.of<AppState>(context, listen: true);
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Container(
          color: appState.appTheme == AppTheme.LIGHT
              ? AppColors.bgLight
              : AppColors.bgDark,
          child: appState.appTheme == AppTheme.LIGHT
              ? IconButton(
                  onPressed: () {
                    appState.toggleTheme(AppTheme.LIGHT);
                  },
                  icon: Icon(
                    Icons.wb_sunny_rounded,
                    color: Colors.amberAccent,
                    size: 120.sp,
                  ),
                )
              : IconButton(
                  onPressed: () {
                    appState.toggleTheme(AppTheme.DARK);
                  },
                  icon: Icon(
                    Icons.nightlight_round_rounded,
                    color: Colors.purpleAccent,
                    size: 120.sp,
                  ),
                ),
        ),
      ),
      backgroundColor: appState.appTheme == AppTheme.LIGHT
          ? AppColors.bgLight
          : AppColors.bgDark,
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
                            _scaffoldKey.currentState!.openDrawer();
                          },
                          icon: Icon(
                            Icons.menu_outlined,
                            color: appState.appTheme == AppTheme.LIGHT
                                ? Color(0xff000000)
                                : Color(0xff6e6e8c),
                            //
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
                              appState.username.toUpperCase(),
                              style: TextStyle(
                                fontSize: 72.sp,
                                color: appState.appTheme == AppTheme.LIGHT
                                    ? AppColors.textLabelLight
                                    : AppColors.textLabelDark,
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
                        hintStyle: appState.appTheme == AppTheme.LIGHT
                            ? TextStyle(color: Color(0xff6e6f84))
                            : TextStyle(color: Color(0xffC1C1DD)),
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
                        fillColor: appState.appTheme == AppTheme.LIGHT
                            ? AppColors.bgAddTaskFieldLight
                            : AppColors.bgAddTaskFieldDark,
                        filled: true,
                        hintText: 'Add Task',
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
                    // TODO: todo task list
                    ValueListenableBuilder(
                      valueListenable: appState.taskBox.listenable(),
                      builder: (context, Box<Task> todoTasks, child) {
                        return todoTasks.isEmpty
                            ? Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
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
                                child: Center(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 40.h),
                                    child: Text(
                                      "Nothing to do",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color:
                                            appState.appTheme == AppTheme.LIGHT
                                                ? AppColors.textLabelLight
                                                : AppColors.textLabelDark,
                                        letterSpacing: 2.0,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: appState.todoList.length,
                                separatorBuilder: (context, _) => SizedBox(
                                  height: 32.h,
                                ),
                                itemBuilder: (context, index) {
                                  return TodoItemCard(
                                    todoTask:
                                        appState.todoList.elementAt(index),
                                    onMarkComplete: () {
                                      appState.completeTask(index);
                                    },
                                  );
                                },
                              );
                      },
                    ),
                    VerticalSizedBox(),
                    LabelText(text: 'Completed'),
                    SizedBox(height: 12.h),
                    // TODO: completed task list
                    ValueListenableBuilder(
                      valueListenable: appState.taskBox.listenable(),
                      builder: (context, Box<Task> completedTasks, child) {
                        return ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: appState.completedList.length,
                          separatorBuilder: (context, _) => SizedBox(
                            height: 32.h,
                          ),
                          itemBuilder: (context, index) {
                            return CompletedItemCard(
                              completedTask:
                                  appState.completedList.elementAt(index),
                              onDelete: () {
                                appState.deleteTask(index);
                              },
                            );
                          },
                        );
                      },
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

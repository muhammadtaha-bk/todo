import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/globals/colors.dart';
import 'package:todo/globals/horizontal_padding.dart';
import 'package:todo/globals/label_text.dart';
import 'package:todo/globals/text_field.dart';
import 'package:todo/globals/vertical_sized_box.dart';
import 'package:todo/home/components/submit_task_button.dart';
import 'package:todo/model/task.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';

class HomeState extends ChangeNotifier {
  List<Task> tasks = [];

  List<Task> get todoList =>
      tasks.where((element) => element.status == 'todo').toList();

  List<Task> get completedList =>
      tasks.where((element) => element.status == 'completed').toList();

  void addTask(Task task) {
    tasks.add(task);
    notifyListeners();
  }

  //Index todo ka
  void completeTask(int index) {
    int taskId = todoList.elementAt(index).id;
    Task task = tasks.firstWhere((element) => element.id == taskId);
    task.status = "completed";
    notifyListeners();
  }

  final _formKey = GlobalKey<FormState>();

  // move to view
  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: AppColors.bgLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(80.r),
            topLeft: Radius.circular(80.r),
          ),
        ),
        context: context,
        builder: (context) {
          return HorizontalPadding(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context)
                    .viewInsets
                    .bottom, // prevent keyboard from hiding bottom sheet
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  VerticalSizedBox(),
                  LabelText(text: 'Task details'),
                  VerticalSizedBox(isDivider: true),
                  Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        AppTextField(
                          controller: title,
                          hintText: 'Task title',
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                  errorText: 'Title must not be null'),
                              MaxLengthValidator(
                                15,
                                errorText:
                                    'Title must not exceed 15 characters',
                              ),
                              MinLengthValidator(
                                3,
                                errorText:
                                    'Title must be greater than 3 characters',
                              )
                            ],
                          ),
                        ),
                        AppTextField(
                          controller: description,
                          hintText: 'Description',
                          keyboardType: TextInputType.multiline,
                          validator: MaxLengthValidator(
                            150,
                            errorText:
                                'description must not exceed 150 characters',
                          ),
                        ),
                        AppTextField(
                            controller: startDate,
                            hintText: 'Start date',
                            keyboardType: TextInputType.datetime,
                            validator: DateValidator(
                              'dd/mm/yyyy',
                              errorText: 'Invalid Date',
                            )),
                        AppTextField(
                          controller: startTime,
                          hintText: 'Start time',
                          keyboardType: TextInputType.datetime,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Start time must not be null';
                            }
                            return null;
                          },
                        ),
                        VerticalSizedBox(
                          isDivider: true,
                        ),
                        SubmitTaskButton(
                          title: title,
                          description: description,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              addTask(
                                Task(
                                  status: 'todo',
                                  title: title.text,
                                  description: description.text,
                                  startDate: startDate.text,
                                  startTime: startTime.text,
                                ),
                              );
                              Navigator.pop(context);
                            } else {
                              showAlertDialog(context);
                            }
                            title.clear();
                            description.clear();
                            startDate.clear();
                            startTime.clear();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  showAlertDialog(context) {
    Widget okButton = ElevatedButton(
      child: Text("Okay"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Invalid task title"),
      content: Text("Task title cannot be null"),
      backgroundColor: AppColors.bgAddTaskFieldLight,
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  TextEditingController addItem = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController startTime = TextEditingController();
}

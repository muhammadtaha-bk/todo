import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:todo/globals/colors.dart';
import 'package:todo/globals/horizontal_padding.dart';
import 'package:todo/globals/label_text.dart';
import 'package:todo/globals/vertical_sized_box.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/home/components/submit_task_button.dart';
import 'package:todo/model/task.dart';
import 'package:todo/state.dart';

class ModalBottomSheet extends StatefulWidget {
  @override
  _ModalBottomSheetState createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  final title = TextEditingController();

  final description = TextEditingController();

  final startDate = TextEditingController();

  final startTime = TextEditingController();

  final timeFormat = MaskTextInputFormatter(
    mask: '##:##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  final dateFormat = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  final decoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(
      vertical: 8.h,
      horizontal: 32.w,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(80.r),
      borderSide: BorderSide(
        color: Colors.transparent,
        width: 0.0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(80.r),
      borderSide: BorderSide(
        color: Colors.transparent,
        width: 0.0,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(80.r),
      borderSide: BorderSide(
        color: Colors.transparent,
        width: 0.0,
      ),
    ),
    filled: true,
  );

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);

    return HorizontalPadding(
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
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 32.h),
                  child: TextFormField(
                    controller: title,
                    validator: MultiValidator(
                      [
                        RequiredValidator(errorText: 'Title must not be empty'),
                        MaxLengthValidator(
                          15,
                          errorText: 'Title must not exceed 15 characters',
                        ),
                        MinLengthValidator(
                          3,
                          errorText: 'Title must be greater than 3 characters',
                        )
                      ],
                    ),
                    style: appState.appTheme == AppTheme.LIGHT
                        ? TextStyle(color: Color(0xff6e6f84))
                        : TextStyle(color: Color(0xffC1C1DD)),
                    decoration: decoration.copyWith(
                      hintText: 'Task title',
                      fillColor: appState.appTheme == AppTheme.LIGHT
                          ? AppColors.bgAddTaskFieldLight
                          : AppColors.bgAddTaskFieldDark,
                      hintStyle: appState.appTheme == AppTheme.LIGHT
                          ? TextStyle(color: Color(0xff6e6f84))
                          : TextStyle(color: Color(0xffC1C1DD)),

                    ),
                  ),
                ),
                TextFormField(
                  controller: description,
                  validator: MaxLengthValidator(
                    150,
                    errorText: 'description must not exceed 150 characters',
                  ),
                  keyboardType: TextInputType.multiline,
                  style: appState.appTheme == AppTheme.LIGHT
                      ? TextStyle(color: Color(0xff6e6f84))
                      : TextStyle(color: Color(0xffC1C1DD)),
                  decoration: decoration.copyWith(
                    hintText: 'Description',
                    fillColor: appState.appTheme == AppTheme.LIGHT
                        ? AppColors.bgAddTaskFieldLight
                        : AppColors.bgAddTaskFieldDark,
                    hintStyle: appState.appTheme == AppTheme.LIGHT
                        ? TextStyle(color: Color(0xff6e6f84))
                        : TextStyle(color: Color(0xffC1C1DD)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 32.h),
                  child: TextFormField(
                    controller: startDate,
                    inputFormatters: [dateFormat],
                    validator: MultiValidator([
                      RequiredValidator(
                        errorText: 'Start date must not be empty',
                      ),
                      DateValidator(
                        'dd/mm/yyyy',
                        errorText: 'Date must be in (dd/mm/yyyy) format',
                      ),
                    ]),
                    keyboardType: TextInputType.datetime,
                    style: appState.appTheme == AppTheme.LIGHT
                        ? TextStyle(color: Color(0xff6e6f84))
                        : TextStyle(color: Color(0xffC1C1DD)),
                    decoration: decoration.copyWith(
                      hintText: 'Start date',
                      fillColor: appState.appTheme == AppTheme.LIGHT
                          ? AppColors.bgAddTaskFieldLight
                          : AppColors.bgAddTaskFieldDark,
                      hintStyle: appState.appTheme == AppTheme.LIGHT
                          ? TextStyle(color: Color(0xff6e6f84))
                          : TextStyle(color: Color(0xffC1C1DD)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 32.h),
                  child: TextFormField(
                    controller: startTime,
                    inputFormatters: [timeFormat],
                    validator: RequiredValidator(
                      errorText: 'Start time must not be empty',
                    ),
                    keyboardType: TextInputType.datetime,
                    style: appState.appTheme == AppTheme.LIGHT
                        ? TextStyle(color: Color(0xff6e6f84))
                        : TextStyle(color: Color(0xffC1C1DD)),
                    decoration: decoration.copyWith(
                      hintText: 'Start time',
                      fillColor: appState.appTheme == AppTheme.LIGHT
                          ? AppColors.bgAddTaskFieldLight
                          : AppColors.bgAddTaskFieldDark,
                      hintStyle: appState.appTheme == AppTheme.LIGHT
                          ? TextStyle(color: Color(0xff6e6f84))
                          : TextStyle(color: Color(0xffC1C1DD)),
                    ),
                  ),
                ),
                VerticalSizedBox(
                  isDivider: true,
                ),
                SubmitTaskButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      appState.addTask(
                        Task(
                          status: 'todo',
                          title: title.text,
                          description: description.text,
                          startDate: startDate.text,
                          startTime: startTime.text,
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

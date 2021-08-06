import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:todo/globals/routes.dart';
import 'package:todo/model/task.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/state.dart';

Future<void> main() async {
  Hive.registerAdapter<Task>(TaskAdapter());
  await Hive.initFlutter();
  await Hive.openBox<Task>('taskBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 1920),
      builder: () {
        return ChangeNotifierProvider(
          create: (context) => AppState(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: AppRoutes.routes,
            initialRoute: AppRoutes.home,
          ),
        );
      },
    );
  }
}

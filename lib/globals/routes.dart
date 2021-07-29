import 'package:flutter/material.dart';
import 'package:todo/home/home_view.dart';

class AppRoutes{
  static final home = "/home";

  static final routes = {
    home : (BuildContext context) => HomeWidget(),
  };
}

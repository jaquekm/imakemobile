import 'package:flutter/material.dart';
import 'package:imakemobile/Login/login_screen.dart';
import 'package:imakemobile/devsInfo/devs_info_page.dart';
import 'package:imakemobile/routes/pages.dart';
import 'package:imakemobile/splash_screen.dart';
import 'package:imakemobile/tasks/data/local/model/task_model.dart';
import 'package:imakemobile/tasks/presentation/pages/new_task_screen.dart';
import 'package:imakemobile/tasks/presentation/pages/tasks_screen.dart';
import 'package:imakemobile/tasks/presentation/pages/update_task_screen.dart';

import '../page_not_found.dart';

Route onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case Pages.initial:
      return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      );
    case Pages.login:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    case Pages.about:
      return MaterialPageRoute(
        builder: (context) => const AboutPage(),
      );
    case Pages.home:
      return MaterialPageRoute(
        builder: (context) => const TasksScreen(),
      );
    case Pages.createNewTask:
      return MaterialPageRoute(
        builder: (context) => const NewTaskScreen(),
      );
    case Pages.updateTask:
      final args = routeSettings.arguments as TaskModel;
      return MaterialPageRoute(
        builder: (context) => UpdateTaskScreen(taskModel: args),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const PageNotFound(),
      );
  }
}

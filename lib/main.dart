import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:imakemobile/routes/app_router.dart';
import 'package:imakemobile/bloc_state_observer.dart';
import 'package:imakemobile/routes/pages.dart';
import 'package:imakemobile/tasks/data/local/data_sources/tasks_data_provider.dart';
import 'package:imakemobile/tasks/data/repository/task_repository.dart';
import 'package:imakemobile/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:imakemobile/utils/color_palette.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BlocStateOberver();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initializeDateFormatting('pt_BR', null).then((_) => runApp(MyApp(
        preferences: preferences,
      )));
}

class MyApp extends StatelessWidget {
  final SharedPreferences preferences;

  const MyApp({super.key, required this.preferences});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) =>
            TaskRepository(taskDataProvider: TaskDataProvider(preferences)),
        child: BlocProvider(
            create: (context) => TasksBloc(context.read<TaskRepository>()),
            child: MaterialApp(
              title: 'Gerenciador de Tarefas',
              debugShowCheckedModeBanner: false,
              initialRoute: Pages.initial,
              onGenerateRoute: onGenerateRoute,
              theme: ThemeData(
                fontFamily: 'Sora',
                visualDensity: VisualDensity.adaptivePlatformDensity,
                canvasColor: const Color.fromARGB(0, 32, 32, 32),
                colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
                useMaterial3: true,
              ),
            )));
  }
}

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/network/network_info.dart';
import 'package:todo/data/datasources/remote/task.dart';
import 'package:todo/viewmodel/tasks_model.dart';
import 'package:todo/data/repositories/task_repository_impl.dart';
import 'package:todo/presentation/pages/TodoListPage.dart';

void main() {
  // 最初に表示するWidget
  runApp(MyTodoApp());
}

final tasksViewModel = TasksViewModel(
    repository: TaskRepositoryImpl(
        networkInfo: NetworkInfoImpl(DataConnectionChecker()),
        remoteDataSource: TaskRemoteDataSourceImpl(client: new Dio())));

class MyTodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Todo App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: TodoListPage(),
      ),
      providers: [
        ChangeNotifierProvider<TasksViewModel>.value(value: tasksViewModel),
      ],
    );
  }
}

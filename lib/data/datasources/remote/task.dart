import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:todo/core/error/exceptions.dart';
import 'package:todo/domain/entities/task.dart';

abstract class TaskRemoteDataSource {
  Future<List<TaskModel>> getAllTaskList();
//   Future<List<TaskModel>> getIncompletedTaskList();
//   Future<List<TaskModel>> getDoneTaskList();
//   Future<TaskModel> createTask(String title);
//   Future<TaskModel> updateTodo(TaskModel task);
//   Future<Null> deleteTodo(int taskId);
//   Future<TaskModel> doneTodo(int taskId);
//   Future<TaskModel> undoTodo(int taskId);
}

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  final Dio client;
//   GreeterClient

  TaskRemoteDataSourceImpl({@required this.client});

  @override
  Future<List<TaskModel>> getAllTaskList() =>
      _getTaskFromUrl('http://localhost:9800/tasks');
//   @override
//   Future<List<TaskModel>> getDoneTaskList() =>
//       _getTaskFromUrl('http://localhost:9800/tasks/done');
//   @override
//   Future<List<TaskModel>> getIncompletedTaskList() =>
//       _getTaskFromUrl('http://localhost:9800/tasks/incomplete');
//   @override
//   Future<TaskModel> createTask(title) =>
//       storeTask('http://localhost:9800/tasks', title);
//   @override
//   Future<Null> deleteTodo(taskId) =>
//       deleteTask('http://localhost:9800/tasks', taskId);
//   @override
//   Future<TaskModel> doneTodo(taskId) =>
//       doneTask('http://localhost:9800/tasks', taskId);
//   @override
//   Future<TaskModel> updateTodo(task) =>
//       updateTask('http://localhost:9800/tasks', task);
//   @override
//   Future<TaskModel> undoTodo(taskId) =>
//       undoTask('http://localhost:9800/tasks', taskId);

  Future<List<TaskModel>> _getTaskFromUrl(String url) async {
    final response = await client.get(url);

    if (response.statusCode == 200) {
      return (response.data as List).map((e) => TaskModel.fromJson(e)).toList();
    } else {
      throw ServerException();
    }
  }

//   Future<TaskModel> storeTask(String url, String title) async {
//     final body = {'title': title};
//     final headers = {'Content-Type': 'application/json'};
//     // これはできない、Genericsでエラーが出る
//     // await client.post<TaskModel>(url, data: body, options: Options(headers: headers));
//     final response =
//         await client.post(url, data: body, options: Options(headers: headers));
//     if (response.statusCode == 200) {
//       return TaskModel.fromJson(response.data);
//     } else {
//       throw ServerException();
//     }
//   }

//   Future<Null> deleteTask(String url, int taskId) async {
//     final response = await client.delete(url + '/${taskId.toString()}');
//     if (response.statusCode == 200) {
//       return null;
//     } else {
//       throw ServerException();
//     }
//   }

//   Future<TaskModel> updateTask(String url, TaskModel task) async {
//     final body = {'title': task.title, 'done': task.done};
//     final headers = {'Content-Type': 'application/json'};
//     final response = await client.put(url + '/${task.taskID.toString()}',
//         data: body, options: Options(headers: headers));
//     if (response.statusCode == 200) {
//       return TaskModel.fromJson(response.data);
//     } else {
//       throw ServerException();
//     }
//   }

//   Future<TaskModel> doneTask(String url, int taskId) async {
//     final body = {};
//     final headers = {'Content-Type': 'application/json'};
//     final response = await client.patch(url + '/${taskId.toString()}/done',
//         data: body, options: Options(headers: headers));
//     if (response.statusCode == 200) {
//       return TaskModel.fromJson(response.data);
//     } else {
//       throw ServerException();
//     }
//   }

//   Future<TaskModel> undoTask(String url, int taskId) async {
//     final body = {};
//     final headers = {'Content-Type': 'application/json'};
//     final response = await client.patch(url + '/${taskId.toString()}/done',
//         data: body, options: Options(headers: headers));
//     if (response.statusCode == 200) {
//       return TaskModel.fromJson(response.data);
//     } else {
//       throw ServerException();
//     }
//   }
}

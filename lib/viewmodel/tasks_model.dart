import 'package:flutter/material.dart';
import 'package:todo/domain/entities/task.dart';
import 'package:todo/domain/repositories/task_repository.dart';

class TasksViewModel extends ChangeNotifier {
  final TaskRepository repository;
  TasksViewModel({@required this.repository}) {
    getTodos();
  }

  List<TaskModel> tasks = [];

  List<TaskModel> get doneTasks {
    return tasks.where((task) => task.done).toList();
  }
  List<TaskModel> get uncompletedTasks {
    return tasks.where((task) => !task.done).toList();
  }

  //   全てのタスクを取得する
  Future<void> getTodos() async {
    final response = await repository.getAllTaskList();
    if (response.isRight()) {
      tasks = response.getOrElse(null);
      notifyListeners();
    }
  }

  //   完了済のタスクを取得する
  Future<void> getDoneTodos() async {
    final response = await repository.getDoneTaskList();
    if (response.isRight()) {
      tasks = response.getOrElse(null);
      notifyListeners();
    }
  }

  ///   対象のタスクを未完了状態にする
  Future<void> toggleUndo(int taskId) async {
    var foundedTaskIdx = tasks.indexWhere((task) => task.taskID == taskId);
    final response = await repository.undoTodo(taskId);

    if (response.isRight()) {
      tasks[foundedTaskIdx] = tasks[foundedTaskIdx].copyWith(done: false);
      notifyListeners();
    }
  }

//   タスクを追加する
  Future<void> addTodo(TaskModel item) async {
    final response = await repository.createTask(item.title);
    if (response.isRight()) {
      tasks.add(response.getOrElse(null));
      notifyListeners();
    }
  }

  ///   対象のタスクを完了状態にする
  Future<void> toggleDone(int taskId) async {
    var foundedTaskIdx = tasks.indexWhere((task) => task.taskID == taskId);
    final response = await repository.doneTodo(taskId);

    if (response.isRight()) {
      tasks[foundedTaskIdx] = tasks[foundedTaskIdx].copyWith(done: true);
      notifyListeners();
    }
  }

  ///   対象のタスクを削除する
  Future<void> deleteTask(int taskId) async {
    var foundedTaskIdx = tasks.indexWhere((task) => task.taskID == taskId);
    final response = await repository.deleteTodo(taskId);

    if (response.isRight()) {
      tasks.removeAt(foundedTaskIdx);
      notifyListeners();
    }
  }
}

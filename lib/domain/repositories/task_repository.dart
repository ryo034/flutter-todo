import 'package:dartz/dartz.dart';
import 'package:todo/core/error/failures.dart';
import 'package:todo/domain/entities/task.dart';

abstract class TaskRepository {
  Future<Either<Failure, List<TaskModel>>> getAllTaskList();
  Future<Either<Failure, List<TaskModel>>> getDoneTaskList();
  Future<Either<Failure, List<TaskModel>>> getIncompletedTaskList();
  Future<Either<Failure, TaskModel>> createTask(String title);
  Future<Either<Failure, TaskModel>> updateTodo(TaskModel task);
  Future<Either<Failure, Null>> deleteTodo(int taskId);
  Future<Either<Failure, TaskModel>> doneTodo(int taskId);
  Future<Either<Failure, TaskModel>> undoTodo(int taskId);
}

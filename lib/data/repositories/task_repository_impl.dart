import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/error/exceptions.dart';
import 'package:todo/core/error/failures.dart';
import 'package:todo/core/network/network_info.dart';
import 'package:todo/data/datasources/remote/task.dart';
import 'package:todo/domain/entities/task.dart';
import 'package:todo/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  TaskRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<TaskModel>>> getAllTaskList() async {
    return await _getTasks();
  }
  @override
  Future<Either<Failure, List<TaskModel>>> getDoneTaskList() async {
    return await _getDoneTasks();
  }
  @override
  Future<Either<Failure, List<TaskModel>>> getIncompletedTaskList() async {
    return await _getIncompletedTasks();
  }

  @override
  Future<Either<Failure, TaskModel>> createTask(String title) async {
    try {
      final data = await remoteDataSource.createTask(title);
      return Right(data);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, TaskModel>> doneTodo(int taskID) async {
    try {
      final data = await remoteDataSource.doneTodo(taskID);
      return Right(data);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Null>> deleteTodo(int taskID) async {
    try {
      await remoteDataSource.deleteTodo(taskID);
      return Right(null);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, TaskModel>> updateTodo(TaskModel task) async {
    try {
      final data = await remoteDataSource.updateTodo(task);
      return Right(data);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, List<TaskModel>>> _getTasks() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTasks = await remoteDataSource.getAllTaskList();
        return Right(remoteTasks);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return null;
    }
  }

  Future<Either<Failure, List<TaskModel>>> _getIncompletedTasks() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTasks = await remoteDataSource.getIncompletedTaskList();
        return Right(remoteTasks);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return null;
    }
  }

  @override
  Future<Either<Failure, TaskModel>> undoTodo(int taskID) async {
    try {
      final data = await remoteDataSource.undoTodo(taskID);
      return Right(data);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, List<TaskModel>>> _getDoneTasks() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTasks = await remoteDataSource.getDoneTaskList();
        return Right(remoteTasks);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return null;
    }
  }
}

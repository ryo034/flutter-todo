import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'task.freezed.dart';

// dartでTaskというクラスが既に使用されているため、TaskModelという命名にする
@freezed
abstract class TaskModel with _$TaskModel {
  const factory TaskModel({
    int taskID,
    String title,
    bool done,
    String createdAt,
    String updatedAt,
  }) = _TaskModel;

  factory TaskModel.fromJson(json) {
    return TaskModel(
      taskID: json['taskID'] as int,
      title: json['title'] as String,
      done: json['done'] as bool,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );
  }
}

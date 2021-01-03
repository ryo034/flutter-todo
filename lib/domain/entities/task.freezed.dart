// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$TaskModelTearOff {
  const _$TaskModelTearOff();

// ignore: unused_element
  _TaskModel call(
      {int taskID,
      String title,
      bool done,
      String createdAt,
      String updatedAt}) {
    return _TaskModel(
      taskID: taskID,
      title: title,
      done: done,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $TaskModel = _$TaskModelTearOff();

/// @nodoc
mixin _$TaskModel {
  int get taskID;
  String get title;
  bool get done;
  String get createdAt;
  String get updatedAt;

  $TaskModelCopyWith<TaskModel> get copyWith;
}

/// @nodoc
abstract class $TaskModelCopyWith<$Res> {
  factory $TaskModelCopyWith(TaskModel value, $Res Function(TaskModel) then) =
      _$TaskModelCopyWithImpl<$Res>;
  $Res call(
      {int taskID,
      String title,
      bool done,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class _$TaskModelCopyWithImpl<$Res> implements $TaskModelCopyWith<$Res> {
  _$TaskModelCopyWithImpl(this._value, this._then);

  final TaskModel _value;
  // ignore: unused_field
  final $Res Function(TaskModel) _then;

  @override
  $Res call({
    Object taskID = freezed,
    Object title = freezed,
    Object done = freezed,
    Object createdAt = freezed,
    Object updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      taskID: taskID == freezed ? _value.taskID : taskID as int,
      title: title == freezed ? _value.title : title as String,
      done: done == freezed ? _value.done : done as bool,
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as String,
      updatedAt: updatedAt == freezed ? _value.updatedAt : updatedAt as String,
    ));
  }
}

/// @nodoc
abstract class _$TaskModelCopyWith<$Res> implements $TaskModelCopyWith<$Res> {
  factory _$TaskModelCopyWith(
          _TaskModel value, $Res Function(_TaskModel) then) =
      __$TaskModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int taskID,
      String title,
      bool done,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class __$TaskModelCopyWithImpl<$Res> extends _$TaskModelCopyWithImpl<$Res>
    implements _$TaskModelCopyWith<$Res> {
  __$TaskModelCopyWithImpl(_TaskModel _value, $Res Function(_TaskModel) _then)
      : super(_value, (v) => _then(v as _TaskModel));

  @override
  _TaskModel get _value => super._value as _TaskModel;

  @override
  $Res call({
    Object taskID = freezed,
    Object title = freezed,
    Object done = freezed,
    Object createdAt = freezed,
    Object updatedAt = freezed,
  }) {
    return _then(_TaskModel(
      taskID: taskID == freezed ? _value.taskID : taskID as int,
      title: title == freezed ? _value.title : title as String,
      done: done == freezed ? _value.done : done as bool,
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as String,
      updatedAt: updatedAt == freezed ? _value.updatedAt : updatedAt as String,
    ));
  }
}

/// @nodoc
class _$_TaskModel with DiagnosticableTreeMixin implements _TaskModel {
  const _$_TaskModel(
      {this.taskID, this.title, this.done, this.createdAt, this.updatedAt});

  @override
  final int taskID;
  @override
  final String title;
  @override
  final bool done;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TaskModel(taskID: $taskID, title: $title, done: $done, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TaskModel'))
      ..add(DiagnosticsProperty('taskID', taskID))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('done', done))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TaskModel &&
            (identical(other.taskID, taskID) ||
                const DeepCollectionEquality().equals(other.taskID, taskID)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.done, done) ||
                const DeepCollectionEquality().equals(other.done, done)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(taskID) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(done) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt);

  @override
  _$TaskModelCopyWith<_TaskModel> get copyWith =>
      __$TaskModelCopyWithImpl<_TaskModel>(this, _$identity);
}

abstract class _TaskModel implements TaskModel {
  const factory _TaskModel(
      {int taskID,
      String title,
      bool done,
      String createdAt,
      String updatedAt}) = _$_TaskModel;

  @override
  int get taskID;
  @override
  String get title;
  @override
  bool get done;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  _$TaskModelCopyWith<_TaskModel> get copyWith;
}

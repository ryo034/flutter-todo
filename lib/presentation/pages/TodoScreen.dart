import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo/viewmodel/tasks_model.dart';

class TaskListItem extends StatelessWidget {
  final int taskId;
  final String title;
  TaskListItem({this.taskId, this.title});

  @override
  Widget build(BuildContext context) {
    var taskModel = Provider.of<TasksViewModel>(context);
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        color: Colors.white,
        child: ListTile(title: Text(title)),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Done',
          color: Colors.green,
          icon: Icons.edit,
          onTap: () async => await taskModel.toggleDone(taskId),
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () async => await taskModel.deleteTask(taskId),
        ),
      ],
    );
  }
}

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksViewModel>(builder: (context, value, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return TaskListItem(
              taskId: value.uncompletedTasks[index].taskID,
              title: value.uncompletedTasks[index].title);
        },
        itemCount: value.uncompletedTasks.length,
      );
    });
  }
}

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green[100],
          title: Text(
            'Todo一覧',
            style: TextStyle(fontSize: 24),
          ),
        ),
        body: TaskList());
  }
}

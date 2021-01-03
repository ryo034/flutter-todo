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
    var doneTasksViewModel = Provider.of<TasksViewModel>(context);
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        color: Colors.white,
        child: ListTile(title: Text(title)),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Undo',
          color: Colors.green,
          icon: Icons.edit,
          onTap: () async => await doneTasksViewModel.toggleUndo(taskId),
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
              taskId: value.doneTasks[index].taskID,
              title: value.doneTasks[index].title);
        },
        itemCount: value.doneTasks.length,
      );
    });
  }
}

class CompletedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green[100],
          title: Text(
            '完了済Todo一覧',
            style: TextStyle(fontSize: 24),
          ),
        ),
        body: TaskList());
  }
}

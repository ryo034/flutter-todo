// リスト一覧画面用Widget
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grpc/grpc.dart';
import 'package:todo/proto/task/task.pbgrpc.dart';

// var client = GreeterClient(
var client = TaskServiceClient(
  ClientChannel(
    '127.0.0.1',
    port: 50051,
    options: ChannelOptions(
      credentials: ChannelCredentials.insecure(),
      idleTimeout: Duration(minutes: 1),
    ),
  ),
);

class SamplePage extends StatefulWidget {
  @override
  _SamplePageState createState() => _SamplePageState();
}

// リスト一覧画面用Widget
class _SamplePageState extends State<SamplePage> {
  PageController pageController;
  List<Task> listItem;
  int _screen = 0;

  Future<GetTasksResponse> getTasks() async {
    var res = await client.getTasks(GetTasksRequest());
    return res;
  }

  @override
  void initState() {
    super.initState();
    // コントローラ作成
    // 初期ページの指定。上記で_screenを１とすれば２番目のページが初期表示される。
    pageController = PageController(initialPage: _screen);
  }

  @override
  void dispose() {
    // コントローラ破棄
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Text(listItem[index].title);
          //   return Text('a');
        },
        // itemCount: listItem.length,
        itemCount: listItem.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var data = await getTasks();
          setState(() {
            listItem = data.tasks;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

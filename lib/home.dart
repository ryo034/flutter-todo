import 'package:flutter/material.dart';
import 'core/shared_prefs.dart';
import 'completed_tasks.dart';

var homePageKey = GlobalKey<_HomePageState>();

void openPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Next page'),
        ),
        body: const Center(
          child: Text(
            'This is the next page',
            style: TextStyle(fontSize: 24),
          ),
        ),
      );
    },
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> listItems = [];
  List<String> completedItems = [];

  bool _validate = false;

  final TextEditingController eCtrl = TextEditingController();

  void _init() async {
    //インスタンスを取得
    await SharePrefs.setInstance();
    //Listにデータを取得させる
    listItems = SharePrefs.getListItems();
    completedItems = SharePrefs.getCompletedItems();
    setState(() {});
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  void dispose() {
    //ページがdispose（ページの切り替え？）が起きたときに
    //コントローラーの中身を削除する
    eCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do list App"),
        backgroundColor: Colors.blueAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              setState(() {});
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CompletedTasks(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Next page',
            onPressed: () {
              openPage(context);
            },
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.7),
                    color: Colors.white),
                margin: EdgeInsets.all(5.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: eCtrl,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Things to do",
                          errorText: _validate ? 'The input is empty.' : null,
                          contentPadding: const EdgeInsets.only(
                              left: 25.0, bottom: 15.0, top: 15.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                        ),
                        autocorrect: true,
                        onSubmitted: (text) {
                          if (text.isEmpty) {
                            _validate = true;
                            setState(() {});
                          } else {
                            _validate = false;
                            completedItems.add('false');
                            listItems.add(text);
                            SharePrefs.setCompletedItems(completedItems)
                                .then((_) {
                              setState(() {});
                            });
                            SharePrefs.setListItems(listItems).then((_) {
                              setState(() {});
                            });
                            eCtrl.clear();
                          }
                        },
                      ),
                    ),
                    Container(
                      height: 70,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.7)),
                        onPressed: () {},
                        color: Colors.blueAccent,
                        child: IconButton(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          color: Colors.white,
                          hoverColor: Colors.white,
                          icon: Icon(
                            IconData(57669, fontFamily: 'MaterialIcons'),
                          ),
                          onPressed: () {
                            if (eCtrl.text.isEmpty) {
                              _validate = true;
                              setState(() {});
                            } else {
                              _validate = false;
                              completedItems.add('false');
                              listItems.add(eCtrl.text);
                              SharePrefs.setListItems(listItems).then((_) {
                                //setStateで現在いるページのStateを更新する。
                                setState(() {});
                              });
                              SharePrefs.setCompletedItems(completedItems)
                                  .then((_) {
                                setState(() {});
                              });
                              eCtrl.clear();
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: listItems.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(child: Text(listItems[index])),
                            Container(
                              width: 40,
                              child: InkWell(
                                  child: Icon(
                                    Icons.remove_circle,
                                    color: Colors.redAccent,
                                  ),
                                  onTap: () {
                                    listItems.removeAt(index);
                                    completedItems.removeAt(index);
                                    SharePrefs.setListItems(listItems)
                                        .then((_) {
                                      setState(() {});
                                    });
                                    SharePrefs.setCompletedItems(completedItems)
                                        .then((_) {
                                      setState(() {});
                                    });
                                  }),
                            ),
                            Container(
                                width: 30,
                                child: InkWell(
                                  child: Icon(
                                    (completedItems[index] == 'false')
                                        ? Icons.check_box_outline_blank
                                        : Icons.check_box,
                                    color: Colors.greenAccent,
                                  ),
                                  onTap: () {
                                    if (completedItems[index] == 'false') {
                                      completedItems[index] = 'true';
                                    } else {
                                      completedItems[index] = 'false';
                                    }
                                    setState(() {});
                                  },
                                )),
                          ],
                        ),
                        onTap: () {
                          setState(() {});
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

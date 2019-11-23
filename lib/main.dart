import 'package:flutter/material.dart';
import 'package:flutter_train/ManageGroups.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new ListDisplay(),
    );
  }
}

class ListDisplay extends StatefulWidget {
  @override
  State createState() => new DynamicList();
}

class DynamicList extends State<ListDisplay> {
  List<String> trains = [];
  final TextEditingController eCtrl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("xTrain"),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Mein xTrain'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Meine Gruppen'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ManageGroups()),
                  );
                },
              ),
            ],
          ),
        ),
        body: new Column(
          children: <Widget>[
            new TextField(
              controller: eCtrl,
              decoration: new InputDecoration(hintText: "Start a Train"),
              onSubmitted: (trainName) {
                if (trainName.length > 0) {
                  trains.add(trainName);
                  eCtrl.clear();
                  setState(() {});
                }
              },
            ),
            new Expanded(
                child: new ListView.builder(
                    itemCount: trains.length,
                    itemBuilder: (BuildContext buildContext, int index) {
                      return Card(
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    '${trains[index]}',
                                    style: TextStyle(fontSize: 22.0),
                                  ),
                                ),
                                Expanded(
                                  child: Text("0"),
                                )
                              ],
                            )),
                      );
                    }))
          ],
        ));
  }
}

/*void main() {
  //List<String> tmpList = ["Meking", "Aldi", "Tankstelle"];
  runApp(DyanmicList)(
    //items: List<String>.generate(10000, (i) => "Item $i"),
    //items: tmpList,
  ));
}


class MyApp extends StatelessWidget {
  List<String> items;

  MyApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Fluttr-Train';
    final TextEditingController ctrl = new TextEditingController();

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: new Column (
          children: <Widget>[
            new TextField(
              controller: ctrl,
              decoration: new InputDecoration.collapsed(hintText: "Train Name"),
              onSubmitted: (text) {
                items.add(text);
                print(text);
                ctrl.clear();
              },
            ),
            new Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text('${items[index]}',
                            style: TextStyle(fontSize: 22.0),),
                        ),
                      );
                    }, //itemBuilder
                  ),)
          ]
        )
      ),
    );
  }
}

 */

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
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
  List<String> lItems = [];
  final TextEditingController eCtrl = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Fluttr Train"),),
      body: new Column(
        children: <Widget>[
            new TextField(
              controller: eCtrl,
              decoration: new InputDecoration(hintText: "Add new Train"),
              onSubmitted: (text) {
                if(text.length > 0) {
                  lItems.add(text);
                  eCtrl.clear();
                  setState(() {});
                }
              },
            ),
          new Expanded(
              child: new ListView.builder
                (
                  itemCount: lItems.length,
                  itemBuilder: (BuildContext ctxt, int Index) {
                    return Card (
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row (
                          children: <Widget>[
                            Expanded (
                              child:
                                Text('${lItems[Index]}',
                                  style: TextStyle(fontSize: 22.0),),
                            ),
                            Expanded (
                              
                              child: Text("0"),
                            )
                          ],
                        )

                      ),
                    );
                  }
              )
          )
        ],
      )
    );
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
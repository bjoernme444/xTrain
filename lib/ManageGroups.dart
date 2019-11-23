import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'GroupList.dart';

class ManageGroups extends StatelessWidget {
  TextEditingController _textFieldController = TextEditingController();

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Neue Gruppe'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Name der Gruppe..."),
              autofocus: true,            
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Abbrechen'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text('Anlegen'),
                onPressed: () {
                  print('Pressed: ${_textFieldController.value.text}');
                  final value = _textFieldController.value.text;
                  Firestore.instance.collection('groups').add({'name': value}).then((_) {
                    Navigator.of(context).pop();
                  });
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meine Gruppen'),
      ),
      body: Center(
        child: GroupList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _displayDialog(context),
        backgroundColor: Colors.green,
      ),
    );
  }
}

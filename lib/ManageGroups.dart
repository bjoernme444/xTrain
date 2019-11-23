import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'GroupList.dart';

class ManageGroups extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meine Gruppen'),
      ),
      body: Center(
        child: GroupList()
      ),
    );
  }
}

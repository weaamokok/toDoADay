import 'package:flutter/material.dart';
import 'package:to_do_a_day/elements/widgets/toDosContainer.dart';

import '../elements/const.dart';
import '../elements/widgets/archiveContainer.dart';

class ArchiveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: conPrimaryY,
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_rounded),
              color: Colors.white,
              iconSize: 30,
            ),
          ),
          elevation: 0,
          backgroundColor: conPrimaryY,
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 18.0),
          child: archiveContainer(),
        ));
  }
}

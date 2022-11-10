import 'package:flutter/material.dart';
import 'package:to_do_a_day/elements/module/task.dart';
import 'package:to_do_a_day/elements/widgets/addingTodo.dart';
import 'package:to_do_a_day/elements/widgets/tasksList.dart';
import 'package:provider/provider.dart';
import 'package:to_do_a_day/elements/module/task_data.dart';
import '../const.dart';
import 'package:empty_widget/empty_widget.dart';

import '../module/databaseHelper.dart';
import 'archiveList.dart';

class archiveContainer extends StatelessWidget {
  final db = DatabaseHandler();
  @override
  Widget build(BuildContext context) {
    return Container(
        //the to dos  container

        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                  onPressed: () {
                    TaskData().ArchiveEmpty();
                  },
                  child: Container(
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.only(top: 6),
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: conActPriorityR, width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Text(
                      'Empty archive',
                      textAlign: TextAlign.center,
                      style: connotifacationTimeTextStyle.copyWith(
                          color: conActPriorityR, fontSize: 13),
                    ),
                  )),
            ),
            ArchiveLists()
          ],
        ) //here goes the Empty List or the checkList
        );
  }
}

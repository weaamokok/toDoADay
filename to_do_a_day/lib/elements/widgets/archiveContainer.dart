import 'package:flutter/material.dart';
import 'package:to_do_a_day/elements/module/task.dart';
import 'package:to_do_a_day/elements/widgets/addingTodo.dart';
import 'package:to_do_a_day/elements/widgets/tasksList.dart';
import 'package:provider/provider.dart';
import 'package:to_do_a_day/elements/module/task_data.dart';
import '../const.dart';
import 'package:empty_widget/empty_widget.dart';

import 'archiveList.dart';

class archiveContainer extends StatelessWidget {
  final listOftasks = TaskData().tasksy;
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
              child: FlatButton(
                  onPressed: () {
                    Provider.of<TaskData>(context, listen: false)
                        .archivingTheDay(listOftasks);
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
            Provider.of<TaskData>(context, listen: true).isArchiveEmpty()
                ? ArchiveLists()
                : Center(
                    child: Column(children: [
                      SizedBox(
                        height: 200,
                      ),
                      Image.asset(
                        'images/Wavy Buddies - Box.png',
                        width: 210,
                        height: 210,
                      ),
                      Text(
                        'add your to-dos will be \nautomatically moved here\n at the end of each day',
                        textAlign: TextAlign.center,
                        style: conTodoTextStyle.copyWith(
                            color: Color(0xff2A3642).withOpacity(0.5)),
                      )
                    ]),
                  ),
          ],
        ) //here goes the Empty List or the checkList
        );
  }
}

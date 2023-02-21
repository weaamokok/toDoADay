import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../const.dart';
import '../module/task_data.dart';

bool isMale = false;
bool isFemale = false;

class changeImage extends StatefulWidget {
  @override
  State<changeImage> createState() => _changeImageState();
}

class _changeImageState extends State<changeImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFemale == true ? isFemale = false : null;
                        isMale = !isMale;
                      });
                    },
                    child: CircleAvatar(
                      //Avatar
                      backgroundColor: Color(0xff).withOpacity(0),
                      radius: 70,
                      child: Image.asset(
                        'images/Stuck at Home Avatar.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Visibility(
                      visible: isMale,
                      child: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ))
                ],
              ),
              SizedBox(
                width: 50,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isMale == true ? isMale = false : null;
                        isFemale = !isFemale;
                      });
                    },
                    child: CircleAvatar(
                      //Avatar
                      backgroundColor: Color(0xff).withOpacity(0),
                      radius: 70,
                      child: Image.asset(
                        'images/Stuck at Home - Avatar.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Visibility(
                      visible: isFemale,
                      child: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ))
                ],
              ),
            ],
          ),
          SizedBox(height: 50),
          InkWell(
            onTap: () {
              Provider.of<TaskData>(context, listen: false)
                  .updateImage(isFemale);
              Navigator.pop(context);
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 12),
                height: 50,
                child:
                    Text('save ', style: conTodaysDate.copyWith(fontSize: 14)),
                decoration: BoxDecoration(
                    color: yellow,
                    borderRadius: BorderRadius.all(Radius.circular(20)))),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:to_do_a_day/elements/const.dart';

class startingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff127681),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Text(
                    'Stay Foucsed',
                    style: conToday.copyWith(fontSize: 32),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                  'write todos for just today and stay foucsed to\n achive everyday goals. ',
                  style: conTodaysDate,
                  textAlign: TextAlign.left),
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/task');
                },
                child: Container(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    'start',
                    textAlign: TextAlign.center,
                    style: conToday.copyWith(fontSize: 13),
                  ),
                  margin: EdgeInsets.only(top: 30, right: 150),
                  width: 129,
                  height: 39,
                  decoration: BoxDecoration(
                      color: yellow,
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(.1),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: Offset(1, 1))
                      ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 140.0, top: 6),
                child: Stack(children: [
                  Image.asset(
                    'images/Città - Abstract.png',
                    width: 259,
                    height: 322,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 265, left: 20),
                    width: 163,
                    height: 36,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        boxShadow: [
                          BoxShadow(
                              color:
                                  Color.fromARGB(255, 0, 0, 0).withOpacity(.2),
                              spreadRadius: 5,
                              blurRadius: 23,
                              offset: Offset(1, 1))
                        ]),
                  )
                ]),
              )
            ],
          ),
        ));
  }
}

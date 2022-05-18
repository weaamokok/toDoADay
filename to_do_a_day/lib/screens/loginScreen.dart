import 'package:flutter/material.dart';
import 'package:to_do_a_day/elements/const.dart';

import '../elements/widgets.dart';

class loginScreen extends StatelessWidget {
  TextEditingController controller1 =
      TextEditingController(); //to clear field after navigating
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yellow,
      body: SafeArea(
          child: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Text(
                    'Sign In',
                    style: conTodaysDate.copyWith(fontSize: 38),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 200.0),
                child: Text('Welcome, Back! ',
                    style: conTodaysDate, textAlign: TextAlign.left),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * .73,
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xff).withOpacity(.1),
                      spreadRadius: 28,
                      blurRadius: 10,
                      offset: Offset(14, 27))
                ]),
            child: Column(children: [
              SizedBox(
                height: 50,
              ),
              txtFeild('Username', controller1, 2),
              SizedBox(
                height: 10,
              ),
              txtFeild('Password', controller2, 3),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.only(left: 120),
                  child: Text(
                    'forget password?',
                    textAlign: TextAlign.right,
                    style: connotifacationTimeTextStyle.copyWith(
                        decoration: TextDecoration.underline,
                        fontSize: 11,
                        color: conPrimaryB.withOpacity(.7)),
                  ),
                ),
              ),
              RoundedButton(
                  yellow,
                  Text(
                    'sign in',
                    style: conToday.copyWith(fontSize: 15),
                  )),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/sign');
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 120),
                  child: Row(
                    children: [
                      Text(
                        'not a memeber?',
                        style: connotifacationTimeTextStyle.copyWith(
                            fontSize: 11, color: conPrimaryB.withOpacity(.7)),
                      ),
                      Text(
                        'create account',
                        textAlign: TextAlign.right,
                        style: connotifacationTimeTextStyle.copyWith(
                            decoration: TextDecoration.underline,
                            fontSize: 11,
                            color: conPrimaryB.withOpacity(.7)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                margin: EdgeInsets.only(bottom: 30),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: conPrimaryB.withOpacity(.1),
                      spreadRadius: -3,
                      blurRadius: 5,
                      offset: Offset(0, 3))
                ]),
              ),
              RoundedButtonForGoogleAndFacebookSign(
                  'sign in with Google', google),
              RoundedButtonForGoogleAndFacebookSign('sign in with Google',
                  facebook), //since Im using the same style I did a custom button
            ]),
          )
        ],
      )),
    );
  }
}

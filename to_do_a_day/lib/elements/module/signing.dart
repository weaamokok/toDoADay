import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class siggning extends ChangeNotifier {
  String? email;
  String? userName;
  String? password;
  final auth = FirebaseAuth.instance;
  final authCredential =
      AuthCredential(providerId: 'google.com', signInMethod: 'Google');
  late User? loggedUser = auth.currentUser;

  void setUsername(var value) {
    userName = value;

    notifyListeners();
  }

  void setEmail(var value) {
    email = value;

    notifyListeners();
  }

  void setpasswprd(var value) {
    password = value;
    notifyListeners();
  }

  void getCurrentUser() async {
    final user = await auth.currentUser!;
    if (user != null) {
      loggedUser = user;
      print(loggedUser!.email);
      notifyListeners();
    }
  }
}

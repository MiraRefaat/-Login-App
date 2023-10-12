import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void SnakShow(BuildContext context,String message) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void NavigatorWidget(BuildContext context, Widget widget) {
    Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => widget,
                            ));
  }

  Future<void> createAcount({required String Email , required String Password}) async {
     final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: Email,
      password:  Password,
    );
  }

 Future<void> Sigin({required String Email , required String Password}) async {
     final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email:Email,
      password: Password,
    );
  }
  void showSnack(BuildContext context,String massege) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(massege)));
  }

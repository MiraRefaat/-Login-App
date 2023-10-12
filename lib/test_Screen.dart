import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class TesrScreen extends StatelessWidget {
  const TesrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Test"),
      ),
       body: Center( child: ElevatedButton(onPressed: () async {
         try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: "emailAddress",
    password: "password",
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("The password provided is too weak.")));
  } else if (e.code == 'email-already-in-use') {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("")));
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
       }, child: Text("create Email"))),
    );
  }
}
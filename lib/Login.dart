import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Helper/custom_function.dart';
import 'package:flutter_application_2/Sigin.dart';
import 'package:flutter_application_2/test_Screen.dart';

class Login extends StatelessWidget {
   Login({super.key});
String? email;
String? password;
var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(
            child: Text(
              "Login   ",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Form(
          key:formKey ,
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      email=value;
                    },
                     validator: (value) {
                      if (value! .isEmpty){
                        return "Fialed is required";
                      }
                    
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email ",
                      prefix: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Icon(Icons.email)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (value) {
                    password=value;
                    },
                     validator: (value) {
                      if (value! .isEmpty){
                        return "Fialed is required";
                      }
                    
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "password  ",
                      suffix: Icon(Icons.visibility),
                      prefix: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Icon(Icons.lock)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: MaterialButton(
                      onPressed: () async {
                   if (formKey.currentState!.validate()) {
                        try {
                     final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email:email!,
                         password: password!, );
               Navigator.push(context,MaterialPageRoute(builder:(context) => TesrScreen(),));
            showSnack(context,"Successfuly");
          } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              showSnack(context,"No user found for that email.");
            } else if (e.code == 'wrong-password') {
              showSnack(context,"Wrong password provided for that user.");
            }
          } catch (e) {
            print(e);
          }}
        },
                      
                      child: Text(
                        "Login  ",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(" Don’t  have an account "),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => signup(),
                                ));
                          },
                          child: Text("Sign up")),
                    ],
                  )
                ],
              )),
        ));
  }

  void showSnack(BuildContext context,String massege) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(massege)));
  }

 
  
}
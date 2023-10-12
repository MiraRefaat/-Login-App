
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Helper/custom_function.dart';
import 'package:flutter_application_2/Login.dart';

class signup extends StatelessWidget {
   signup({super.key});
  String? Email;
  String? Password;
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(
            child: Text(
              "Sign UP  ",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Form(
          key:formKey,
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sing Up ",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value! .isEmpty){
                        return "Fialed is required";
                      }
                    
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "User Name ",
                      prefix: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Icon(Icons.person)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                     validator: (value) {
                      if (value! .isEmpty){
                        return "Fialed is required";
                      }
                    
                    },
                    onChanged:(value) {
                      Email= value;
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
                     validator: (value) {
                      if (value! .isEmpty){
                        return "Fialed is required";
                      }
                    
                    },
                    onChanged:(value) {
                      Password=value;
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
                  TextFormField(
                     validator: (value) {
                      if (value! .isEmpty){
                        return "Fialed is required";
                      }
                    
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "formite  password  ",
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
            await createAcount(Email: Email!,Password: Password!);
            NavigatorWidget(context,Login());
            SnakShow(context,"Successfuly");
          } on FirebaseAuthException catch (e) {
            if (e.code == 'weak-password') {
              SnakShow(context,"The password provided is too weak.");
            } else if (e.code == 'email-already-in-use') {
              SnakShow(context,"The account already exists for that email.");
             
            }
          } catch (e) {
            print(e);
          }
}
                        
                      },
                      child: Text(
                        "Sign Up ",
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
                      Text(" Already have an account "),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(           builder: (context) => Login(),
                                ));
                          },
                          child: Text("Login")),
                    ],
                  )
                ],
              )),
        ));
  }

  
}

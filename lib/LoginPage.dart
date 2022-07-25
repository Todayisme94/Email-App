// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'RegisterPage.dart';
import 'services/LoadData.dart';
import 'services/firebase_services.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}
final User user = auth.currentUser!;

class _loginState extends State<login> {
  late String _email, _pass;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 120),
          color: Colors.greenAccent,
          height: 10000,
          width: 10000,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50),
              Text(
                'Email',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 8)),
                  onChanged: (value) {
                    setState(() {
                      _email = value.trim();
                    });
                  },
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Password',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 8)),
                  onChanged: (value) {
                    _pass = value.trim();
                  },
                ),
              ),
              SizedBox(height: 45),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                        elevation: 5,
                        padding: EdgeInsets.all(15),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                            '                             LOGIN                                    ',
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          auth
                              .signInWithEmailAndPassword(
                                  email: _email, password: _pass)
                              .then((_) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => LoadData()));
                          });
                        }),
                    SizedBox(height: 15),
                    GestureDetector(
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Don\'t have an Account? ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500)),
                          TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500))
                        ]),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => register()));
                      },
                    )
                  ]),
              SizedBox(height: 120),
              SizedBox(
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Or',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500))
                  ]),
                ),
              ),
              ElevatedButton(
                child: Text('Sign In With Google',
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                onPressed: () async {
                  await FirebaseServices().signInWithGoogle();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoadData()));
                },
                style: ButtonStyle(backgroundColor:
                    MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.black12;
                  }
                  return Colors.white;
                })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

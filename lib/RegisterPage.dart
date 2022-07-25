// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'services/LoadData.dart';
import 'services/firebase_services.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);


  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {

  late String _email, _pass;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(

        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 120
          ),
          color: Colors.greenAccent,
          height: 10000,
          width: 10000,
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50),
              Text(
                'Email', style: TextStyle(
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
                      contentPadding: EdgeInsets.only(
                          top: 8)
                  ),
                  onChanged: (value){
                    setState(() {
                      _email = value.trim();
                    });
                  },
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Password', style: TextStyle(
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
                      contentPadding: EdgeInsets.only(
                          top: 8)
                  ),
                  onChanged: (value){
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
                        child: Text('                         REGISTER                                    ',
                            style: TextStyle( color: Colors.black45 ,fontSize: 18, fontWeight: FontWeight.bold)),
                        onPressed: (){
                          auth.createUserWithEmailAndPassword(email: _email, password: _pass).then((_){
                          });
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => login()),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text("Berhasil Membuat Akun !"),
                        ));
                        }),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}

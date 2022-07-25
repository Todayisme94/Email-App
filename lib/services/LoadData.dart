// ignore_for_file: prefer_conditional_assignment

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Home.dart';
import '../model/emailModel.dart';
import 'emailServices.dart';

void main() {
  runApp(const LoadData());
}

class LoadData extends StatefulWidget {
  const LoadData({Key? key}) : super(key: key);

  @override
  State<LoadData> createState() => _LoadDataState();
}

final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser!;

class _LoadDataState extends State<LoadData> {
  final EmailService service = EmailService();
  List<Email>? emailList;

  @override
  Widget build(BuildContext context) {
    if (emailList == null) {
      emailList = List<Email>.empty();
    }

    return MaterialApp(
      home: FutureBuilder(
          future: loadList(),
          builder: (context, snapshot) {
            return Home(emails: emailList);
          }),
    );
  }

  Future loadList() {
    Future<List<Email>> futureEmail = service.getEmail();
    futureEmail.then((emailList) {
      setState(() {
        this.emailList = emailList;
      });
    });

    return futureEmail;
  }
}

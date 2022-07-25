import 'package:flutter/material.dart';
import 'Home.dart';
import 'model/emailModel.dart';
import 'services/emailServices.dart';

class PopPage extends StatefulWidget {
  const PopPage({Key? key}) : super(key: key);

  @override
  State<PopPage> createState() => _PopPageState();
}

class _PopPageState extends State<PopPage> {

  _PopPageState();

  final EmailService service = EmailService();

  final inputanKepada = TextEditingController();
  final inputanSubjek = TextEditingController();
  final inputanIsi = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            iconSize: 23,
            color: Colors.black54,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'Tulis',
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.attachment_outlined),
              iconSize: 23,
              color: Colors.black54,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.send),
              iconSize: 23,
              color: Colors.black54,
              onPressed: () async {
                setState(() {
                  service.sendEmail(
                    Email(
                      kepada: inputanKepada.text,
                      subjek: inputanSubjek.text,
                      isi: inputanIsi.text, 
                      id: '',
                    )
                  );
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Colors.green,
                  content: Text("Email berhasil dikirim!"),
                ));
              },
            ),
            IconButton(
              icon: Icon(Icons.more_vert_rounded),
              iconSize: 23,
              color: Colors.black54,
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
              child: Column(children: [
                TextField(
                    decoration: InputDecoration(
                  prefixIcon: Padding(
                      padding: EdgeInsets.only(top: 14, left: 10, right: 10),
                      child: Text(
                        'Dari :',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      )),
                  hintText: 'fauzan@gmail.com',
                )),
                TextField(
                    controller: inputanKepada,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          top: 14,
                          left: 10,
                          right: 10,
                        ),
                        hintText: 'Kepada',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.expand_more),
                          color: Colors.black54,
                          onPressed: () {},
                        ))),
                TextField(
                    controller: inputanSubjek,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        top: 14,
                        left: 10,
                        right: 10,
                      ),
                      hintText: 'Subjek',
                    )),
                TextField(
                    controller: inputanIsi,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        top: 14,
                        left: 10,
                        right: 10,
                      ),
                      hintText: 'Isi',
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      border: InputBorder.none,
                    ))
              ]),
            )
            );
  }
}

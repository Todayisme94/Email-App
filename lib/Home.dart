// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'Drawer.dart';
import 'PopPage.dart';
import 'IsiMail.dart';
import 'model/emailModel.dart';

class Home extends StatefulWidget {
  const Home({Key? key, this.emails}) : super(key: key);

  final List<Email>? emails;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    List<Email> listReversed = widget.emails!.reversed.toList();
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerWidget(),
      body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // AppBar
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
              margin: const EdgeInsets.symmetric(horizontal: 7.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.black26.withOpacity(0.5),
                    offset: Offset(2, 0),
                  ),
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.menu,
                      size: 24,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      _scaffoldKey.currentState!.openDrawer();
                    },
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Telusuri disini',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image(
                        image: AssetImage('assets/images/profile.jpg'), fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 8),
                ],
              ),
            ),
              //utama
              SizedBox(height: 10),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Utama',
                    style: TextStyle(
                      fontSize: 13,
                      wordSpacing: 3,
                      color: Colors.black,
                    ),
                  )
                ),
              Expanded(
                  child: ListView.builder(
                      itemCount: listReversed == null ? 0 : listReversed.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => IsiMail(email: listReversed[index]),
                              ),
                            );
                          },
                          //List Email
                          child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 2,
                                    color: Colors.black12.withOpacity(0.10),
                                    offset: Offset(2, 0),
                                  ),
                                ],
                              ),
                              child: Expanded(
                                  flex: 1,
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: Icon(Icons.account_circle),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      listReversed[index].kepada!,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    '14 Mei',
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.black54,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                listReversed[index].subjek!,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(width: 2),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Text(
                                                      listReversed[index].isi!,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black54,
                                                      ),
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.star_border,
                                                  )
                                                ],
                                              ),
                                            ]),
                                      )
                                    ],
                                  ))),
                        );
                      })),
            ],
          )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  PopPage()));
        },
        label: Text("Tambah"),
        icon: Icon(Icons.mode_edit),
      ),
    );
  }
}

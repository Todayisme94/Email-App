// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'services/firebase_services.dart';
import 'LoginPage.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser!;

class _DrawerWidgetState extends State<DrawerWidget> {
  String email = "";
  @override
  initState() {
    super.initState();
    initial();
  }

  void initial() async {
    setState(() {
      email = user.email!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _drawerHeader(text: 'hi, ${email}'),
          _drawerItem(
              icon: Icons.question_answer_rounded,
              text: 'Semua kotak masuk',
              onTap: () => print(' ')),
          _drawerItem(
              icon: Icons.star, text: 'Berbintang', onTap: () => print(' ')),
          _drawerItem(
              icon: Icons.more_time_rounded,
              text: 'Ditunda',
              onTap: () => print(' ')),
          _drawerItem(
              icon: Icons.send, text: 'Terkirim', onTap: () => print(' ')),
          _drawerItem(
              icon: Icons.delete, text: 'Sampah', onTap: () => print(' ')),
          const Divider(height: 25, thickness: 1),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
            child: Text("Labels",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                )),
          ),
          _drawerItem(
              icon: Icons.settings, text: 'Setelan', onTap: () => print(' ')),
          _drawerItem(
            icon: Icons.logout_rounded,
            text: 'Logout',
            onTap: () async {
              auth.signOut();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const login()));
            },
          ),
          _drawerItem(
              icon: Icons.question_mark_rounded,
              text: 'Bantuan & Masukan',
              onTap: () => print(' ')),
        ],
      ),
    );
  }
}

Widget _drawerHeader({required String text}) {
  return UserAccountsDrawerHeader(
    currentAccountPicture: ClipOval(
      child: Image(
          image: AssetImage('assets/images/profile.jpg'), fit: BoxFit.cover),
    ),
    accountName: Text(' '),
    accountEmail: Text(text),
  );
}

Widget _drawerItem({IconData? icon, String? text, GestureTapCallback? onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            text!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    onTap: onTap,
  );
}

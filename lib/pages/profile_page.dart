// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_declarations

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sparrowapp/profile_views/documents.dart';
import 'package:sparrowapp/profile_views/history.dart';
import 'package:sparrowapp/profile_views/manage_funds.dart';
import 'package:sparrowapp/profile_views/message_us.dart';
import 'package:sparrowapp/profile_views/promo_code.dart';
import 'package:sparrowapp/profile_views/settings.dart';
import 'package:sparrowapp/profile_views/sparrow_info.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          user.email!,
          style: TextStyle(
              color: Color.fromRGBO(90, 73, 227, 1.000),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(239, 239, 239, 1),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            backgroundColor: Color.fromRGBO(239, 239, 239, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            title: Center(child: Text('Sign Out')),
                            content: Text(
                                "Are you sure you would like to sign out?"),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('Cancel',
                                      style: TextStyle(color: Colors.blue))),
                              TextButton(
                                  onPressed: () {
                                    FirebaseAuth.instance.signOut();
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Sign Out',
                                    style: TextStyle(color: Colors.red),
                                  ))
                            ],
                          ));
                },
                child: Icon(Icons.logout,
                    color: Color.fromRGBO(90, 73, 227, 1.000)),
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                leading: Icon(Icons.settings_sharp,
                    color: Color.fromRGBO(90, 73, 227, 1.000)),
                title: Text('App Settings'),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Settings()));
                },
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                leading: Icon(Icons.payments,
                    color: Color.fromRGBO(90, 73, 227, 1.000)),
                title: Text('Manage Funds'),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ManageFunds()));
                },
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                leading: Icon(Icons.history,
                    color: Color.fromRGBO(90, 73, 227, 1.000)),
                title: Text('History'),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => History()));
                },
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                leading: Icon(Icons.help_center,
                    color: Color.fromRGBO(90, 73, 227, 1.000)),
                title: Text('Help Centre'),
                trailing: Icon(
                  Icons.link,
                  color: Colors.black,
                ),
                onTap: () async {
                  final url = 'https://helpcentre.trading212.com/hc/en-us';

                  if (await canLaunch(url)) {
                    await launch(
                      url,
                      forceSafariVC: true,
                      forceWebView: true,
                      enableJavaScript: true,
                    );
                  }
                },
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                leading:
                    Icon(Icons.chat, color: Color.fromRGBO(90, 73, 227, 1.000)),
                title: Text('Message Us'),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MessageUs()));
                },
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                leading:
                    Icon(Icons.info, color: Color.fromRGBO(90, 73, 227, 1.000)),
                title: Text('Sparrow Information'),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SparrowInfo()));
                },
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                leading: Icon(Icons.local_activity,
                    color: Color.fromRGBO(90, 73, 227, 1.000)),
                title: Text('Promotion Codes'),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PromoCode()));
                },
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                leading: Icon(Icons.description,
                    color: Color.fromRGBO(90, 73, 227, 1.000)),
                title: Text('Documents'),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Documents()));
                },
              ),
            )
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(239, 239, 239, 1),
    );
  }
}

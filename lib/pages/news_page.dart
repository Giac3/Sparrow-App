// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News",
          style: TextStyle(
              color: Color.fromRGBO(90, 73, 227, 1.000),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(239, 239, 239, 1),
      ),
      body: Center(
        child: Text("This is News Page"),
      ),
    );
  }
}

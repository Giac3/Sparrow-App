import 'package:flutter/material.dart';

class MessageUs extends StatefulWidget {
  const MessageUs({super.key});

  @override
  State<MessageUs> createState() => _MessageUsState();
}

class _MessageUsState extends State<MessageUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Color.fromRGBO(239, 239, 239, 1),
        elevation: 0,
      ),
    );
  }
}

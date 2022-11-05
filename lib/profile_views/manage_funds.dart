import 'package:flutter/material.dart';

class ManageFunds extends StatefulWidget {
  const ManageFunds({super.key});

  @override
  State<ManageFunds> createState() => _ManageFundsState();
}

class _ManageFundsState extends State<ManageFunds> {
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

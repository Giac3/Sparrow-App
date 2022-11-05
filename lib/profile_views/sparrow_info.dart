import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SparrowInfo extends StatefulWidget {
  const SparrowInfo({super.key});

  @override
  State<SparrowInfo> createState() => _SparrowInfoState();
}

class _SparrowInfoState extends State<SparrowInfo> {
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

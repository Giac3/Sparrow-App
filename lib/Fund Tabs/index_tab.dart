import 'package:flutter/material.dart';

class IndexTab extends StatefulWidget {
  const IndexTab({super.key});

  @override
  State<IndexTab> createState() => _IndexTabState();
}

class _IndexTabState extends State<IndexTab> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text('Index')));
  }
}

import 'package:flutter/material.dart';

class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人中心'),
        automaticallyImplyLeading: false,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('消息'),
        automaticallyImplyLeading: false,
      ),
    );
  }
}

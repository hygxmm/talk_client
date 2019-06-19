import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/system_provider.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('消息'),
        automaticallyImplyLeading: false,
      ),
      body: Consumer<SystemProvider>(
        builder: (context, SystemProvider data, _) {
          return ListView.separated(
            itemCount: data.sockets.length,
            itemBuilder: (context, index) {},
            separatorBuilder: (context, index) {},
          );
        },
      ),
    );
  }
}

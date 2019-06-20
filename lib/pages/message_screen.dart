import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talk_client/widgets/socket_item.dart';
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
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(index.toString()),
                onDismissed: (direction) {
                  print(direction);
                  // data.sockets.removeAt(index);
                  Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('${index} dismissed')),
                  );
                },
                background: Container(
                  child: Text('删除'),
                  color: Colors.redAccent,
                ),
                child: SocketItem(data.sockets[index]),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(height: 1);
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SocketItem extends StatelessWidget {
  final Map data;
  SocketItem(this.data);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(data['avatar']),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 80,
              padding: EdgeInsets.symmetric(vertical: 10),
              margin: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.grey[500],
                  ),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text(data['name']),
                        Text(data['lastMessageTime']),
                      ],
                    ),
                  ),
                  Container(
                    child: Text(data['lastMessage']),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

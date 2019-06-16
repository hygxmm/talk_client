import 'package:flutter/material.dart';

const String _name = '默默';

class ChatMessage extends StatelessWidget {
  final String text;
  ChatMessage({Key key, this.text, this.animationController}) : super(key: key);
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
      axisAlignment: 0,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 16),
              child: CircleAvatar(
                child: Text(_name[0]),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(_name, style: Theme.of(context).textTheme.subhead),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(text),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

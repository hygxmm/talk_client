import 'package:flutter/material.dart';
import 'dart:async';

class ShowAwait extends StatefulWidget {
  ShowAwait(this.requestCallback);
  final Future requestCallback;
  @override
  _ShowAwaitState createState() => _ShowAwaitState();
}

class _ShowAwaitState extends State<ShowAwait> {
  @override
  initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      widget.requestCallback.then((onValue) {
        Navigator.of(context).pop(onValue);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

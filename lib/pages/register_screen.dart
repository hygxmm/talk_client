import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talk_client/methods/http.dart';
import 'package:talk_client/widgets/name_input.dart';
import 'package:talk_client/widgets/password_input.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _nameCtrl = TextEditingController();
  TextEditingController _passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: ScreenUtil().setWidth(750),
          height: ScreenUtil().setHeight(1334),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFAD7A1), Color(0xFFE96D71)],
              begin: FractionalOffset(0, 0),
              end: FractionalOffset(1, 1),
            ),
          ),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  height: ScreenUtil().setHeight(100),
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(30)),
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Container(
                  height: ScreenUtil().setHeight(200),
                ),
                NameInput(_nameCtrl),
                Container(
                  height: ScreenUtil().setHeight(50),
                ),
                PassWordInput(_passCtrl),
                Container(
                  height: ScreenUtil().setHeight(50),
                ),
                Container(
                  width: ScreenUtil().setWidth(400),
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text('注册'),
                    onPressed: () {
                      _register();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _register() async {
    if (_nameCtrl.text.isEmpty) {
      return;
    }
    if (_passCtrl.text.isEmpty) {
      return;
    }
    try {
      var res = await Fetch.post(
        'register',
        data: {'username': _nameCtrl.text, 'password': _nameCtrl.text},
      );
      if (res['success']) {
        Navigator.pop(context, {'nickName': _nameCtrl.text});
      }
    } catch (e) {
      print(e);
    }
  }
}

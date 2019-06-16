import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import '../methods/http.dart';
import 'package:provider/provider.dart';
import '../provider/system_provider.dart';
import './navigator_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _nameCtrl = TextEditingController();
  TextEditingController _passCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
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
          child: ListView(
            children: <Widget>[
              nameInput(),
              passInput(),
              submitButton(context),
            ],
          ),
        ),
      ),
    );
  }

  void _login(context) async {
    if (_nameCtrl.text.isEmpty) return;
    if (_passCtrl.text.isEmpty) return;
    var res = await Fetch.post(
      'login',
      data: {'username': _nameCtrl.text, 'password': _passCtrl.text},
    );
    if (res['success']) {
      Provider.of<SystemProvider>(context).login(res['data']);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NavigatorBar()),
      );
    }
  }

  Widget passInput() {
    return Container(
      child: TextField(
        controller: _passCtrl,
        obscureText: true,
        maxLength: 12,
        decoration: InputDecoration(
          labelText: '密码',
          hintText: '请输入密码',
          counterText: '',
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.white30,
        ),
      ),
    );
  }

  Widget nameInput() {
    return Container(
      child: TextField(
        controller: _nameCtrl,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: '昵称',
          hintText: '请输入昵称',
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.white30,
        ),
      ),
    );
  }

  Widget submitButton(context) {
    return Container(
      child: RaisedButton(
        child: Text('登录'),
        onPressed: () {
          _login(context);
        },
      ),
    );
  }
}

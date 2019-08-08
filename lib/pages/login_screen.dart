import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talk_client/pages/register_screen.dart';
import 'package:talk_client/widgets/password_input.dart';
import '../methods/http.dart';
import 'package:provider/provider.dart';
import '../provider/system_provider.dart';
import './navigator_screen.dart';
import '../widgets/name_input.dart';

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
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  height: ScreenUtil().setHeight(300),
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
                    child: Text('登录'),
                    onPressed: () {
                      _login(context);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(50)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '还没有注册？',
                        style: TextStyle(color: Colors.grey[300]),
                      ),
                      InkWell(
                        child: Text(
                          '去注册',
                          style: TextStyle(color: Colors.green[700]),
                        ),
                        onTap: () async {
                          var args = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          );
                          if (args != null) {
                            _nameCtrl.text = args['nickName'].toString() ?? '';
                          }
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login(context) async {
    if (_nameCtrl.text.isEmpty) {
      return;
    }
    if (_passCtrl.text.isEmpty) {
      return;
    }
    var res = await Fetch.post(
      'login',
      data: {'username': _nameCtrl.text, 'password': _passCtrl.text},
    );
    if (res['success']) {
      Provider.of<SystemProvider>(context).login(res['data']);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => NavigatorBar()),
        (route) => route == null,
      );
    }
  }
}

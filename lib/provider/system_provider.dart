import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../methods/http.dart';

class SystemProvider with ChangeNotifier {
  String _user_id = '';
  String _user_name = '';
  String _user_avatar = '';
  String _user_phone = '';
  String _user_email = '';
  String _token = '';
  List _groups = [];
  List _friends = [];
  int _tabbarIndex = 0;

  String get uid => _user_id;
  String get token => _token;
  String get name => _user_name;
  String get phone => _user_phone;
  String get avatar => _user_avatar;
  String get email => _user_email;
  List get groups => _groups;
  List get friends => _friends;
  int get tabbarIndex => _tabbarIndex;

  void initApp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _id = prefs.getString('uid');
    String _token = prefs.getString('token');
    String _name = prefs.getString('username');
    String _avatar = prefs.getString('useravatar');
    String _email = prefs.getString('token');
  }

  void login(data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _user_id = data['_id'];
    _user_name = data['username'];
    _user_avatar = data['avatar'];
    _token = data['token'];
    _groups = data['groups'];
    _friends = data['friends'];

    prefs.setString('uid', _user_id);
    prefs.setString('token', _token);
    prefs.setString('username', _user_name);
    prefs.setString('useravatar', _user_avatar);
    prefs.setStringList('groups', _groups);
    prefs.setStringList('friends', _friends);
  }

  void logout() async {}
  void loginByToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _token = prefs.getString('token');
    print(_token);
  }

  void changeTabBarIndex(int index) {
    _tabbarIndex = index;
    notifyListeners();
  }
}

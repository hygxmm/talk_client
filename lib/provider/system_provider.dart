import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../methods/http.dart';

class SystemProvider with ChangeNotifier {
  String _id = '';
  String _name = '';
  String _avatar = '';
  String _token = '';
  List _groups = [];
  List _friends = [];
  List _sockets = [];
  int _tabbarIndex = 0;

  String get uid => _id;
  String get token => _token;
  String get name => _name;
  String get avatar => _avatar;
  List get groups => _groups;
  List get friends => _friends;
  List get sockets => _sockets;
  int get tabbarIndex => _tabbarIndex;

  void initApp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString('uid');
    if (id != null) {
      _id = id;
    }
    String name = prefs.getString('username');
    if (name != null) {
      _name = name;
    }
    String avatar = prefs.getString('useravatar');
    if (avatar != null) {
      _avatar = avatar;
    }
    String token = prefs.getString('token');
    if (token != null) {
      _token = token;
    }
    List groups = prefs.getStringList('groups');
    if (groups != null) {
      _groups = groups;
    }
    List friends = prefs.getStringList('friends');
    if (friends != null) {
      _friends = friends;
    }
    List sockets = prefs.getStringList('sockets');
    if (sockets != null) {
      _sockets = sockets;
    }
  }

  void login(data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _id = data['_id'];
    _name = data['username'];
    _avatar = data['avatar'];
    _token = data['token'];
    _groups = data['groups'];
    _friends = data['friends'];

    prefs.setString('uid', _id);
    prefs.setString('token', _token);
    prefs.setString('username', _name);
    prefs.setString('useravatar', _avatar);
    prefs.setStringList('groups', _groups);
    prefs.setStringList('friends', _friends);
    prefs.setStringList('sockets', _sockets);

    notifyListeners();
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _id = '';
    _name = '';
    _avatar = '';
    _token = '';
    _groups = [];
    _friends = [];
    _sockets = [];

    prefs.setString('uid', _id);
    prefs.setString('token', _token);
    prefs.setString('username', _name);
    prefs.setString('useravatar', _avatar);
    prefs.setStringList('groups', _groups);
    prefs.setStringList('friends', _friends);
    prefs.setStringList('sockets', _sockets);

    notifyListeners();
  }

  void changeTabBarIndex(int index) {
    _tabbarIndex = index;
    notifyListeners();
  }
}

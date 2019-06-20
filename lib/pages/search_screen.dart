import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../methods/http.dart';
import 'package:provider/provider.dart';
import '../provider/system_provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _controller = TextEditingController();
  List<dynamic> users;
  List<dynamic> groups;
  String uid;

  @override
  void initState() {
    users = [];
    groups = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    uid = Provider.of<SystemProvider>(context).uid;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 40),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white30,
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            onSubmitted: (String text) {
              findFriend(text);
            },
          ),
        ),
        actions: <Widget>[
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              width: 60,
              child: Text('取消'),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(750),
              height: ScreenUtil().setHeight(60),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 20),
              color: Colors.black12,
              child: users.length == 0
                  ? null
                  : Text(
                      '人',
                      style: TextStyle(color: Colors.white),
                    ),
            ),
            Container(
              child: users.length == 0 ? Text('未找到相关用户数据') : userList(users),
            ),
            Container(
              child: groups.length == 0 ? null : Text('群'),
            ),
            Container(
              child: groups.length == 0 ? Text('未找到相关群组数据') : groupList(groups),
            )
          ],
        ),
      ),
    );
  }

  Widget userList(List users) {
    return Column(
      children: users.map((item) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(item['avatar']),
          ),
          title: Text(item['username']),
          trailing: IconButton(
            icon: Icon(Icons.person_add),
            onPressed: () {
              addFriend(item['_id']);
            },
          ),
        );
      }).toList(),
    );
  }

  Widget groupList(List item) {
    return Column(
      children: groups.map((item) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(item['avatar']),
          ),
          title: Text(item['name']),
          trailing: IconButton(
            icon: Icon(Icons.group_add),
            onPressed: () {
              addGroup(item['_id']);
            },
          ),
        );
      }).toList(),
    );
  }

  void findFriend(String name) async {
    final Map<String, String> data = {'keywords': name};
    try {
      var res = await Fetch.post('search', data: data);
      if (res['success']) {
        var data = res['data'];
        setState(() {
          users = data['users'];
          groups = data['groups'];
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void addFriend(String id) async {
    Map<String, String> data = {'uid': uid, 'oid': id};
    print(data);
    try {
      var res = await Fetch.post('addFriend', data: data);
      if (res['success']) {
        print(res['message']);
      } else {
        print(res['message']);
      }
    } catch (e) {
      print(e);
    }
  }

  void addGroup(String id) async {
    final Map<String, String> data = {'': '', '': ''};
    try {
      var res = await Fetch.post('path', data: data);
      print(res);
    } catch (e) {
      print(e);
    }
  }
}

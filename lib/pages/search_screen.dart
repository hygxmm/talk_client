import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white30,
            prefixIcon: Icon(Icons.search),
            suffix: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {},
            ),
          ),
        ),
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          InkWell(
            onTap: () {
              showSearch(context: context, delegate: SearchBarDelegate());
            },
            child: Container(
              width: ScreenUtil().setWidth(750),
              height: ScreenUtil().setHeight(80),
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
              color: Colors.black12,
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.search,
                    color: Colors.blue,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
                    child: Text(
                      '昵称 / 手机号',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
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

class SearchBarDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        if (query.isEmpty) {
          close(context, null);
        } else {
          query = "";
          showSuggestions(context);
        }
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Wrap(
      children: <Widget>[
        ListTile(title: Text('data')),
        ListTile(title: Text('data')),
        ListTile(title: Text('data')),
      ],
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return super.appBarTheme(context);
  }
}

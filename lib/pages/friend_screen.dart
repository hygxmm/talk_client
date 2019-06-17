import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/system_provider.dart';
import './search_screen.dart';

class FriendScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('联系人'),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchScreen()),
                );
              },
            )
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: '好友'),
              Tab(text: '群组'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            FriendList(context),
            GroupsList(context),
          ],
        ),
      ),
    );
  }

  Widget GroupsList(context) {
    return Consumer<SystemProvider>(
      builder: (context, systemData, _) {
        return ListView.separated(
          itemCount: systemData.groups.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${systemData.groups[index]["name"]}'),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  '${systemData.groups[index]["avatar"]}',
                  scale: 1,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(height: 1);
          },
        );
      },
    );
  }

  Widget FriendList(context) {
    return Consumer<SystemProvider>(
      builder: (context, systemData, _) {
        return ListView.separated(
          itemCount: systemData.friends.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${systemData.friends[index]["name"]}'),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  '${systemData.friends[index]["avatar"]}',
                  scale: 1,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(height: 1);
          },
        );
      },
    );
  }
}

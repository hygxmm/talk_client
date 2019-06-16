import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/system_provider.dart';

import './message_screen.dart';
import './friend_screen.dart';
import './my_screen.dart';

class NavigatorBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SystemProvider>(
      builder: (context, systemData, _) {
        return Scaffold(
          body: IndexedStack(
            index: systemData.tabbarIndex,
            children: <Widget>[
              MessageScreen(),
              FriendScreen(),
              MyScreen(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (int index) {
              systemData.changeTabBarIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.message), title: Text('消息')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text('联系人')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), title: Text('我的')),
            ],
            currentIndex: systemData.tabbarIndex,
          ),
        );
      },
    );
  }
}

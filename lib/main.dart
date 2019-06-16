import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './provider/system_provider.dart';

import './pages/login_screen.dart';
import './pages/chat_screen.dart';

bool isLogin = false;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => SystemProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Talk',
        theme: ThemeData.light(),
        home: isLogin ? ChatScreen() : LoginScreen(),
      ),
    );
  }
}

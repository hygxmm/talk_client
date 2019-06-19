import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PassWordInput extends StatelessWidget {
  final TextEditingController controller;
  PassWordInput(this.controller);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(600),
      child: TextField(
        controller: controller,
        maxLength: 12,
        obscureText: true,
        cursorRadius: Radius.elliptical(2, 8),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          filled: true,
          fillColor: Colors.white24,
          hintText: '请输入密码',
          counterText: '',
          prefixIcon: Icon(Icons.lock),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

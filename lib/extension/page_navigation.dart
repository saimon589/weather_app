
import 'package:flutter/material.dart';

extension PageNavigation on BuildContext{
  Future<dynamic> pushPage(Widget widget) async {
    return await Navigator.of(this).push(MaterialPageRoute(
        builder: (BuildContext context)=> widget));
  }
  Future<dynamic> pop() async {
    return Navigator.of(this).pop();
  }
}
import 'package:flutter/material.dart';

class MyAppBar extends AppBar{
  final BuildContext context;
  final List<Widget>? widget;
  final String? appBarTitle;
  MyAppBar({super.key,required this.context,this.widget,this.appBarTitle}):super(
    elevation: 5,
    actions: (widget != null) ? widget :null,
    title: Text((appBarTitle != null)? appBarTitle : ''),
  );
}
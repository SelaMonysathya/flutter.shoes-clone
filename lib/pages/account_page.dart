import 'package:flutter/material.dart';
import 'package:shoes_clone/theme/color.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      body: Center(child: Text("Account Page", style: TextStyle(color: black),),),
    );
  }
}
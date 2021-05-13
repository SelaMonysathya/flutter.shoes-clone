import 'package:flutter/material.dart';
import 'package:shoes_clone/theme/color.dart';

class WishlistPage extends StatefulWidget {
  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      body: Center(child: Text("Wishlist Page", style: TextStyle(color: black),),),
    );
  }
}
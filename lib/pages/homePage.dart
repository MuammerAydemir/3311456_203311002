import 'package:flutter/material.dart';
import 'package:meal/pages/profile.dart';
import 'package:meal/widget/myCarouselSlider.dart';
import 'package:meal/widget/myCarouselSlider.dart';
import 'package:meal/data/Colors.dart';
import 'package:meal/widget/myDrawer.dart';
import 'package:meal/widget/myGridView.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

import '../data/userInfo.dart';
class HomePage extends StatefulWidget {
  final String? title;

  HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user=User(name: 'admin',email: "admin@mail.com",password: "1234");
  MyGridView gridView=const MyGridView();
  var avatarImg = "https://www.w3schools.com/howto/img_avatar.png";

  final drawerColor = const Color(0xFF1AE821);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "${widget.title}",
            style: TextStyle(color: black),
          ),
          actions: [
            ClipOval(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: main1Color),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(user: user),
                  ),
                ),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(avatarImg),
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: const [
              myCarouselSlider(),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Popular Cook",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )),
              ),
              MyGridView(),
            ],
          ),
        ),
        drawer: myDrawer(),
      ),
    );
  }




}

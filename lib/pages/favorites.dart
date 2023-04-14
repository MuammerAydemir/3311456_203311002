import 'package:flutter/material.dart';
import 'package:meal/data/globals.dart' as globals;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:meal/data/Colors.dart';
import 'package:meal/widget/myGridView.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  Map<String, dynamic> _data = {};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("Favorites"),
            ),
            body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: MyGridView(),
            ),
        ),
      ),
        )
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/Options.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List<Options> options = [];

  Future<String> loadAsset() async {
    return await DefaultAssetBundle.of(context)
        .loadString('assets/foodInfo.json');
  }

  Future loadOptions() async {
    String jsonString = await loadAsset();
    final jsonResponse = json.decode(jsonString);
    setState(() {
      options = List<Options>.from(
          jsonResponse.map((option) => Options.fromJson(option)));
    });
  }

  @override
  void initState() {
    super.initState();
    loadOptions();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(titleSpacing: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context)),
        title: Row(
          children: const [
             Text(
              "Tarifi",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
            ),
            SizedBox(width: 20,),
            Icon(Icons.outdoor_grill,size: 30,),
          ],
        ),
      ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Yemeğin Tarifi",style: TextStyle(fontSize: 50),)
                ],
            ),
          ),
    ));
  }
}

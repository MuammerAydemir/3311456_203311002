import 'dart:convert';
import 'package:flutter/material.dart';
import '../model/Options.dart';

class Materials extends StatefulWidget {
  const Materials({super.key});

  @override
  State<Materials> createState() => MmaterialsState();
}

class MmaterialsState extends State<Materials> {
  List<Options> options = [];

  Future<String> loadAsset() async {
    return await DefaultAssetBundle.of(context)
        .loadString('assets/materialInfo.json');
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
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Materials",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: GridView.builder(
        itemCount: options == null ? 0 : options.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),
        itemBuilder: (context, index) {
          List words = options.map((e) => e.name).toList();
          String word = words[index];
          List urlImages = options.map((e) => e.urlImg).toList();
          final urlImage = urlImages[index];
          return Card(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              onPressed: () {},
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      urlImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    overflow: TextOverflow.fade,
                    word,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 25),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ));
  }
}

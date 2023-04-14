import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meal/data/Colors.dart';
import 'package:meal/data/globals.dart' as globals;

import '../model/Options.dart';

class MyGridView extends StatefulWidget {
  const MyGridView({Key? key}) : super(key: key);

  @override
  State<MyGridView> createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView> {
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
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: SizedBox(
          height: 450,
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: options == null ? 0 : options.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),
            itemBuilder: (context, index) {
              List words = options.map((e) => e.name).toList();
              String word = words[index];
              bool isSaved = globals.favors.contains(word);
              List urlImages = options.map((e) => e.urlImg).toList();
              final urlImage = urlImages[index];
              return Card(
                shadowColor: black,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () => Navigator.pushNamed(context, "/Detail()"),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network(
                          urlImage,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            overflow: TextOverflow.fade,
                            word,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Flexible(
                            child: IconButton(
                              color: Colors.black,
                              onPressed: () {
                                setState(() {
                                  if (isSaved) {
                                    globals.favors.remove(word);
                                  } else {
                                    globals.favors.add(word);
                                  }
                                });
                              },
                              icon: Icon(
                                isSaved
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isSaved ? Colors.red : null,
                                size: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}

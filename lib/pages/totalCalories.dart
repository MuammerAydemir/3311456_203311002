import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meal/data/Colors.dart';
import 'dart:convert';
import 'package:meal/model/Options.dart';

class Total_Calories extends StatefulWidget {
  const Total_Calories({super.key});

  @override
  State<Total_Calories> createState() => _Tota_lCaloriesState();
}

class _Tota_lCaloriesState extends State<Total_Calories> {
  List<Options> options = [];

  Options? selectedOption;

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
        appBar: AppBar(
          title: const Text("Total Calories"),
          centerTitle: true,
        ),
        body: Center(
            child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DropdownButton<Options>(
                        value: selectedOption,
                        items: options.map((option) {
                          return DropdownMenuItem<Options>(
                            value: option,
                            child: Text("${option.name}"),
                          );
                        }).toList(),
                        onChanged: (option) {
                          setState(() {
                            selectedOption = option;
                          });
                        },
                      ),
                      const Text("Calories"),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

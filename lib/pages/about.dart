import 'package:flutter/material.dart';
import 'package:meal/data/Colors.dart';
class About extends StatefulWidget {
  About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {


  List<String> entries = [
    "Meal Demo",
    "© Muammer Aydemir,2023",
    "View Readme",
    "View License",
    "Contributing"
  ];

  List entIcons = [Icons.auto_stories, Icons.description, Icons.group];

  var headStyle = const TextStyle(fontWeight: FontWeight.bold, fontSize: 30);

  var head2Style = const TextStyle(fontWeight: FontWeight.normal, fontSize: 20);

  var myDivider = const Divider(
    color: Colors.black,
    indent: 15,
    endIndent: 15,
    thickness: 1,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("About", style: TextStyle(fontSize: 23)),
          centerTitle: true,
          backgroundColor: main1Color,
        ),
        body: Column(
          children: [
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const FlutterLogo(
                  size: 75,
                ),
                Text(entries[0], style: headStyle),
                Text(
                  entries[1],
                  style: head2Style,
                ),
                myDivider,
              ],
            )),
            const SizedBox(
              height: 50,
            ),
            MyButton(
              mainColor: main1Color,
              entIcons: entIcons[0],
              entries: entries[2],
            ),
            MyButton(
              mainColor: main1Color,
              entIcons: entIcons[1],
              entries: entries[3],
            ),
            MyButton(
              mainColor: main1Color,
              entIcons: entIcons[2],
              entries: entries[4],
            ),
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatefulWidget {
  MyButton({
    super.key,
    required this.mainColor,
    required this.entIcons,
    required this.entries,
  });

  late Color mainColor;
  late var entIcons;
  late var entries;

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  TextStyle textStly = const TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.grey,
            backgroundColor: widget.mainColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: Center(
              child: Row(
            children: [
              Icon(widget.entIcons),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  widget.entries,
                  style: textStly,
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}

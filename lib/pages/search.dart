import 'package:flutter/material.dart';
import 'package:meal/data/Colors.dart';
import 'dart:convert';

class Search extends StatefulWidget {
  Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: black,
            child: IconButton(
              highlightColor: grey,
              color: white,
              iconSize: 50,
              icon: const Icon(Icons.search),
              onPressed: () async {
                final data = await DefaultAssetBundle.of(context)
                    .loadString('assets/foodInfo.json');
                final jsonResponse = json.decode(data) as List<dynamic>;
                showSearch(context: context, delegate: MySearch(jsonResponse));
              },
            ),
          ),
        ]),
      ),
    ));
  }
}

class MySearch extends SearchDelegate {
  final List<dynamic> dataList;

  MySearch(this.dataList);

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else
                query = "";
            },
            icon: const Icon(Icons.clear)),
      ];

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
        onPressed: () => close(context, null), icon: const Icon(Icons.search));
  }

  @override
  Widget buildResults(BuildContext context) {
    final opt = dataList
        .where((element) =>
            element.toString().toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: opt.length,
      itemBuilder: (context, index) {
        final search = opt[index]["name"].toString();
        final UrlImg = opt[index]["urlImg"].toString();
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(UrlImg),
          ),
          title: Text(search),
          onTap: ()=>Navigator.pushNamed(context, "/Detail()"),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final opt = dataList
        .where((element) =>
            element.toString().toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: opt.length,
      itemBuilder: (context, index) {
        final search = opt[index]["name"].toString();
        return ListTile(
          title: Text(search),
          onTap: () {
            query = search;
            showResults(context);
          },
        );
      },
    );
  }
}

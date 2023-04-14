import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../model/Options.dart';
class myCarouselSlider extends StatefulWidget {
  const myCarouselSlider({Key? key}) : super(key: key);

  @override
  State<myCarouselSlider> createState() => _myCarouselSliderState();
}

class _myCarouselSliderState extends State<myCarouselSlider> {
  List<Options> options=[];



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
      padding: const EdgeInsets.only(top: 5),
      child: CarouselSlider.builder(
        options: CarouselOptions(height: 200.0, autoPlay: true),
        itemCount: options == null ? 0 : options.length,
        itemBuilder: (context, index, realIndex) {
          List urlImages = options.map((e) => e.urlImg).toList();
          final urlImage=urlImages[index];
          return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: ()=>Navigator.pushNamed(context, "/Detail()"),
                  child: Image.network(
                    urlImage,
                    fit: BoxFit.fill,
                  ),
                ));

        },
      ),
    );
  }
}

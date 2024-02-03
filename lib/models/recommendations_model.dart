import 'package:flutter/material.dart';

class Recommendations {
  String path;
  String name;
  String desc;
  LinearGradient boxColor;
  bool isSelected;

  Recommendations({
    required this.path,
    required this.name,
    required this.desc,
    required this.boxColor,
    required this.isSelected,
  });

  static List<Recommendations> getRecommendations() {
    List<Recommendations> recommend = [];
    recommend.add(Recommendations(
        path: "assets/icons/rec1.svg",
        name: "Honey Pancake",
        desc: "Easy | 30mins | 230kCal",
        boxColor:
            LinearGradient(colors: [Color(0xff92A3FD), Color(0xff9DCEFF)]),
        isSelected: true));

    recommend.add(Recommendations(
        path: "assets/icons/rec2.svg",
        name: "Canal Bread",
        desc: "Easy | 20mins | 200kCal",
        boxColor:
            LinearGradient(colors: [Color(0xffC58BF2), Color(0xffEEA4CE)]),
        isSelected: false));

    return recommend;
  }
}

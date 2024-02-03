class Popular {
  String path;
  String name;
  String desc;
  bool isSelected;

  Popular({
    required this.path,
    required this.name,
    required this.desc,
    required this.isSelected,
  });

  static List<Popular> getPopular() {
    List<Popular> popular = [];

    popular.add(Popular(
        path: "assets/icons/pop1.svg",
        name: "Blueberry Pancake",
        desc: "Medium | 30mins | 230kCal",
        isSelected: true));
    popular.add(Popular(
        path: "assets/icons/pop2.svg",
        name: "Salmon Nigiri",
        desc: "Medium | 20mins | 120kCal",
        isSelected: false));

    return popular;
  }
}

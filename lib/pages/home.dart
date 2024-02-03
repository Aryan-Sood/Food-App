import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:food/models/category_model.dart";
import "package:food/models/popular_model.dart";
import "package:food/models/recommendations_model.dart";

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<Recommendations> recommend = [];
  List<Popular> popular = [];

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  void _getRecommendations() {
    recommend = Recommendations.getRecommendations();
  }

  void _getPopular() {
    popular = Popular.getPopular();
  }

  @override
  void initState() {
    _getCategories();
    _getRecommendations();
    _getPopular();
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();
    _getRecommendations();
    _getPopular();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Color(0xffFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchBar(),
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Category",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            categories_section(),
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Recommendations\nFor Diet",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _recommendations(),
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Popular",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            _popular(),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }

  Container _popular() {
    return Container(
      color: Color(0xffFFFFFF),
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff1D1617).withOpacity(0.07),
                    offset: Offset(0, 10),
                    blurRadius: 40,
                    spreadRadius: 0,
                  )
                ],
                color: Colors.white,
              ),
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(popular[index].path),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        popular[index].name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Text(
                        popular[index].desc,
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(0),
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.arrow_circle_right_rounded,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 5,
        ),
        itemCount: popular.length,
        shrinkWrap: true,
      ),
    );
  }

  Padding _recommendations() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        height: 250,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: 210,
                padding: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: recommend[index].boxColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(recommend[index].path),
                    Text(recommend[index].name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14)),
                    Text(recommend[index].desc),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: recommend[index].isSelected
                              ? Colors.purple
                              : Colors.transparent,
                        ),
                        onPressed: () {},
                        child: Text(
                          "View",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  width: 40,
                ),
            itemCount: recommend.length),
      ),
    );
  }

  Container categories_section() {
    return Container(
      height: 120,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 20, right: 20),
          itemCount: categories.length,
          separatorBuilder: (context, index) => const SizedBox(
                width: 25,
              ),
          itemBuilder: (context, index) {
            return Container(
              width: 100,
              decoration: BoxDecoration(
                  color: categories[index].boxColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset(categories[index].path),
                    ),
                  ),
                  Text(
                    categories[index].name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }

  Container searchBar() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: const Color(0xff1D1617).withOpacity(0.11),
          blurRadius: 40,
          spreadRadius: 0.0,
        )
      ]),
      child: TextField(
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset("assets/icons/search.svg"),
            ),
            suffixIcon: Container(
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const VerticalDivider(
                      color: Colors.black,
                      thickness: 0.1,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 15, top: 10, bottom: 10),
                      child: SvgPicture.asset("assets/icons/filter.svg"),
                    ),
                  ],
                ),
              ),
            ),
            contentPadding: const EdgeInsets.all(15),
            hintText: "Search",
            hintStyle: const TextStyle(color: Color(0xffDDDADA), fontSize: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            )),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        "Breakfast",
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.0,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/icons/back-arrow.svg',
            height: 20,
            width: 20,
          ),
          decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(10),
            width: 37,
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/icons/dots.svg',
              height: 5,
              width: 5,
            ),
            decoration: BoxDecoration(
                color: const Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(10)),
          ),
        )
      ],
    );
  }
}

import 'package:dreamer_flutter/config/dreamer_color.dart';
import 'package:dreamer_flutter/presentation/widget/series_item_widget.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: DreamerColor.g4,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 61,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    color: Colors.white,
                  ),
                  width: 310,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: '제목, 작성자를 자유롭게 검색해보세요',
                      hintStyle: TextStyle(
                        fontFamily: 'suit',
                        fontSize: 14,
                        color: Color(0xffc4c4c4),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Result(),
            const SeriesItemWidget(),
            const SeriesItemWidget(),
            const SeriesItemWidget(),
            const SeriesItemWidget(),
            const SeriesItemWidget(),
            const SeriesItemWidget(),
            const SeriesItemWidget(),
            const SeriesItemWidget(),
            const SeriesItemWidget(),
          ],
        ),
      ),
    );
  }
}

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DreamerColor.white,
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "연재 중",
                style: TextStyle(
                  fontFamily: suit,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                width: 78,
              ),
              Text(
                "꿈방",
                style: TextStyle(
                  fontFamily: suit,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                width: 80,
              ),
              Text(
                "작성자",
                style: TextStyle(
                  fontFamily: suit,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 390,
            height: 1,
            decoration: BoxDecoration(
              color: DreamerColor.g3,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:dreamer_flutter/config/dreamer_color.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: DreamerColor.g4,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 71),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 20,
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
          ],
        ),
      ),
    );
  }
}

import 'package:dreamer_flutter/config/dreamer_color.dart';
import 'package:dreamer_flutter/presentation/widget/series_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SeriesMainScreen extends StatefulWidget {
  const SeriesMainScreen({super.key});

  @override
  State<SeriesMainScreen> createState() => _SeriesMainScreenState();
}

class _SeriesMainScreenState extends State<SeriesMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DreamerColor.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Text(
                    '연재 중',
                    style: TextStyle(
                      color: DreamerColor.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {

                      },
                      child: SeriesItemWidget(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:dreamer_flutter/config/dreamer_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SeriesItemWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final int index;

  const SeriesItemWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 75,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: DreamerColor.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const SizedBox(width: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 17),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              color: DreamerColor.black,
                              fontSize: 14,
                              fontFamily: suit,
                              fontWeight: FontWeight.w600),
                        ),
                        Row(
                          children: [
                            Text(
                              subTitle,
                              style: TextStyle(
                                  color: DreamerColor.g2,
                                  fontSize: 12,
                                  fontFamily: suit,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: 29,
                      height: 55,
                      decoration: BoxDecoration(
                        color: DreamerColor.g4,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '2',
                            style: TextStyle(
                              color: DreamerColor.black,
                              fontSize: 14,
                              fontFamily: suit,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '댓글',
                            style: TextStyle(
                              color: DreamerColor.g2,
                              fontSize: 10,
                              fontFamily: suit,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}

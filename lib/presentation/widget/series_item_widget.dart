import 'package:dreamer_flutter/config/dreamer_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SeriesItemWidget extends StatelessWidget {
  const SeriesItemWidget({super.key});

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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15),
                    child: Column(
                      children: [
                        for (int i = 0; i < 2; i++)
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: i == 2 - 1 ? 0 : 3),
                            child: Stack(
                              children: [
                                SvgPicture.asset(
                                  "assets/images/icons/core/banner_icon.svg",
                                  width: 45,
                                  height: 21,
                                ),
                                Positioned(
                                  left: 5,
                                  top: 2,
                                  child: Text(
                                    'Best',
                                    style: TextStyle(
                                      color: DreamerColor.white,
                                      fontSize: 12,
                                      fontWeight:
                                      FontWeight.w600,
                                      fontFamily: suit,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 6),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 17),
                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          '오늘은 큰일났다.',
                          style: TextStyle(
                              color: DreamerColor.black,
                              fontSize: 14,
                              fontFamily: suit,
                              fontWeight: FontWeight.w600),
                        ),
                        Row(
                          children: [
                            Text(
                              '라지',
                              style: TextStyle(
                                  color: DreamerColor.g2,
                                  fontSize: 12,
                                  fontFamily: suit,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(width: 7),
                            Text(
                              '24.02.17',
                              style: TextStyle(
                                  color: DreamerColor.g2,
                                  fontSize: 12,
                                  fontFamily: suit,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(width: 10),
                            SvgPicture.asset(
                              'assets/images/icons/core/books_icon.svg',
                            ),
                            const SizedBox(width: 3),
                            Text(
                              '3',
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
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      color: DreamerColor.g2,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
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

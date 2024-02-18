import 'dart:io';

import 'package:dreamer_flutter/config/dreamer_color.dart';
import 'package:dreamer_flutter/presentation/series/view/series_post_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final picker = ImagePicker();
  XFile? image;
  bool imageChoice = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DreamerColor.g4,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 65,
          ),
          const Row(
            children: [
              SizedBox(
                width: 25,
              ),
              Text(
                "내 정보",
                style: TextStyle(
                  fontFamily: suit,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  width: 100,
                  height: 100,
                  child: ClipOval(
                    child: imageChoice
                        ? Image.file(
                            File(image!.path),
                            fit: BoxFit.cover,
                          )
                        : SvgPicture.asset(
                            'assets/images/icons/page_manager/signup_filled_icon.svg'),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () async {
                      image = await picker.pickImage(
                        source: ImageSource.gallery,
                      );
                      imageChoice = true;
                      setState(() {});
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: DreamerColor.g3,
                      ),
                      child: const Icon(
                        Icons.edit,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 42,
          ),
          Container(
            height: 254,
            width: 350,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                  child: Column(
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SeriesPostScreen(),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/images/icons/info/info_write_icon.svg'),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "글쓰기",
                                  style: TextStyle(
                                    fontFamily: suit,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/images/icons/info/info_mysign_icon.svg'),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "내가 쓴 글",
                                  style: TextStyle(
                                    fontFamily: suit,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/images/icons/info/info_heart_icon.svg'),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "좋아요한 글",
                                  style: TextStyle(
                                    fontFamily: suit,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/images/icons/info/info_comment_icon.svg'),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "내가 쓴 댓글",
                                  style: TextStyle(
                                    fontFamily: suit,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/images/icons/info/info_logout_icon.svg'),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "로그아웃",
                                  style: TextStyle(
                                    fontFamily: suit,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffff0000),
                                  ),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 15,
                              color: Color(0xffff0000),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:dreamer_flutter/config/dreamer_color.dart';
import 'package:dreamer_flutter/presentation/page_manager/provider/page_manager_provider.dart';
import 'package:dreamer_flutter/presentation/page_manager/widget/page_manager_navigator_item_widget.dart';
import 'package:dreamer_flutter/presentation/series/view/series_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageManagerScreen extends ConsumerStatefulWidget {
  const PageManagerScreen({super.key});

  @override
  ConsumerState<PageManagerScreen> createState() => _PageManagerScreenState();
}

class _PageManagerScreenState extends ConsumerState<PageManagerScreen> {
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    const path = 'assets/images/icons/page_manager';
    final pageManagerState = ref.watch(pageControllerProvider);
    final pageManagerNotifier = ref.read(pageControllerProvider.notifier);
    final List<Widget> screenData = [
      SeriesMainScreen(),
      Container(color: Colors.orange),
      Container(color: Colors.yellow),
      Container(color: Colors.green),
      Container(color: Colors.blue),
    ];

    return Scaffold(
      body: PageView.builder(
        controller: controller,
        itemCount: screenData.length,
        itemBuilder: (context, index) {
          return screenData[index];
        },
      ),
      backgroundColor: DreamerColor.white,
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 56,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(10),
            ),
            color: DreamerColor.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.jumpToPage(0);
                    pageManagerNotifier.setPage(0);
                  },
                  child: PageManagerNavigatorItemWidget(
                    path: pageManagerState.index == 0
                        ? '$path/book_filled_icon.svg'
                        : '$path/book_outlined_icon.svg',
                    title: "연재 중",
                    index: 0,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.jumpToPage(1);
                    pageManagerNotifier.setPage(1);
                  },
                  child: PageManagerNavigatorItemWidget(
                    path: '$path/search_outlined_icon.svg',
                    color: pageManagerState.index == 1
                        ? DreamerColor.g1
                        : DreamerColor.g3,
                    title: "검색",
                    index: 1,
                  ),
                ),
                const SizedBox(width: 50),
                GestureDetector(
                  onTap: () {
                    controller.jumpToPage(3);
                    pageManagerNotifier.setPage(3);
                  },
                  child: PageManagerNavigatorItemWidget(
                    path: pageManagerState.index == 3
                        ? '$path/library_filled_icon.svg'
                        : '$path/library_outlined_icon.svg',
                    title: "내 서재",
                    index: 3,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.jumpToPage(4);
                    pageManagerNotifier.setPage(4);
                  },
                  child: PageManagerNavigatorItemWidget(
                    path: pageManagerState.index == 4
                        ? '$path/person_filled_icon.svg'
                        : '$path/person_outlined_icon.svg',
                    title: "내 정보",
                    index: 4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () {
          controller.jumpToPage(2);
          pageManagerNotifier.setPage(2);
        },
        child: Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: pageManagerState.index == 2
                ? DreamerColor.keyDeepPurple
                : DreamerColor.keyPurple,
            shape: BoxShape.circle,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                '$path/star_filled_icon.svg',
              ),
              Text(
                '꿈방',
                style: TextStyle(
                  color: DreamerColor.white,
                  fontFamily: suit,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

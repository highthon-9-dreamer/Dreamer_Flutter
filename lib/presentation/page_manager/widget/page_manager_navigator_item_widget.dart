import 'package:dreamer_flutter/config/dreamer_color.dart';
import 'package:dreamer_flutter/presentation/page_manager/provider/page_manager_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageManagerNavigatorItemWidget extends ConsumerWidget {
  final String path;
  final String title;
  final int index;
  final Color? color;
  const PageManagerNavigatorItemWidget({
    super.key,
    required this.title,
    required this.index,
    required this.path,
    this.color,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageManagerState = ref.watch(pageControllerProvider);
    final pageManagerNotifier = ref.read(pageControllerProvider.notifier);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          path,
          color: color,
        ),
        Text(
          title,
          style: TextStyle(
            color: pageManagerState.index == index ? DreamerColor.g1 : DreamerColor.g3,
            fontFamily: suit,
            fontWeight: pageManagerState.index == index ? FontWeight.w600 : FontWeight.w500,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

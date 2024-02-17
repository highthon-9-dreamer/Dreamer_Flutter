import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageControllerProvider =
    StateNotifierProvider<PageControllerNotifier, Page>((ref) {
  return PageControllerNotifier();
});

class PageControllerNotifier extends StateNotifier<Page> {
  PageControllerNotifier() : super(Page(index: 0));

  void setPage(int value) {
    state = Page(index: value);
  }
}

class Page {
  final int index;

  Page({required this.index});
}

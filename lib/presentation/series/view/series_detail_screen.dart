import 'package:dreamer_flutter/config/dreamer_color.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SeriesDetailScreen extends StatefulWidget {
  final int index;
  final String? title;

  const SeriesDetailScreen({
    super.key,
    required this.index,
    this.title,
  });

  @override
  State<SeriesDetailScreen> createState() => _SeriesDetailScreenState();
}

class _SeriesDetailScreenState extends State<SeriesDetailScreen> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(DreamerColor.white)
      ..loadRequest(Uri.parse(
          "https://dreamer-frontend-chi.vercel.app/detail/${widget.index}"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF2F3F5),
        title: Text(
          widget.title ?? '연재 중',
          style: TextStyle(
            color: DreamerColor.black,
            fontFamily: suit,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}

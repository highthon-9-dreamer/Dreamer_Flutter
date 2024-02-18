import 'package:dreamer_flutter/config/dreamer_color.dart';
import 'package:dreamer_flutter/secret.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SeriesPostScreen extends StatefulWidget {
  const SeriesPostScreen({super.key});

  @override
  State<SeriesPostScreen> createState() => _SeriesPostScreenState();
}

class _SeriesPostScreenState extends State<SeriesPostScreen> {
  late WebViewController controller;
  final cookieString = 'accessToken=$accessToken; path=/';

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(DreamerColor.white)
      ..loadRequest(Uri.parse("https://dreamer-frontend-chi.vercel.app/write"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF2F3F5),
        title: Text(
          '시리즈 작성하기',
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

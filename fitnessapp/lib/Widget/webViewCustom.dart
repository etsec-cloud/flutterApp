import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class WebViewCustom extends StatefulWidget {
  @override
  State<WebViewCustom> createState() => _WebViewCustomState();
}

class _WebViewCustomState extends State<WebViewCustom> {
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://www.decathlon.fr/',
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}

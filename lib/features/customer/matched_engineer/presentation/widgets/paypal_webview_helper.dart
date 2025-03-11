import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'dart:io';
import 'package:flutter/services.dart';

class WebviewHelper extends StatefulWidget {
  final String link;
  const WebviewHelper({super.key, required this.link});

  @override
  State<WebviewHelper> createState() => _WebviewHelperState();
}

class _WebviewHelperState extends State<WebviewHelper> {
  late final WebViewController webviewController;

  @override
  void dispose() {
    if (Platform.isIOS) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ));
    } else {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ));
    }

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Initialize the WebView
    WebViewController webViewControllerTemp = WebViewController();

    webViewControllerTemp
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''Page resource error:
                        code: ${error.errorCode}
                        description: ${error.description}
                        errorType: ${error.errorType}
                        isForMainFrame: ${error.isForMainFrame}
                    ''');
          },
          onNavigationRequest: (NavigationRequest action) {
            debugPrint('allowing navigation to ${action.url}');
            return NavigationDecision.navigate;
          },
          onUrlChange: (UrlChange change) {
            debugPrint('url change to ${change.url}');
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.link));

    webviewController = webViewControllerTemp;
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: WebViewWidget(controller: webviewController),
      ),
    );
  }
}

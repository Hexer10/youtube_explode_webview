import 'dart:convert';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_explode_dart/js_challenge.dart';

class WebviewEJSSolver extends BaseEJSSolver {
  final WebViewController _controller;

  WebviewEJSSolver(this._controller);

  static Future<WebviewEJSSolver> init() async {
    final controller = WebViewController();
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    final modules = await EJSBuilder.getJSModules();
    controller.runJavaScript(modules);

    return WebviewEJSSolver(controller);
  }

  @override
  Future<String> executeJavaScript(String jsCode) async {
    final result = await _controller.runJavaScriptReturningResult(jsCode);
    if (result is String) {
      return json.decode(result);
    } else {
      throw Exception(
        'Expected String result from WebView JS execution, got: $result',
      );
    }
  }
}

import 'package:flutter/material.dart';
import '../../core/constants/icon_constant.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final String url;
  const WebViewScreen({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(arrowBackIcon),
          ),
        ),
        body: WebView(
          initialUrl: url,
        ));
  }
}

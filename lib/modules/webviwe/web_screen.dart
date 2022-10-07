
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WebView_Screen extends StatelessWidget {
  final url;
  const WebView_Screen({Key? key,required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('News App'),

        ),
      ),
      body: WebView(
        initialUrl: url,
      ),

    );
  }
}

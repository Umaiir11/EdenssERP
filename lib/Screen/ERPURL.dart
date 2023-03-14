import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ErpUrl extends StatefulWidget {
  const ErpUrl({Key? key}) : super(key: key);

  @override
  State<ErpUrl> createState() => _ErpUrlState();
}

class _ErpUrlState extends State<ErpUrl> {
  late WebViewController _webViewController;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(

        body: Stack(
          children: [
            WebView(
              gestureNavigationEnabled: true,

              initialUrl: 'https://edens-erp.xaberp.com',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController controller) {
                _webViewController = controller;
              },
              onPageFinished: (String url) {
                setState(() {
                  isLoading = false;
                });
              },
            ),
            if (isLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    if (await _webViewController.canGoBack()) {
      _webViewController.goBack();
      return false;
    } else {
      SystemNavigator.pop();
      return true;
    }
  }
}

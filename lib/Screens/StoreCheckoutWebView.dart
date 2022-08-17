import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class StoreCheckoutWebview extends StatefulWidget {
  String? link = null;

  StoreCheckoutWebview(this.link);

  @override
  State<StoreCheckoutWebview> createState() => StoreCheckoutWebviewState();
}

class StoreCheckoutWebviewState extends State<StoreCheckoutWebview> {
  late InAppWebViewController _webViewController;

  final _key = UniqueKey();
  String? url = null;
  String? reference = null;

  @override
  void initState() {
    print(widget.link);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(widget.link.toString())),
          androidOnPermissionRequest: (InAppWebViewController controller,
              String origin, List<String> resources) async {
            return PermissionRequestResponse(
                resources: resources,
                action: PermissionRequestResponseAction.GRANT);
          },
          onWebViewCreated: (InAppWebViewController controller) {
            _webViewController = controller;
            _webViewController.webStorage.localStorage;
            _webViewController.javaScriptHandlersMap;
            _webViewController.android.startSafeBrowsing();
          },
          initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
              mediaPlaybackRequiresUserGesture: false,
              allowFileAccessFromFileURLs: true,
              javaScriptEnabled: true,
            ),
          ),
          onLoadStart: (controller, urls) {
            setState(() {
              url = urls.toString();
              print("ONLOAD${url}");
              // if (url ==
              //     "https://docupass.app/CSPRWVTEX3?reference=${reference}&customid=") {
              //   Navigator.of(context).pop();
              // }
            });
          },
          onLoadStop: (controller, urls) async {
            setState(() {
              url = urls.toString();
              print("ONSTOP${url}");
              // if (url ==
              //     "https://docupass.app/CSPRWVTEX3?reference=${reference}&customid=") {
              //   Navigator.of(context).pop();
              // }
            });
          },
          onUpdateVisitedHistory: (controller, urls, androidIsReload) {
            setState(() {
              url = urls.toString();
              if (url ==
                  "http://test.aswaag.net/api/app/tap-cart-checkout-response?tap_id=chg_TS024720221320x2ZN2907144") {
                Navigator.pop(context, "Done");
              }
              print("UPDATE${url}");
            });
          },
        ),
      ),
    );
  }
}

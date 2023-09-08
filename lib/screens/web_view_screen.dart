import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {
  const WebviewScreen({Key? key}) : super(key: key);

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  var loadingPercentage = 0;
  late final WebViewController _controller;
  // final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            if (!mounted) return;
            setState(() => loadingPercentage = 0);
          },
          onProgress: (progress) {
            if (!mounted) return;
            setState(() => loadingPercentage = progress);
          },
          onPageFinished: (String url) async {
            if (!mounted) return;
            setState(() => loadingPercentage = 100);
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse("https://github.com/olamilekan-adeleke"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWidget(),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (loadingPercentage < 100)
            LinearProgressIndicator(
              value: loadingPercentage / 100.0,
            ),
          // ValueListenableBuilder<bool>(
          //   valueListenable: isLoading,
          //   builder: (_, bool loading, __) {
          //     return Center(
          //       child: Visibility(
          //         visible: loading,
          //         child: const SizedBox(
          //           width: 20,
          //           height: 20,
          //           child: CircularProgressIndicator(),
          //         ),
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }

  AppBar buildAppBarWidget() {
    return AppBar(
      title: const Text(
        "Kod Enigma Github",
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}

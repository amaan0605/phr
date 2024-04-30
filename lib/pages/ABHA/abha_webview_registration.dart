import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewRegistration extends StatefulWidget {
  const WebViewRegistration({super.key});

  @override
  WebViewRegistrationState createState() => WebViewRegistrationState();
}

class WebViewRegistrationState extends State<WebViewRegistration> {
  @override
  void initState() {
    super.initState();
  }

  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(Colors.white)
    // on Sandbox dev mode
    ..loadRequest(Uri.parse('https://healthidsbx.abdm.gov.in/register'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black.withOpacity(0.1),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.chevron_left_rounded,
            color: Colors.black45,
            size: 32,
          ),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
        titleSpacing: 0,
        title: const Text(
          'Registration',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black45,
          ),
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payments_getway/manager/paymob_payment/paymob_payment_cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymobVisaView extends StatefulWidget {
  const PaymobVisaView({super.key});

  @override
  State<PaymobVisaView> createState() => _PaymobVisaViewState();
}

class _PaymobVisaViewState extends State<PaymobVisaView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    var token = BlocProvider.of<PaymobPaymentCubit>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white70,
          title: const Text('Pay using paymob'),
          centerTitle: true),
      body: WebView(
        initialUrl:
            'https://accept.paymob.com/api/acceptance/iframes/394533?payment_token=${token.token}',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        onProgress: (int progress) {
          log('WebView is loading (progress : $progress%)');
        },
        javascriptChannels: <JavascriptChannel>{
          _toasterJavascriptChannel(context),
        },
        gestureNavigationEnabled: true,
        backgroundColor: const Color(0x00000000),
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }
}

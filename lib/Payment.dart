import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:developer';
import 'package:razorpay_web/razorpay_web.dart';

class Payment extends StatefulWidget {
  final String title;
  const Payment({Key? key, required this.title}) : super(key: key);
  
  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  late Razorpay _razorpay;
  late String titles= widget.title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: openCheckout, child:  Text('pay  '));
  }


  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_live_ILgsfZCZoFIKMb',
      'amount': titles,
      'name': 'Cravee',
      'description': 'Food Order',
      'timeout': 300,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    log('Success Response: $response');
    Fluttertoast.showToast(
        msg: "SUCCESS: ${response.paymentId!}",
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    log('Error Response: $response');
    Fluttertoast.showToast(
        msg: "ERROR: ${response.code} - ${response.message!}",
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    log('External SDK Response: $response');
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: ${response.walletName!}",
        toastLength: Toast.LENGTH_SHORT);
  }
}

import 'dart:developer';

import 'package:demo/Payment.dart';
import 'package:demo/Product/context.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_web/razorpay_web.dart';

class Addproduct extends StatefulWidget {
  const Addproduct({super.key});

  @override
  State<Addproduct> createState() => _AddproductState();
}

class _AddproductState extends State<Addproduct> {
  late Razorpay _razorpay;
  int totalPayemnt = 0;
  

  @override
  Widget build(BuildContext context) {
  List<Map<String, String>> products = Provider.of<Counter>(context).getCounter;
  for(int i=1; i< products.length;i++ ){
    totalPayemnt+=int.parse(products[i]['paisa']!) ;
  }
    return Column(
      children: [
        MediaQuery.of(context).size.width > 800 ?
        Expanded(
          child:
             new ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${products[index]["name"]}'),
                  Text('${products[index]["paisa"]}')
                ],
              );
            },
         ) ,
         ):
         new ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Text('${products[index]}');
                },
              ),
        //  Payment(title: totalPayemnt.toString()),
         ElevatedButton(onPressed: openCheckout, child:  Text('pay ${totalPayemnt} '))
      ],
    );
     
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
      'amount': totalPayemnt,
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

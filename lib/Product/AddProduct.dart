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
        // MediaQuery.of(context).size.width > 800 ?
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                  width: 1, color: Color.fromARGB(158, 0, 0, 0), style: BorderStyle.solid),
            )
          ),
          child: 
         Center(
            child: Text('Current sales (${products.length-1})',style:TextStyle(
              fontSize: 20.0,fontWeight: FontWeight.w700
            ) ,
            ),
        )
         ),
        Expanded(
          child:
             new ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return 
              Padding(padding: EdgeInsets.only(top: 10,bottom: 10),
              child: 
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${products[index]["name"]}',style: TextStyle(
                    fontSize: 18,color: Colors.blue
                  ),),
                  Text('₹ ${products[index]["paisa"]}',
                        style: TextStyle(fontSize: 16),
                      ),

                ],
              )
              );
            },
         ) ,
         ),
        Container(
          width: 400,
          height: 40,
          child: 
         ElevatedButton(onPressed: openCheckout, child:  Text('Pay ₹ ${totalPayemnt} ',style: TextStyle(
          color: Colors.white,fontSize: 20
         ),),
         style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 10, 124, 238), // Background color
          ),
         )
        )
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

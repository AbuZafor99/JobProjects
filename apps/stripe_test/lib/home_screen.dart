import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:stripe_test/keys.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double amount = 20;
  Map<String, dynamic>? paymentIntentData;

  Future<Map<String, dynamic>> makeIntentForPayment(int amountTobeCharged, String currency) async {
    try {
      final body = {
        'amount': amountTobeCharged.toString(),
        'currency': currency,
        'payment_method_types[]': 'card',
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        body: body,
        headers: {
          'Authorization': 'Bearer $privateKey',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create payment intent: ${response.statusCode}');
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error creating payment intent: $error');
      }
      rethrow;
    }
  }

  Future<void> showPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      setState(() {
        paymentIntentData = null;
      });
      if (kDebugMode) {
        print('Payment successful!');
      }
    } on StripeException catch (error) {
      if (kDebugMode) {
        print('Error presenting payment sheet: ${error.error.localizedMessage}');
      }
    } catch (error) {
      if (kDebugMode) {
        print('Unexpected error: $error');
      }
    }
  }

  Future<void> paymentSheetInitialization(int amountTobeCharged, String currency) async {
    try {
      // Create payment intent
      paymentIntentData = await makeIntentForPayment(amountTobeCharged, currency);
      
      // Initialize payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          allowsDelayedPaymentMethods: true,
          paymentIntentClientSecret: paymentIntentData!['client_secret'],
          style: ThemeMode.dark,
          merchantDisplayName: 'Company Name',
        ),
      );
      
      // Show payment sheet
      await showPaymentSheet();
    } catch (error) {
      if (kDebugMode) {
        print('Error initializing payment sheet: $error');
      }
      // Show error to user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Payment failed: ${error.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () async {
                await paymentSheetInitialization(
                  (amount * 100).round(), // Convert to cents
                  'USD',
                );
              },
              child: Text('Pay Now \$${amount.toStringAsFixed(2)}'),
            ),
          ),
        ],
      ),
    );
  }
}
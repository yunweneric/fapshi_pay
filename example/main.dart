import 'package:fapshi_pay/fapshi_pay.dart';
import 'package:flutter/material.dart';

main() => runApp(const DemoApp());

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Fapshi Payment', home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: FapshiPay(
            env: AppEnv.DEV,
            sandboxApiKey: '',
            sandboxApiUser: '',
            liveApiKey: '',
            liveApiUser: '',
            title: "Pay now",
            amount: 3000,
            phone: "67xxxxxxxx",
            icon: const Icon(Icons.payment),
            shouldCheckPaymentStatus: true,
            onPayComplete: (paymentResponse) {},
            onCheckPaymentFailed: (paymentResponse) {},
            onCheckPaymentSuccess: (paymentResponse) {},
          ),
        ),
      ),
    );
  }
}

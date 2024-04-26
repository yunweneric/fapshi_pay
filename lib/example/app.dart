import 'package:fapshi_pay/fapshi_pay.dart';
import 'package:flutter/material.dart';

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fapshi Payment',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), useMaterial3: true),
      home: const HomePage(),
    );
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
          child: FapshiPaymentButton(
            env: AppEnv.DEV,
            sandboxApiKey: '',
            sandboxApiUser: '',
            liveApiKey: '',
            liveApiUser: '',
            title: "Pay now",
            amount: 3000,
            phone: "670912935",
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

<p align="center">
  <a href="https://fapshi.com/" target="blank"><img src="https://raw.githubusercontent.com/yunweneric/fapshi_pay/0b495ab0ba7d22d6093b02f7fcc24f0300f686cf/fapshi.svg" width="320" alt="Fapshi Logo" /></a>
</p>
  <p align="center">Welcome to <a href="https://fapshi.com/" target="_blank"> The Fapshi Flutter SDK </a>Simplified Payments for the internet</p>
    <p align="center">
<a href="https://github.com/yunweneric/fapshi_pay" target="_blank"><img alt="Pub Version" src="https://img.shields.io/pub/v/pay_unit_sdk?color=%233F51B5&style=for-the-badge" ></a>
<a><img alt="GitHub repo size" src="https://img.shields.io/github/repo-size/yunweneric/fapshi_pay?color=%233F51B5&style=for-the-badge"></a>
<a><img alt="GitHub issues" src="https://img.shields.io/github/issues-raw/yunweneric/fapshi_pay?color=%233F51B5&style=for-the-badge"></a>
<a href="" target="_blank"><img alt="GitHub Repo stars" src="https://img.shields.io/github/stars/yunweneric/fapshi_pay?color=%233F51B5&style=for-the-badge"></a>
<a><img alt="GitHub forks" src="https://img.shields.io/github/forks/yunweneric/fapshi_pay?color=%233F51B5&style=for-the-badge"></a>
<a><img alt="GitHub code size in bytes" src="https://img.shields.io/github/languages/code-size/yunweneric/fapshi_pay?color=%233F51B5&style=for-the-badge"></a>
<a href = "https://fapshi.com/"><img alt="Website" src="https://img.shields.io/website?color=%233F51B5&style=for-the-badge&up_color=3F51B5&up_message=Visit%20us&url=https%3A%2F%2Fpayunit.net%2Fdocs%2F"></a>

</p>

**Payment SDK for Flutter**

This is a payment SDK for Flutter apps, developed in Dart, that provides functionalities to integrate various payment methods seamlessly into your Flutter applications.

### Features

- Easy integration of popular payment methods
- Support for both iOS and Android platforms
- Customizable UI components for payment flows
- Secure handling of payment transactions
- Extensive documentation and examples

### Installation

To use this SDK in your Flutter project, add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  fapshi_pay: ^1.0.0
```

Then run:

```bash
$ flutter pub get
```

### Usage

1. Import the payment SDK in your Dart file:

```dart
import 'package:fapshi_pay/fapshi_pay.dart';
```

2. Add the FapshiPay Widget and use:

```dart
      FapshiPaymentButton(
            env: AppEnv.DEV,
            sandboxApiKey: '',
            sandboxApiUser: '',
            liveApiKey: '',
            liveApiUser: '',
            title: "Pay now",
            amount: 3000,
            phone: "67xxxxxx",
            icon: const Icon(Icons.payment),
            shouldCheckPaymentStatus: true,
            onPayComplete: (paymentResponse) {},
            onCheckPaymentFailed: (paymentResponse) {},
            onCheckPaymentSuccess: (paymentResponse) {},
          ),
```

### Contribution Guide

We welcome contributions from the community to make this SDK better! To contribute, follow these steps:

1. Fork the repository and clone it to your local machine:

```bash
$ https://github.com/yunweneric/fapshi_pay
```

2. Create a new branch for your changes:

```bash
$ git checkout -b feature/your-feature-name
```

3. Make your changes and test them thoroughly.

4. Add tests for new features or changes, and ensure all tests pass:

```bash
$ flutter test
```

5. Commit your changes and push them to your fork:

```bash
$ git add .
$ git commit -m "Your descriptive commit message"
$ git push origin feature/your-feature-name
```

6. Create a pull request from your fork to the main repository.

### Code of Conduct

Please note that this project is governed by a Code of Conduct. We expect all contributors and users to adhere to it. The Code of Conduct can be found in the `CODE_OF_CONDUCT.md` file in this repository.

### License

This SDK is released under the MIT License. You can find the license details in the `LICENSE` file.

### Support

For any questions, issues, or feature requests, feel free to create an issue in this repository or contact us at yunweneric@gmail.com.

### Acknowledgements

We would like to thank all contributors who have helped in making this SDK possible.

---

Feel free to add any additional information specific to your SDK or your organization!

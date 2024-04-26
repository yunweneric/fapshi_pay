import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fapshi_pay/src/components/bottom_sheets.dart';
import 'package:fapshi_pay/src/controllers/payment/payment_bloc.dart';
import 'package:fapshi_pay/src/enum/env.dart';
import 'package:fapshi_pay/src/models/direct_pay_request_model/direct_pay_request_model.dart';
import 'package:fapshi_pay/src/models/direct_pay_response_model/direct_pay_response_model.dart';
import 'package:fapshi_pay/src/models/payment_status_response_model/payment_status_response_model.dart';
import 'package:fapshi_pay/src/repositories/payment_repository.dart';
import 'package:fapshi_pay/src/services/payment_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FapshiPaymentButton extends StatefulWidget {
  final String? title;

  /// The title of the payment button.

  final Widget? icon;

  /// An optional icon widget to be displayed alongside the title.

  final Widget? button;

  /// An optional widget that can be used instead of a title. This is useful when you need a custom widget for the button.

  final TextStyle? textStyle;

  /// The text style of the title or button widget.

  final ButtonStyle? buttonStyle;

  /// The style of the button widget.

  final VoidCallback? onPressed;

  /// A callback function that will be invoked when the button is pressed.

  final int amount;

  /// The amount to be paid.

  final String phone;

  /// The phone number of the payee.

  final void Function(DirectPayResponseModel paymentResponse)? onPayComplete;

  /// A callback function that will be invoked when the payment is completed successfully.

  final void Function(PaymentStatusResponseModel paymentResponse)?
      onCheckPaymentSuccess;

  /// A callback function that will be invoked when checking payment status is successful.
  final void Function(PaymentStatusResponseModel paymentResponse)?
      onCheckPaymentFailed;

  /// A callback function that will be invoked when checking payment status fails.

  final void Function()? initialLoadingUI;

  /// A callback function to show initial loading UI.

  final void Function()? checkPaymentLoadingUI;

  /// A callback function to show loading UI during payment status check.

  final void Function(String errorMessage)? errorUI;

  /// A callback function to show UI in case of an error during payment.

  final void Function(PaymentStatusResponseModel paymentResponse)? successUI;

  /// A callback function to show UI when payment is successful.

  final bool? shouldCheckPaymentStatus;

  /// A boolean flag indicating whether to check payment status after payment completion.

  final bool? isIconLeading;

  /// A boolean flag indicating whether the icon should be leading.

  final bool? canClosePreloader;

  /// A boolean flag indicating whether the preloader can be closed.

  final AppEnv env;

  /// The environment configuration for the payment system (e.g., sandbox or live).

  final String sandboxApiUser;

  /// The API user for the sandbox environment.

  final String sandboxApiKey;

  /// The API key for the sandbox environment.

  final String liveApiUser;

  /// The API user for the live environment.

  final String liveApiKey;

  /// The API key for the live environment.

  const FapshiPaymentButton({
    super.key,
    this.title,
    this.icon,
    this.buttonStyle,
    this.textStyle,
    this.button,
    this.onPressed,
    required this.amount,
    required this.phone,
    this.onPayComplete,
    this.onCheckPaymentSuccess,
    this.onCheckPaymentFailed,
    this.initialLoadingUI,
    this.checkPaymentLoadingUI,
    this.errorUI,
    this.successUI,
    this.shouldCheckPaymentStatus = true,
    this.isIconLeading,
    this.canClosePreloader,
    required this.env,
    required this.sandboxApiUser,
    required this.sandboxApiKey,
    required this.liveApiUser,
    required this.liveApiKey,
  });

  @override
  State<FapshiPaymentButton> createState() => _FapshiPaymentButtonState();
}

class _FapshiPaymentButtonState extends State<FapshiPaymentButton> {
  late PaymentBloc paymentBloc;

  @override
  void initState() {
    initialize();
    super.initState();
  }

  /// Initializes the payment system.
  ///
  /// This function sets up the necessary configurations for making payment requests.
  /// It sets the base URL and headers for making HTTP requests using Dio.
  /// It also initializes a [PaymentBloc] to handle payment-related operations.
  void initialize() {
    // Base URLs for live and development environments
    String baseUrl = "https://live.fapshi.com";
    String devBaseUrl = "https://sandbox.fapshi.com";

    // Function to generate HTTP headers
    Map<String, String> headers() {
      return {
        'Content-Type': 'application/json',
        "apiuser": widget.env == AppEnv.DEV
            ? widget.sandboxApiUser
            : widget.liveApiUser,
        "apikey":
            widget.env == AppEnv.DEV ? widget.sandboxApiKey : widget.liveApiKey,
      };
    }

    // Function to create a Dio instance with configured options
    Dio dio() {
      final options = BaseOptions(
        baseUrl: widget.env == AppEnv.DEV ? devBaseUrl : baseUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
        headers: headers(),
        validateStatus: (status) {
          if (status == null) return false;
          return status <= 500;
        },
      );
      return Dio(options);
    }

    // Adding log interceptor to Dio
    dio().interceptors.addAll([LogInterceptor()]);

    // Creating a stream controller for payment status updates
    StreamController<PaymentStatusResponseModel> paymentController =
        StreamController.broadcast();

    // Creating a payment service instance
    PaymentService paymentService = PaymentService(http: dio());

    // Creating a payment repository instance
    final paymentRepository = PaymentRepository(paymentService: paymentService);

    // Initializing the PaymentBloc with the payment repository and stream controller
    setState(() {
      paymentBloc = PaymentBloc(paymentRepository, paymentController);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentBloc, PaymentState>(
      bloc: paymentBloc,
      listener: (context, state) {
        if (state is DirectPaymentInitial) {
          widget.initialLoadingUI == null
              ? AppBottomSheet.loadingSheet(context,
                  isDismissible: widget.canClosePreloader)
              : widget.initialLoadingUI!();
        }
        if (state is DirectPaymentError) {
          if (widget.errorUI == null) {
            if (widget.initialLoadingUI == null) Navigator.pop(context);
            AppBottomSheet.errorSheet(context, errorText: state.message);
          } else {
            widget.errorUI!(state.message);
          }
        }
        if (state is DirectPaymentSuccess) {
          if (widget.shouldCheckPaymentStatus == true) {
            if (widget.errorUI == null) {
              if (widget.initialLoadingUI == null) Navigator.pop(context);
              AppBottomSheet.loadingSheet(context,
                  loadingText: "Checking payment status!",
                  isDismissible: widget.canClosePreloader);
            } else {
              widget.checkPaymentLoadingUI!();
            }
          } else {
            Navigator.pop(context);
          }
          if (widget.onPayComplete != null)
            widget.onPayComplete!(state.response);
        }

        if (state is CheckPaymentStatusError) {
          if (widget.errorUI == null) {
            if (widget.checkPaymentLoadingUI == null) Navigator.pop(context);
            AppBottomSheet.errorSheet(context, errorText: state.message);
          } else {
            widget.errorUI!(state.message);
          }
          if (widget.onCheckPaymentFailed != null)
            widget.onCheckPaymentFailed!(state.response);
        }
        if (state is CheckPaymentStatusSuccess) {
          if (widget.successUI == null) {
            if (widget.checkPaymentLoadingUI == null) Navigator.pop(context);
            AppBottomSheet.successSheet(context);
          } else {
            widget.successUI!(state.response);
          }
          if (widget.onCheckPaymentSuccess != null)
            widget.onCheckPaymentSuccess!(state.response);
        }
      },
      builder: (context, state) {
        return Container(
          child: widget.button ??
              ElevatedButton(
                style: widget.buttonStyle ??
                    ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  if (widget.onPressed == null) {
                    paymentBloc.add(
                      DirectPaymentEvent(
                        model: DirectPayRequestModel(
                            amount: widget.amount, phone: widget.phone),
                        shouldCheckPaymentStatus:
                            widget.shouldCheckPaymentStatus,
                      ),
                    );
                  } else {
                    widget.onPressed!();
                  }
                },
                child: Builder(builder: (context) {
                  List<Widget> widgets = [
                    if (widget.title != null)
                      Text(widget.title!, style: widget.textStyle),
                    if (widget.icon != null) const SizedBox(width: 10),
                    if (widget.icon != null) widget.icon!,
                  ];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.isIconLeading == true
                        ? widgets.reversed.toList()
                        : widgets,
                  );
                }),
              ),
        );
      },
    );
  }
}

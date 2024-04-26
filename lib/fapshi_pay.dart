// import 'dart:async';

// import 'package:dio/dio.dart';
// import 'package:fapshi_pay/src/components/bottom_sheets.dart';
// import 'package:fapshi_pay/src/controllers/payment/payment_bloc.dart';
// import 'package:fapshi_pay/src/enum/env.dart';
// import 'package:fapshi_pay/src/models/direct_pay_request_model/direct_pay_request_model.dart';
// import 'package:fapshi_pay/src/models/direct_pay_response_model/direct_pay_response_model.dart';
// import 'package:fapshi_pay/src/models/payment_status_response_model/payment_status_response_model.dart';
// import 'package:fapshi_pay/src/repositories/payment_repository.dart';
// import 'package:fapshi_pay/src/services/payment_service.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class FapshiPaymentButton extends StatefulWidget {
//   final String? title;
//   final Widget? icon;
//   final Widget? button;
//   final TextStyle? textStyle;
//   final ButtonStyle? buttonStyle;
//   final VoidCallback? onPressed;
//   final int amount;
//   final String phone;
//   final void Function(DirectPayResponseModel paymentResponse)? onPayComplete;
//   final void Function(PaymentStatusResponseModel paymentResponse)? onCheckPaymentSuccess;
//   final void Function(PaymentStatusResponseModel paymentResponse)? onCheckPaymentFailed;
//   final VoidCallback? loadingWidget;
//   final void Function(String errorMessage)? errorWidget;
//   final void Function(PaymentStatusResponseModel paymentResponse)? successWidget;
//   final bool? shouldCheckPaymentStatus;
//   final bool? isIconLeading;
//   final AppEnv env;
//   final String sandboxApiUser;
//   final String sandboxApiKey;
//   final String liveApiUser;
//   final String liveApiKey;
//   const FapshiPaymentButton({
//     super.key,
//     this.title,
//     this.icon,
//     this.buttonStyle,
//     this.textStyle,
//     this.button,
//     this.onPressed,
//     required this.amount,
//     required this.phone,
//     this.onPayComplete,
//     this.onCheckPaymentSuccess,
//     this.onCheckPaymentFailed,
//     this.loadingWidget,
//     this.errorWidget,
//     this.successWidget,
//     this.shouldCheckPaymentStatus = true,
//     this.isIconLeading,
//     required this.env,
//     required this.sandboxApiUser,
//     required this.sandboxApiKey,
//     required this.liveApiUser,
//     required this.liveApiKey,
//   });

//   @override
//   State<FapshiPaymentButton> createState() => _FapshiPaymentButtonState();
// }

// class _FapshiPaymentButtonState extends State<FapshiPaymentButton> {
//   late PaymentBloc paymentBloc;

//   @override
//   void initState() {
//     initialize();
//     super.initState();
//   }

//   initialize() {
//     String baseUrl = "https://live.fapshi.com";
//     String devBaseUrl = "https://sandbox.fapshi.com";
//     Map<String, String> headers() {
//       return {
//         'Content-Type': 'application/json',
//         "apiuser": widget.env == AppEnv.DEV ? widget.sandboxApiUser : widget.liveApiUser,
//         "apikey": widget.env == AppEnv.DEV ? widget.sandboxApiKey : widget.liveApiKey,
//       };
//     }

//     Dio dio() {
//       final options = BaseOptions(
//         baseUrl: widget.env == AppEnv.DEV ? devBaseUrl : baseUrl,
//         connectTimeout: const Duration(seconds: 5),
//         receiveTimeout: const Duration(seconds: 3),
//         headers: headers(),
//         validateStatus: (status) {
//           if (status == null) return false;
//           return status <= 500;
//         },
//       );
//       return Dio(options);
//     }

//     dio().interceptors.addAll(
//       [LogInterceptor()],
//     );

//     StreamController<PaymentStatusResponseModel> paymentController = StreamController.broadcast();

//     PaymentService paymentService = PaymentService(http: dio());

//     final paymentRepository = PaymentRepository(paymentService: paymentService);

//     setState(() {
//       paymentBloc = PaymentBloc(paymentRepository, paymentController);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<PaymentBloc, PaymentState>(
//       bloc: paymentBloc,
//       listener: (context, state) {
//         if (state is DirectPaymentInitial) {
//           widget.loadingWidget == null ? AppBottomSheet.loadingSheet(context) : widget.loadingWidget!();
//         }
//         if (state is DirectPaymentError) {
//           if (widget.errorWidget == null) {
//             Navigator.pop(context);
//             AppBottomSheet.errorSheet(context, errorText: state.message);
//           } else {
//             widget.errorWidget!(state.message);
//           }
//         }
//         if (state is DirectPaymentSuccess) {
//           if (widget.shouldCheckPaymentStatus == true) {
//             Navigator.pop(context);
//             AppBottomSheet.loadingSheet(context, loadingText: "Checking payment status!");
//           } else {
//             Navigator.pop(context);
//           }
//           if (widget.onPayComplete != null) widget.onPayComplete!(state.response);
//         }

//         if (state is CheckPaymentStatusError) {
//           if (widget.errorWidget == null) {
//             Navigator.pop(context);
//             AppBottomSheet.errorSheet(context, errorText: state.message);
//           } else {
//             widget.errorWidget!(state.message);
//           }
//           if (widget.onCheckPaymentFailed != null) widget.onCheckPaymentFailed!(state.response);
//         }
//         if (state is CheckPaymentStatusSuccess) {
//           if (widget.successWidget == null) {
//             Navigator.pop(context);
//             AppBottomSheet.successSheet(context);
//           } else {
//             widget.successWidget!(state.response);
//           }
//           if (widget.onCheckPaymentSuccess != null) widget.onCheckPaymentSuccess!(state.response);
//         }
//       },
//       builder: (context, state) {
//         return Container(
//           child: widget.button ??
//               ElevatedButton(
//                 style: widget.buttonStyle ?? ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
//                 onPressed: () {
//                   if (widget.onPressed == null) {
//                     paymentBloc.add(
//                       DirectPaymentEvent(
//                         model: DirectPayRequestModel(amount: widget.amount, phone: widget.phone),
//                         shouldCheckPaymentStatus: widget.shouldCheckPaymentStatus,
//                       ),
//                     );
//                   } else {
//                     widget.onPressed!();
//                   }
//                 },
//                 child: Builder(builder: (context) {
//                   List<Widget> widgets = [
//                     if (widget.title != null) Text(widget.title!, style: widget.textStyle),
//                     if (widget.icon != null) const SizedBox(width: 10),
//                     if (widget.icon != null) widget.icon!,
//                   ];
//                   return Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: widget.isIconLeading == true ? widgets.reversed.toList() : widgets,
//                   );
//                 }),
//               ),
//         );
//       },
//     );
//   }
// }

export 'package:fapshi_pay/src/components/payment_button.dart';
export 'package:fapshi_pay/src/enum/env.dart';

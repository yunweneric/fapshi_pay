import 'dart:async';

import 'package:fapshi_pay/src/models/direct_pay_request_model/direct_pay_request_model.dart';
import 'package:fapshi_pay/src/models/direct_pay_response_model/direct_pay_response_model.dart';
import 'package:fapshi_pay/src/models/initialize_payment_request/initialize_payment_request.dart';
import 'package:fapshi_pay/src/models/initialize_payment_response/initialize_payment_response.dart';
import 'package:fapshi_pay/src/models/others/payment_status.dart';
import 'package:fapshi_pay/src/models/payment_status_response_model/payment_status_response_model.dart';
import 'package:fapshi_pay/src/services/payment_service.dart';

class PaymentRepository {
  final PaymentService _paymentService;
  int count = 0;

  PaymentRepository({required PaymentService paymentService})
      : _paymentService = paymentService;

  Future<InitializePaymentResponseModel> initializePayment(
      {required InitializePaymentRequest data}) async {
    Map<String, dynamic> response = await _paymentService.initiatePay(data);
    return InitializePaymentResponseModel.fromJson(response);
  }

  Future<DirectPayResponseModel> directPayment(
      {required DirectPayRequestModel data}) async {
    Map<String, dynamic> response = await _paymentService.directPay(data);
    return DirectPayResponseModel.fromJson(response);
  }

  Future<PaymentStatusResponseModel> checkPaymentStatus(
      {required String transactionId}) async {
    Map<String, dynamic> response =
        await _paymentService.paymentStatus(transactionId);
    return PaymentStatusResponseModel.fromJson(response);
  }

  Future<void> reIterateCheckPaymentController(String transactionId,
      StreamController<PaymentStatusResponseModel> controller) async {
    Timer.periodic(const Duration(seconds: 10), (time) async {
      try {
        final res = await checkPaymentStatus(transactionId: transactionId);
        if (res.status == PaymentStatus.expired ||
            res.status == PaymentStatus.failed ||
            res.status == PaymentStatus.successful) {
          count = 0;
          time.cancel();
          controller.add(res);
        }
        count++;
        if (count > 20) {
          count = 0;
          time.cancel();
          controller.add(res.copyWith(status: PaymentStatus.failed));
        }
      } catch (e) {
        count = 0;
        time.cancel();
        controller.add(PaymentStatusResponseModel.empty()
            .copyWith(status: PaymentStatus.expired));
      }
    });
  }
}

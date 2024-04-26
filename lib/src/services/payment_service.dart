import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fapshi_pay/src/error/app_error.dart';
import 'package:fapshi_pay/src/models/direct_pay_request_model/direct_pay_request_model.dart';
import 'package:fapshi_pay/src/models/initialize_payment_request/initialize_payment_request.dart';

class PaymentService {
  final Dio _http;

  PaymentService({required Dio http}) : _http = http;

  Future<Map<String, dynamic>> initiatePay(
      InitializePaymentRequest data) async {
    //* Check if 'amount' is greater than or equal to 100
    if (data.amount < 100) {
      throw AppException(message: 'amount cannot be less than 100 XAF');
    }
    try {
      //* Make the POST request
      Response response = await _http.post(
        '/initiate-pay',
        data: json.encode(data.toJson()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw AppException(
            message:
                response.data['message'] ?? response.statusMessage ?? "---");
      }
    } catch (e) {
      throw throwError(e);
    }
  }

  Future<Map<String, dynamic>> directPay(DirectPayRequestModel data) async {
    try {
      if (data.amount < 100) {
        throw AppException(message: 'amount cannot be less than 100 XAF');
      }

      if (!RegExp(r'^6[\d]{8}$').hasMatch(data.phone)) {
        throw AppException(message: 'Invalid phone number');
      }

      Response response = await _http.post(
        '/direct-pay',
        data: data,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw AppException(
            message:
                response.data['message'] ?? response.statusMessage ?? "---");
      }
    } catch (e) {
      throw throwError(e);
    }
  }

  Future<Map<String, dynamic>> paymentStatus(String transId) async {
    try {
      //* Check if transId is a string and has valid format
      // if (transId.isEmpty || transId.length < 8 || transId.length > 9) {
      if (transId.isEmpty || transId.length < 8) {
        throw AppException(message: 'Invalid transaction id');
      }
      //* Make GET request
      Response response = await _http.get(
        '/payment-status/$transId',
      );

      // * Extract response data
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw AppException(
            message:
                response.data['message'] ?? response.statusMessage ?? "---");
      }
    } catch (e) {
      throw throwError(e);
    }
  }

  AppException throwError(dynamic e) {
    if (e.runtimeType == AppException) return e as AppException;
    return AppException(message: "Internal server error", data: e);
  }
}

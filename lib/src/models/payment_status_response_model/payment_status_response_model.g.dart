// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_status_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentStatusResponseModel _$PaymentStatusResponseModelFromJson(
        Map<String, dynamic> json) =>
    PaymentStatusResponseModel(
      transId: json['transId'] as String?,
      status: json['status'] as String?,
      medium: json['medium'] as String?,
      serviceName: json['serviceName'] as String?,
      transType: json['transType'] as String?,
      amount: json['amount'] as int?,
      revenue: json['revenue'] as int?,
      email: json['email'],
      redirectUrl: json['redirectUrl'],
      externalId: json['externalId'],
      userId: json['userId'],
      webhook: json['webhook'],
      financialTransId: json['financialTransId'] as String?,
      dateInitiated: json['dateInitiated'] == null
          ? null
          : DateTime.parse(json['dateInitiated'] as String),
      dateConfirmed: json['dateConfirmed'] == null
          ? null
          : DateTime.parse(json['dateConfirmed'] as String),
    );

Map<String, dynamic> _$PaymentStatusResponseModelToJson(
        PaymentStatusResponseModel instance) =>
    <String, dynamic>{
      'transId': instance.transId,
      'status': instance.status,
      'medium': instance.medium,
      'serviceName': instance.serviceName,
      'transType': instance.transType,
      'amount': instance.amount,
      'revenue': instance.revenue,
      'email': instance.email,
      'redirectUrl': instance.redirectUrl,
      'externalId': instance.externalId,
      'userId': instance.userId,
      'webhook': instance.webhook,
      'financialTransId': instance.financialTransId,
      'dateInitiated': instance.dateInitiated?.toIso8601String(),
      'dateConfirmed': instance.dateConfirmed?.toIso8601String(),
    };

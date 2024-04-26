// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_hook_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebHookResponseModel _$WebHookResponseModelFromJson(
        Map<String, dynamic> json) =>
    WebHookResponseModel(
      transId: json['transId'] as String?,
      status: json['status'] as String?,
      medium: json['medium'] as String?,
      serviceName: json['serviceName'] as String?,
      amount: json['amount'] as int?,
      revenue: json['revenue'] as int?,
      payerName: json['payerName'] as String?,
      email: json['email'] as String?,
      redirectUrl: json['redirectUrl'] as String?,
      externalId: json['externalId'] as String?,
      userId: json['userId'] as String?,
      webhook: json['webhook'] as String?,
      financialTransId: json['financialTransId'] as String?,
      dateInitiated: json['dateInitiated'] == null
          ? null
          : DateTime.parse(json['dateInitiated'] as String),
      dateConfirmed: json['dateConfirmed'] == null
          ? null
          : DateTime.parse(json['dateConfirmed'] as String),
    );

Map<String, dynamic> _$WebHookResponseModelToJson(
        WebHookResponseModel instance) =>
    <String, dynamic>{
      'transId': instance.transId,
      'status': instance.status,
      'medium': instance.medium,
      'serviceName': instance.serviceName,
      'amount': instance.amount,
      'revenue': instance.revenue,
      'payerName': instance.payerName,
      'email': instance.email,
      'redirectUrl': instance.redirectUrl,
      'externalId': instance.externalId,
      'userId': instance.userId,
      'webhook': instance.webhook,
      'financialTransId': instance.financialTransId,
      'dateInitiated': instance.dateInitiated?.toIso8601String(),
      'dateConfirmed': instance.dateConfirmed?.toIso8601String(),
    };

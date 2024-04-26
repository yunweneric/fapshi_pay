// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initialize_payment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitializePaymentResponseModel _$InitializePaymentResponseModelFromJson(
        Map<String, dynamic> json) =>
    InitializePaymentResponseModel(
      message: json['message'] as String?,
      link: json['link'] as String?,
      transId: json['transId'] as String?,
      dateInitiated: json['dateInitiated'] == null
          ? null
          : DateTime.parse(json['dateInitiated'] as String),
    );

Map<String, dynamic> _$InitializePaymentResponseModelToJson(
        InitializePaymentResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'link': instance.link,
      'transId': instance.transId,
      'dateInitiated': instance.dateInitiated?.toIso8601String(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initialize_payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitializePaymentRequest _$InitializePaymentRequestFromJson(Map<String, dynamic> json) => InitializePaymentRequest(
      amount: json['amount'] as int,
      email: json['email'] as String?,
      userId: json['userId'] as String?,
      externalId: json['externalId'] as String?,
      redirectUrl: json['redirectUrl'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$InitializePaymentRequestToJson(InitializePaymentRequest instance) => <String, dynamic>{
      'amount': instance.amount,
      'email': instance.email,
      'userId': instance.userId,
      'externalId': instance.externalId,
      'redirectUrl': instance.redirectUrl,
      'message': instance.message,
    };

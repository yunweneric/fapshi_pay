// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'direct_pay_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DirectPayRequestModel _$DirectPayRequestModelFromJson(
        Map<String, dynamic> json) =>
    DirectPayRequestModel(
      amount: json['amount'] as int,
      phone: json['phone'] as String,
      medium: json['medium'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      userId: json['userId'] as String?,
      externalId: json['externalId'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$DirectPayRequestModelToJson(
        DirectPayRequestModel instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'phone': instance.phone,
      'medium': instance.medium,
      'name': instance.name,
      'email': instance.email,
      'userId': instance.userId,
      'externalId': instance.externalId,
      'message': instance.message,
    };

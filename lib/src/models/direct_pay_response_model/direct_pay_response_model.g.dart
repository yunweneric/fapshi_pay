// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'direct_pay_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DirectPayResponseModel _$DirectPayResponseModelFromJson(
        Map<String, dynamic> json) =>
    DirectPayResponseModel(
      message: json['message'] as String?,
      transId: json['transId'] as String?,
      dateInitiated: json['dateInitiated'] == null
          ? null
          : DateTime.parse(json['dateInitiated'] as String),
    );

Map<String, dynamic> _$DirectPayResponseModelToJson(
        DirectPayResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'transId': instance.transId,
      'dateInitiated': instance.dateInitiated?.toIso8601String(),
    };

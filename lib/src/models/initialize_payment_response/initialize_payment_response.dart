import 'package:json_annotation/json_annotation.dart';

part 'initialize_payment_response.g.dart';

@JsonSerializable()
class InitializePaymentResponseModel {
  String? message;
  String? link;
  String? transId;
  DateTime? dateInitiated;

  InitializePaymentResponseModel({
    this.message,
    this.link,
    this.transId,
    this.dateInitiated,
  });

  factory InitializePaymentResponseModel.fromJson(Map<String, dynamic> json) {
    return _$InitializePaymentResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InitializePaymentResponseModelToJson(this);
}

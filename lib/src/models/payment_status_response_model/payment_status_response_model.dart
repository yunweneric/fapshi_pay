import 'package:json_annotation/json_annotation.dart';

part 'payment_status_response_model.g.dart';

@JsonSerializable()
class PaymentStatusResponseModel {
  String? transId;
  String? status;
  String? medium;
  String? serviceName;
  String? transType;
  int? amount;
  int? revenue;
  dynamic email;
  dynamic redirectUrl;
  dynamic externalId;
  dynamic userId;
  dynamic webhook;
  String? financialTransId;
  DateTime? dateInitiated;
  DateTime? dateConfirmed;

  PaymentStatusResponseModel({
    this.transId,
    this.status,
    this.medium,
    this.serviceName,
    this.transType,
    this.amount,
    this.revenue,
    this.email,
    this.redirectUrl,
    this.externalId,
    this.userId,
    this.webhook,
    this.financialTransId,
    this.dateInitiated,
    this.dateConfirmed,
  });

  factory PaymentStatusResponseModel.fromJson(Map<String, dynamic> json) {
    return _$PaymentStatusResponseModelFromJson(json);
  }
  factory PaymentStatusResponseModel.empty() {
    return PaymentStatusResponseModel();
  }

  Map<String, dynamic> toJson() => _$PaymentStatusResponseModelToJson(this);

  PaymentStatusResponseModel copyWith({
    String? transId,
    String? status,
    String? medium,
    String? serviceName,
    String? transType,
    int? amount,
    int? revenue,
    dynamic email,
    dynamic redirectUrl,
    dynamic externalId,
    dynamic userId,
    dynamic webhook,
    String? financialTransId,
    DateTime? dateInitiated,
    DateTime? dateConfirmed,
  }) {
    return PaymentStatusResponseModel(
      transId: transId ?? this.transId,
      status: status ?? this.status,
      medium: medium ?? this.medium,
      serviceName: serviceName ?? this.serviceName,
      transType: transType ?? this.transType,
      amount: amount ?? this.amount,
      revenue: revenue ?? this.revenue,
      email: email ?? this.email,
      redirectUrl: redirectUrl ?? this.redirectUrl,
      externalId: externalId ?? this.externalId,
      userId: userId ?? this.userId,
      webhook: webhook ?? this.webhook,
      financialTransId: financialTransId ?? this.financialTransId,
      dateInitiated: dateInitiated ?? this.dateInitiated,
      dateConfirmed: dateConfirmed ?? this.dateConfirmed,
    );
  }
}

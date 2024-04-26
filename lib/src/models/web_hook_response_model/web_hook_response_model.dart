import 'package:json_annotation/json_annotation.dart';

part 'web_hook_response_model.g.dart';

@JsonSerializable()
class WebHookResponseModel {
  String? transId;
  String? status;
  String? medium;
  String? serviceName;
  int? amount;
  int? revenue;
  String? payerName;
  String? email;
  String? redirectUrl;
  String? externalId;
  String? userId;
  String? webhook;
  String? financialTransId;
  DateTime? dateInitiated;
  DateTime? dateConfirmed;

  WebHookResponseModel({
    this.transId,
    this.status,
    this.medium,
    this.serviceName,
    this.amount,
    this.revenue,
    this.payerName,
    this.email,
    this.redirectUrl,
    this.externalId,
    this.userId,
    this.webhook,
    this.financialTransId,
    this.dateInitiated,
    this.dateConfirmed,
  });

  factory WebHookResponseModel.fromJson(Map<String, dynamic> json) {
    return _$WebHookResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WebHookResponseModelToJson(this);

  WebHookResponseModel copyWith({
    String? transId,
    String? status,
    String? medium,
    String? serviceName,
    int? amount,
    int? revenue,
    String? payerName,
    String? email,
    String? redirectUrl,
    String? externalId,
    String? userId,
    String? webhook,
    String? financialTransId,
    DateTime? dateInitiated,
    DateTime? dateConfirmed,
  }) {
    return WebHookResponseModel(
      transId: transId ?? this.transId,
      status: status ?? this.status,
      medium: medium ?? this.medium,
      serviceName: serviceName ?? this.serviceName,
      amount: amount ?? this.amount,
      revenue: revenue ?? this.revenue,
      payerName: payerName ?? this.payerName,
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

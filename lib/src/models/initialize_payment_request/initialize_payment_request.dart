import 'package:json_annotation/json_annotation.dart';

part 'initialize_payment_request.g.dart';

@JsonSerializable()
class InitializePaymentRequest {
  int amount;
  String? email;
  String? userId;
  String? externalId;
  String? redirectUrl;
  String? message;

  InitializePaymentRequest({
    required this.amount,
    this.email,
    this.userId,
    this.externalId,
    this.redirectUrl,
    this.message,
  });

  factory InitializePaymentRequest.fromJson(Map<String, dynamic> json) {
    return _$InitializePaymentRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InitializePaymentRequestToJson(this);

  InitializePaymentRequest copyWith({
    required int amount,
    String? email,
    String? userId,
    String? externalId,
    String? redirectUrl,
    String? message,
  }) {
    return InitializePaymentRequest(
      amount: amount,
      email: email ?? this.email,
      userId: userId ?? this.userId,
      externalId: externalId ?? this.externalId,
      redirectUrl: redirectUrl ?? this.redirectUrl,
      message: message ?? this.message,
    );
  }
}

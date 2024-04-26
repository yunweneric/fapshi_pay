import 'package:json_annotation/json_annotation.dart';

part 'direct_pay_request_model.g.dart';

@JsonSerializable()
class DirectPayRequestModel {
  int amount;
  String phone;
  String? medium;
  String? name;
  String? email;
  String? userId;
  String? externalId;
  String? message;

  DirectPayRequestModel({
    required this.amount,
    required this.phone,
    this.medium,
    this.name,
    this.email,
    this.userId,
    this.externalId,
    this.message,
  });

  factory DirectPayRequestModel.fromJson(Map<String, dynamic> json) {
    return _$DirectPayRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DirectPayRequestModelToJson(this);

  DirectPayRequestModel copyWith({
    required int amount,
    required String phone,
    String? medium,
    String? name,
    String? email,
    String? userId,
    String? externalId,
    String? message,
  }) {
    return DirectPayRequestModel(
      amount: amount,
      phone: phone,
      medium: medium ?? this.medium,
      name: name ?? this.name,
      email: email ?? this.email,
      userId: userId ?? this.userId,
      externalId: externalId ?? this.externalId,
      message: message ?? this.message,
    );
  }
}

import 'package:json_annotation/json_annotation.dart';

part 'direct_pay_response_model.g.dart';

@JsonSerializable()
class DirectPayResponseModel {
  String? message;
  String? transId;
  DateTime? dateInitiated;

  DirectPayResponseModel({this.message, this.transId, this.dateInitiated});

  factory DirectPayResponseModel.fromJson(Map<String, dynamic> json) {
    return _$DirectPayResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DirectPayResponseModelToJson(this);
}

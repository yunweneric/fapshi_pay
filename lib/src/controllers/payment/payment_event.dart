part of 'payment_bloc.dart';

class PaymentEvent {}

class InitiatePaymentEvent extends PaymentEvent {
  final InitializePaymentRequest initModel;
  InitiatePaymentEvent({required this.initModel});
}

class DirectPaymentEvent extends PaymentEvent {
  final DirectPayRequestModel model;
  final bool? shouldCheckPaymentStatus;
  DirectPaymentEvent({required this.model, this.shouldCheckPaymentStatus});
}

class CheckPaymentStatusEvent extends PaymentEvent {
  final String transactionId;
  CheckPaymentStatusEvent({required this.transactionId});
}

class ConcludePaymentStatusVerification extends PaymentEvent {
  final PaymentStatusResponseModel response;

  ConcludePaymentStatusVerification(this.response);
}

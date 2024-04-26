part of 'payment_bloc.dart';

class PaymentState {}

class PaymentInitial extends PaymentState {}

class InitializePaymentInitial extends PaymentState {}

class InitializePaymentError extends PaymentState {
  final String message;
  InitializePaymentError({required this.message});
}

class InitializePaymentSuccess extends PaymentState {
  final InitializePaymentResponseModel response;

  InitializePaymentSuccess(this.response);
}

class DirectPaymentInitial extends PaymentState {}

class DirectPaymentError extends PaymentState {
  final String message;
  DirectPaymentError({required this.message});
}

class DirectPaymentSuccess extends PaymentState {
  final DirectPayResponseModel response;

  DirectPaymentSuccess(this.response);
}

class CheckPaymentStatusInitial extends PaymentState {}

class CheckPaymentStatusError extends PaymentState {
  final String message;
  final PaymentStatusResponseModel response;

  CheckPaymentStatusError({required this.response, required this.message});
}

class CheckPaymentStatusUpdate extends PaymentState {
  final String message;
  final PaymentStatusResponseModel response;

  CheckPaymentStatusUpdate({required this.response, required this.message});
}

class CheckPaymentStatusSuccess extends PaymentState {
  final PaymentStatusResponseModel response;

  CheckPaymentStatusSuccess(this.response);
}

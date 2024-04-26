import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:fapshi_pay/src/error/app_error.dart';
import 'package:fapshi_pay/src/models/direct_pay_request_model/direct_pay_request_model.dart';
import 'package:fapshi_pay/src/models/direct_pay_response_model/direct_pay_response_model.dart';
import 'package:fapshi_pay/src/models/initialize_payment_request/initialize_payment_request.dart';
import 'package:fapshi_pay/src/models/initialize_payment_response/initialize_payment_response.dart';
import 'package:fapshi_pay/src/models/others/payment_status.dart';
import 'package:fapshi_pay/src/models/payment_status_response_model/payment_status_response_model.dart';
import 'package:fapshi_pay/src/repositories/payment_repository.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final PaymentRepository _paymentRepository;
  final StreamController<PaymentStatusResponseModel> _controller;

  void listenToController() {
    _controller.stream.listen((paymentData) {
      add(ConcludePaymentStatusVerification(paymentData));
    });
  }

  @override
  Future<void> close() {
    _controller.close();
    return super.close();
  }

  PaymentBloc(this._paymentRepository, this._controller)
      : super(PaymentInitial()) {
    on<ConcludePaymentStatusVerification>((event, emit) async {
      if (event.response.status == PaymentStatus.successful) {
        emit(CheckPaymentStatusSuccess(event.response));
      } else if (event.response.status == PaymentStatus.expired) {
        emit(CheckPaymentStatusError(
            message: "Your payment has expired!", response: event.response));
      } else if (event.response.status == PaymentStatus.failed) {
        emit(CheckPaymentStatusError(
            message: "Your payment has failed!", response: event.response));
      } else if (event.response.status == PaymentStatus.pending) {
        emit(CheckPaymentStatusUpdate(
            message: "Your payment is pending!", response: event.response));
      }
    });
    on<InitiatePaymentEvent>((event, emit) async {
      try {
        emit(InitializePaymentInitial());
        final response =
            await _paymentRepository.initializePayment(data: event.initModel);
        emit(InitializePaymentSuccess(response));
      } catch (e) {
        AppException error = e as AppException;
        emit(InitializePaymentError(message: error.message));
      }
    });
    on<DirectPaymentEvent>((event, emit) async {
      try {
        emit(DirectPaymentInitial());
        final response =
            await _paymentRepository.directPayment(data: event.model);
        if (event.shouldCheckPaymentStatus == true)
          add(CheckPaymentStatusEvent(transactionId: response.transId!));
        emit(DirectPaymentSuccess(response));
      } catch (e) {
        AppException error = e as AppException;
        emit(DirectPaymentError(message: error.message));
      }
    });
    on<CheckPaymentStatusEvent>((event, emit) async {
      emit(CheckPaymentStatusInitial());
      _paymentRepository.reIterateCheckPaymentController(
          event.transactionId, _controller);
      listenToController();
    });
  }
}

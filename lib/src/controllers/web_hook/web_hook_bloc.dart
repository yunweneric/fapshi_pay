// import 'dart:io';

// import 'package:bloc/bloc.dart';
// import 'package:example/data/core/config.dart';
// import 'package:example/data/error/app_error.dart';
// import 'package:example/data/models/web_hook_response_model/web_hook_response_model.dart';
// import 'package:example/data/repositories/payment_repository.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';
// import 'package:web_socket_channel/status.dart' as status;

// part 'web_hook_event.dart';
// part 'web_hook_state.dart';

// class WebHookBloc extends Bloc<WebHookEvent, WebHookState> {
//   listenToWebHook(channel) {
//     channel.stream.listen((message) {
//       // TOdo: You might need to decode this message object
//       WebHookResponseModel response = WebHookResponseModel.fromJson(message);
//       add(RespondToWebHookEvent(response));
//     });
//   }

//   WebHookBloc() : super(WebHookInitial()) {
//     on<RespondToWebHookEvent>((event, emit) async {
//       emit(ListenPaymentStatusWebHookSuccess(event.response));
//     });
//     on<ListenToWebHookEvent>((event, emit) async {
//       emit(ListenPaymentStatusWebHookInitial());
//       try {
//         final wsUrl = Uri.parse(AppConfig.env == AppEnv.DEV ? AppConfig.devWebHookUrl! : AppConfig.webHookUrl!);
//         final channel = WebSocketChannel.connect(wsUrl);
//         await channel.ready;
//         listenToWebHook(channel);
//       } catch (e) {
//         if (e is WebSocketException) {
//           emit(ListenPaymentStatusWebHookError(message: e.message));
//           return;
//         }
//         AppException error = e as AppException;
//         emit(ListenPaymentStatusWebHookError(message: error.message));
//       }
//     });
//   }
// }

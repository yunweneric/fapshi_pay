// import 'dart:async';

// import 'package:dio/dio.dart';
// import 'package:example/data/controllers/payment/payment_bloc.dart';
// import 'package:example/data/core/config.dart';
// import 'package:example/data/models/payment_status_response_model/payment_status_response_model.dart';
// import 'package:example/data/repositories/payment_repository.dart';
// import 'package:example/data/services/payment_service.dart';
// import 'package:get_it/get_it.dart';

// final getIt = GetIt.instance;

// class ServiceLocator {
//   static register() {
//     try {
//       Map<String, String> headers() {
//         return {
//           'Content-Type': 'application/json',
//           "apiuser": AppConfig.env == AppEnv.DEV ? AppConfig.devApiUser : AppConfig.apiUser,
//           "apikey": AppConfig.env == AppEnv.DEV ? AppConfig.devApiKey : AppConfig.apiKey,
//         };
//       }

//       Dio dio() {
//         final options = BaseOptions(
//           baseUrl: AppConfig.env == AppEnv.DEV ? AppConfig.devBaseUrl : AppConfig.baseUrl,
//           connectTimeout: const Duration(seconds: 5),
//           receiveTimeout: const Duration(seconds: 3),
//           headers: headers(),
//           validateStatus: (status) {
//             if (status == null) return false;
//             return status <= 500;
//           },
//         );
//         return Dio(options);
//       }

//       dio().interceptors.addAll(
//         [LogInterceptor()],
//       );

//       StreamController<PaymentStatusResponseModel> paymentController = StreamController.broadcast();

//       PaymentService paymentService = PaymentService(http: dio());
//       getIt.registerSingleton<PaymentService>(paymentService);

//       PaymentRepository paymentRepository = PaymentRepository(paymentService: paymentService);
//       getIt.registerSingleton<PaymentRepository>(paymentRepository);

//       PaymentBloc paymentBloc = PaymentBloc(paymentRepository, paymentController);
//       getIt.registerSingleton<PaymentBloc>(paymentBloc);
//       // getIt.registerSingleton<Stream<PaymentStatusResponseModel>>(paymentStream);
//       getIt.registerSingleton<StreamController<PaymentStatusResponseModel>>(paymentController);
//       print("Registerd!");
//     } catch (e) {
//       print("-------------------");
//       print(e);
//       print("-------------------");
//     }
//   }
// }

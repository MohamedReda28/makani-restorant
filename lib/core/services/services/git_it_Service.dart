//
// import 'package:get_it/get_it.dart';
// import 'package:makani/core/repos/logout_repo/Logout_repo_implem.dart';
// import 'package:makani/core/repos/logout_repo/logout_repo.dart';
// import '../../../features/Home/peresntation/cubits/myorders/domins/repo/orderRebo.dart';
// import '../../../features/auth/data/repos/repoImplemantation.dart';
// import '../../../features/auth/domain/repos/Auth Repo.dart';
// import '../../../features/Home/peresntation/cubits/myorders/data/repoImple/OrdersreboImple.dart';
// import '../../repos/order_repo/order_reop.dart';
// import '../../repos/order_repo/oreder_repo_impl.dart';
// import '../../repos/product_repo/product_repo.dart';
// import '../../repos/product_repo/product_repo_impl.dart';
// import 'DataBase_Serveces.dart';
// import 'fireStore_Servece.dart';
// import 'firebase_Auth_Servece.dart';
//
// final getIt = GetIt.instance;
//
// void setupGitit() {
//   getIt.registerSingleton<FirebaseAuthServece>(FirebaseAuthServece());
//
//   getIt.registerSingleton<DataBaseServeces>(FirestoerServeces());
//
//   getIt.registerSingleton<AuthRepo>(
//     Repoimplemantation(
//       firebaseAuthServece: getIt<FirebaseAuthServece>(),
//       dataBaseServeces: getIt<DataBaseServeces>(),
//     ),
//   );
//   getIt.registerSingleton<LogoutRepo>(
//     LogoutRepoImple(
//       firebaseAuthServece: getIt<FirebaseAuthServece>(),
//     ),
//   );
//   getIt.registerSingleton<ProductRepo>(
//     productRepoImpl(
//       dataBaseServeces: getIt<DataBaseServeces>(),
//     ),
//   );
//   getIt.registerSingleton<OrderRepo>(
//     OrederRepoImpl(
//       dataBaseServeces: getIt<DataBaseServeces>(),
//     ),
//   );
//   getIt.registerSingleton<Ordersrebo>(
//     OrdersrepoImple(
//       dataBaseServeces: getIt<DataBaseServeces>(),
//     ),
//   );
// }
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

// Core


// Features - Payment


// Existing imports from your app
import 'package:makani/core/repos/logout_repo/Logout_repo_implem.dart';
import 'package:makani/core/repos/logout_repo/logout_repo.dart';
import '../../../features/Home/peresntation/cubits/myorders/domins/repo/orderRebo.dart';
import '../../../features/Payment/data/datasources/payment_remote_data_source.dart';
import '../../../features/Payment/data/repositories/payment_repository_impl.dart';
import '../../../features/Payment/domine/repositories/payment_repository.dart';
import '../../../features/Payment/domine/usecases/process_payment.dart';
import '../../../features/Payment/presentation/cubit/payment_cubit.dart';
import '../../../features/auth/data/repos/repoImplemantation.dart';
import '../../../features/auth/domain/repos/Auth Repo.dart';
import '../../../features/Home/peresntation/cubits/myorders/data/repoImple/OrdersreboImple.dart';
import '../../network/network_info.dart';
import '../../network/network_info_impl.dart';
import '../../repos/order_repo/order_reop.dart';
import '../../repos/order_repo/oreder_repo_impl.dart';
import '../../repos/product_repo/product_repo.dart';
import '../../repos/product_repo/product_repo_impl.dart';
import 'DataBase_Serveces.dart';
import 'fireStore_Servece.dart';
import 'firebase_Auth_Servece.dart';

final getIt = GetIt.instance;

void setupGitit() {
  // تسجيل HTTP Client
  getIt.registerSingleton<http.Client>(http.Client());

  // تسجيل Connectivity
  getIt.registerSingleton<Connectivity>(Connectivity());

  // تسجيل Network Info
  getIt.registerSingleton<NetworkInfo>(NetworkInfoImpl(getIt()));

  // تسجيل Remote Data Source
  getIt.registerSingleton<PaymentRemoteDataSource>(
    PaymentRemoteDataSourceImpl(
      client: getIt(),
      networkInfo: getIt(),
    ),
  );

  // تسجيل Repository
  getIt.registerSingleton<PaymentRepository>(
    PaymentRepositoryImpl(
      remoteDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );

  // تسجيل UseCase
  getIt.registerSingleton<ProcessPayment>(
    ProcessPayment(getIt()),
  );

  // تسجيل Cubit
  getIt.registerFactory<PaymentCubit>(
        () => PaymentCubit(processPayment: getIt()),
  );

  // --- باقي الـ Repositories الأصلية ---
  getIt.registerSingleton<FirebaseAuthServece>(FirebaseAuthServece());
  getIt.registerSingleton<DataBaseServeces>(FirestoerServeces());

  getIt.registerSingleton<AuthRepo>(
    Repoimplemantation(
      firebaseAuthServece: getIt<FirebaseAuthServece>(),
      dataBaseServeces: getIt<DataBaseServeces>(),
    ),
  );

  getIt.registerSingleton<LogoutRepo>(
    LogoutRepoImple(
      firebaseAuthServece: getIt<FirebaseAuthServece>(),
    ),
  );

  getIt.registerSingleton<ProductRepo>(
    productRepoImpl(
      dataBaseServeces: getIt<DataBaseServeces>(),
    ),
  );

  getIt.registerSingleton<OrderRepo>(
    OrederRepoImpl(
      dataBaseServeces: getIt<DataBaseServeces>(),
    ),
  );

  getIt.registerSingleton<Ordersrebo>(
    OrdersrepoImple(
      dataBaseServeces: getIt<DataBaseServeces>(),
    ),
  );
}
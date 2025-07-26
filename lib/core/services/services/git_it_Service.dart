
import 'package:get_it/get_it.dart';
import 'package:makani/core/repos/logout_repo/Logout_repo_implem.dart';
import 'package:makani/core/repos/logout_repo/logout_repo.dart';
import 'package:makani/features/Home/data/repo/repo_Imple.dart';
import 'package:makani/features/Home/domines/repo/PostRepo.dart';
import '../../../features/myorders/domins/repo/orderRepo.dart';
import '../../../features/auth/data/repos/repoImplemantation.dart';
import '../../../features/auth/domain/repos/Auth Repo.dart';
import '../../../features/myorders/data/repoImple/OrdersreboImple.dart';
import '../../repos/order_repo/order_reop.dart';
import '../../repos/order_repo/oreder_repo_impl.dart';
import '../../repos/product_repo/product_repo.dart';
import '../../repos/product_repo/product_repo_impl.dart';
import 'AuthServece.dart';
import 'DataBase_Serveces.dart';
import 'fireStore_Servece.dart';
import 'firebase_Auth_Servece.dart';

final getIt = GetIt.instance;

void setupGitit() {


  getIt.registerSingleton<AuthService>(FirebaseAuthServece());
  getIt.registerSingleton<DataBaseServeces>(FirestoerServeces());

  getIt.registerSingleton<AuthRepo>(
    Repoimplemantation(
      authService: getIt<AuthService>(),
      dataBaseServeces: getIt<DataBaseServeces>(),
    ),
  );

  getIt.registerSingleton<LogoutRepo>(
    LogoutRepoImple(
      authService: getIt<AuthService>(),
    ),
  );

  getIt.registerSingleton<ProductRepo>(
    productRepoImpl(
      dataBaseServeces: getIt<DataBaseServeces>(),
    ),
  );

  getIt.registerSingleton<PostRepo>(
    PostRepoImple(
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
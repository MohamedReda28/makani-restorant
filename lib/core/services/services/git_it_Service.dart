
import 'package:get_it/get_it.dart';

import 'package:makani/core/repos/logout_repo/Logout_repo_implem.dart';
import 'package:makani/core/repos/logout_repo/logout_repo.dart';
import '../../../features/Home/peresntation/cubits/myorders/domins/repo/orderRebo.dart';
import '../../../features/auth/data/repos/repoImplemantation.dart';
import '../../../features/auth/domain/repos/Auth Repo.dart';
import '../../../features/Home/peresntation/cubits/myorders/data/repoImple/OrdersreboImple.dart';
import '../../repos/order_repo/order_reop.dart';
import '../../repos/order_repo/oreder_repo_impl.dart';
import '../../repos/product_repo/product_repo.dart';
import '../../repos/product_repo/product_repo_impl.dart';
import 'DataBase_Serveces.dart';
import 'fireStore_Servece.dart';
import 'firebase_Auth_Servece.dart';

final getIt = GetIt.instance;

void setupGitit() {


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
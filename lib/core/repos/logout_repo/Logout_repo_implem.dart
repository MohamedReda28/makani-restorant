
import 'package:dartz/dartz.dart';
import 'package:makani/core/erroes/Failur.dart';
import 'package:makani/core/helpes_function/deleteUserFromDiv.dart';
import 'package:makani/core/repos/logout_repo/logout_repo.dart';
import 'package:makani/core/services/services/firebase_Auth_Servece.dart';

import '../../services/services/AuthServece.dart';

class LogoutRepoImple extends LogoutRepo{
   final AuthService authService;

  LogoutRepoImple({required this.authService});
  @override
  Future<Either<Failur, void>> lougoutUser() async{
    try{
      await authService.deleteUser();
      await deleteUser();
      return const Right(null);

    }catch (e){
      return Left(ServerFailure(e.toString()));
    }






  }

}
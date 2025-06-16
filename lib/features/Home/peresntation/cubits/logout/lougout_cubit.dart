import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:makani/core/repos/logout_repo/logout_repo.dart';

part 'lougout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this.logoutRepo) : super(LougoutInitial());
  final LogoutRepo logoutRepo;

  Future<void> logout() async {
    emit(LougoutLoading());
    var result = await logoutRepo.lougoutUser();
    result.fold(
      (l) => emit(LougoutFaluir(merror: "حدث خطأ")),
      (r) => emit(LougoutSuccess(massege: "تم تسجيل الخروج")),
    );
  }
}

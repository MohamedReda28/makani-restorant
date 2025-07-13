import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makani/features/auth/peresentation/views/widghts/SiginViewBoby.dart';
import '../../../../core/Widghts/BuildAppBarCustom.dart';
import '../../../../core/Widghts/CustomProgressHUD.dart';
import '../../../../core/helpes_function/BuildSnakBar.dart';
import '../../../../core/services/services/git_it_Service.dart';
import '../../../Home/peresntation/views/mainView.dart';
import '../../domain/repos/Auth Repo.dart';
import '../cubits/Signin_Cubit/cubit/signin_cubit.dart';

class SiginView extends StatelessWidget {
  const SiginView({super.key});
  static const routeName = 'SiginView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: "تسجيل الدخول"),
        body: Builder(builder: (context) {
          return BlocConsumer<SigninCubit, SigninState>(
            listener: (context, state) {
              if (state is SigninSuccess) {
                Navigator.pushNamedAndRemoveUntil(context, MainView.routeName, (Route<dynamic> route) => false);
                BuildSnakBar(context,"تم تسجيل الدخول بنجاح",type: SnackbarType.success);
              }
              if (state is SigninFailure) {
                BuildSnakBar(context, state.message,type: SnackbarType.error);
              }
            },
            builder: (context, state) => CustoProgressHUD(
              isLoading: state is SigninLoading ? true : false,
              child:  const SiginVeiwBody(),
            ),
          );
        }),
      ),
    );
  }
}

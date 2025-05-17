import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makani/features/auth/peresentation/views/widghts/ForgetpassViewBodyBuilder.dart';
import '../../../../core/Widghts/BuildAppBarCustom.dart';
import '../../../../core/services/services/git_it_Service.dart';
import '../../domain/repos/Auth Repo.dart';
import '../cubits/Forgetpass_Cubit/forgetpass_cubit.dart';

class ForgetpassView extends StatelessWidget {
  const ForgetpassView({super.key});
  static const routeName = 'ForgetpassView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> ForgetpassCubit(getIt<AuthRepo>()),
      child: Scaffold (
        appBar: buildAppBar(context,title: 'نسيان كلمة المرور'),
        body: const ForgetpassViewBodyBuilder(),
      ),
    );
  }
}




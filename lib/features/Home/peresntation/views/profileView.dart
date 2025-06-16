import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makani/core/repos/logout_repo/logout_repo.dart';
import 'package:makani/features/Home/peresntation/cubits/logout/lougout_cubit.dart';
import 'package:makani/features/Home/peresntation/views/widgets/ProfileviewBody.dart';

import '../../../../core/services/services/git_it_Service.dart';

class Profileview extends StatelessWidget {
  const Profileview({super.key});
  static const routeName = 'ProfileView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
            create: (context) => LogoutCubit(
                  getIt<LogoutRepo>(),
                ),
            child: const ProfileviewBody()),
      ),
    );
  }
}

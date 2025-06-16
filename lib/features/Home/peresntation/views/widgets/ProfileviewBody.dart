import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makani/core/services/services/CustomBlocObserver.dart';
import 'package:makani/core/uitels/App_Color.dart';
import 'package:makani/core/uitels/App_TextStyle.dart';
import 'package:makani/features/Home/peresntation/cubits/logout/lougout_cubit.dart';
import '../../../../../constsns.dart';
import '../../../../../core/Widghts/CustomAppbar2.dart';
import '../../../../auth/peresentation/views/SiginView.dart';
import 'CustomProfileAppBar.dart';
import 'ListIteminprofile.dart';
import 'alirtedialog.dart';

class ProfileviewBody extends StatelessWidget {
  const ProfileviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: kTopPadding),
                const CustomAppbar2(
                  title: 'حسابي',
                  visableicon: false,
                  visableArw: false,
                ),
                SizedBox(height: 24.h),
                const CustomProfileAppbar(),
                SizedBox(height: 16.h),
                Text(
                  'عام',
                  style: AppStyle.bold13,
                ),
                SizedBox(height: 12.h),
              ],
            ),
          ),
          const ListIteminprofile(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200.h,
            ),
          ),
          const SliverToBoxAdapter(
            child: LogoutWidget(),
          ),
        ],
      ),
    );
  }
}

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showLogoutDialog(
            context: context,
            onConfirm: () {
              context.read<LogoutCubit>().logout();
            });
      },
      child: Container(
        decoration: const BoxDecoration(
          color: AppColor.lightPrimaryColor /* Green1-50 */,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text('تسجيل الخروج',
              textAlign: TextAlign.center,
              style: AppStyle.bold13.copyWith(color: const Color(0xFFF2F3F3))),
        ),
      ),
    );
  }
}

class LogoutWidgetBlocLisener extends StatelessWidget {
  const LogoutWidgetBlocLisener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutCubit, LogoutState>(listener: (context, state) {
      if (state is LougoutSuccess) {
        Navigator.pushNamed(context, SiginView.routeName);
      }
    });
  }
}

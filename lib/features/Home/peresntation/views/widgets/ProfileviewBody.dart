import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makani/core/uitels/App_TextStyle.dart';
import '../../../../../constsns.dart';
import '../../../../../core/Widghts/CustomAppbar2.dart';
import 'CustomProfileAppBar.dart';
import 'ListIteminprofile.dart';
import 'LogoutWidget.dart';

class ProfileviewBody extends StatelessWidget {
  const ProfileviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorsintalPadding.w),
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



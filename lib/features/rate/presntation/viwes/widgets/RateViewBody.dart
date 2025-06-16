import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makani/core/uitels/App_Color.dart';
import 'package:makani/core/uitels/App_TextStyle.dart';
import 'package:makani/features/rate/presntation/viwes/widgets/textfileforcomment.dart';
import 'package:rating_summary/rating_summary.dart';
import '../../../../../constsns.dart';
import '../../../../../core/Widghts/CustomAppbar2.dart';
import 'ListViewReviewItemWidget.dart';

class RateViewBody extends StatelessWidget {
  const RateViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kHorsintalPadding.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: kTopPadding),
                const CustomAppbar2(
                  visableicon: false,
                  title: 'المراجعه',
                ),
                const SizedBox(
                  height: 24,
                ),
                 const TextFileForComment(
                  suffix: Icon(Icons.send,color: AppColor.kPrimaryColor,),
                  hinttext: "اكتب التعليق..",
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Text(
                      'المراجعه',
                      style: AppStyle.bold13,
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  'الملخص',
                  style: AppStyle.semibold13,
                ),
                const RatingSummary(
                  counter: 13,
                  average: 3.846,
                  showAverage: true,
                  counterFiveStars: 5,
                  counterFourStars: 4,
                  counterThreeStars: 2,
                  counterTwoStars: 1,
                  counterOneStars: 1,
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
        const ListViewReviewItemWidget()
      ],
    );
  }
}





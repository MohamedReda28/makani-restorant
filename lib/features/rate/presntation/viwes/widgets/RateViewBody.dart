import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:makani/core/entitys/ProductEntity.dart';
import 'package:makani/core/helpes_function/getUser.dart';
import 'package:makani/core/models/productModel.dart';
import 'package:makani/core/uitels/App_Color.dart';
import 'package:makani/core/uitels/App_TextStyle.dart';
import 'package:makani/core/uitels/backend%20Impoint.dart';
import 'package:makani/features/rate/presntation/manager/cubit/addReview/review_cubit.dart';
import 'package:makani/features/rate/presntation/manager/cubit/getReviews/get_reviews_cubit.dart';
import 'package:makani/features/rate/presntation/viwes/widgets/textfileforcomment.dart';
import 'package:rating_summary/rating_summary.dart';
import '../../../../../constsns.dart';
import '../../../../../core/Widghts/CustomAppbar2.dart';
import '../../../../../core/entitys/reviewPorductEntity.dart';
import 'ListViewReviewItemWidget.dart';

class RateViewBody extends StatefulWidget {
  const RateViewBody({
    super.key,
    required this.productEntity,
  });
  final ProductEntity productEntity;

  @override
  State<RateViewBody> createState() => _RateViewBodyState();
}

class _RateViewBodyState extends State<RateViewBody> {

  @override
  late String commite;
  double rate = 4.1;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late ProductEntity _productEntity;
@override
  void initState() {
    super.initState();
    _productEntity= widget.productEntity;
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kHorsintalPadding.w),
            child: Form(
              key: formKey,
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
                  TextFileForComment(
                    hinttext: "اكتب التعليق..",
                    textInputType: TextInputType.text,
                    onSaved: (value) {
                      commite = value!;
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  RatingBar.builder(
                    initialRating: rate,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        rate = rating;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextButton(
                    onPressed: () {
                      onpreessed(context);
                    },
                    child: const Text(
                      'اضافه تقييم',
                      style: TextStyle(
                        color: AppColor.kPrimaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
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
                  RatingSummary(
                    counter: _productEntity.ratigCount.toInt(),
                    average: _productEntity.avgReting,
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
        ),
        ListViewReviewItemWidget(
          reviewporductEntity:_productEntity.reviews,
        )
      ],
    );
  }

  void onpreessed(BuildContext context)async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final review = ReviewporductEntity(
        name: getUser()!.name,
        revdescription: commite,
        image: 'https://example.com/image.jpg',
        ratting: rate,
        data: DateFormat('yyyy-MM-dd HH:mm', 'en').format(DateTime.now()),
      );
// ممكن اشيل await وخليها ب then
     await context.read<ReviewCubit>().addReview(
            review,
            widget.productEntity.pID,
            path: BackEndImpoint.productspath,
          );
      setState(() {
        _productEntity= _productEntity.copyWith(
          reviews: [..._productEntity.reviews,review],
          ratigCount: _productEntity.ratigCount+1,
        );
      });
    } else {
      setState(() {
        autoValidateMode = AutovalidateMode.always;
      });
    }
  }
}

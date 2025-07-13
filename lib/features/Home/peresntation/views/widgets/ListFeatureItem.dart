import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:makani/core/uitels/App_Color.dart';
import '../../../domines/entites/PostEntity.dart';
import 'feature_item.dart';
import 'package:dots_indicator/dots_indicator.dart';

class ListfeatureitemFeature extends StatefulWidget {
  const ListfeatureitemFeature({super.key, required this.postEntity});
  final List<PostEntity> postEntity;

  @override
  State<ListfeatureitemFeature> createState() => _ListfeatureitemFeatureState();
}

class _ListfeatureitemFeatureState extends State<ListfeatureitemFeature> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.postEntity.length,
          itemBuilder: (context, index, realIndex) {
            return FeatureItem(
              postEntity: widget.postEntity[index],
            );
          },
          options: CarouselOptions(
            viewportFraction: 1.0,
            aspectRatio: 242 / 150,
            autoPlay: true,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayCurve: Curves.decelerate,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            reverse: false,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        const SizedBox(height: 8),
        DotsIndicator(
          dotsCount: widget.postEntity.length,
          position: currentIndex,
          decorator: DotsDecorator(
            activeColor: AppColor.kPrimaryColor, // اللون النشط
            size: const Size.square(8.0),
            activeSize: const Size(18.0, 8.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ],
    );
  }
}

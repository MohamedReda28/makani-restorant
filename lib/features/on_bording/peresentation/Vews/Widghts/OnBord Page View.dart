import 'package:flutter/material.dart';
import '../../../../../core/uitels/App_Color.dart';
import '../../../../../core/uitels/App_TextStyle.dart';
import '../../../../../core/uitels/app_images.dart';
import 'PageViewItems.dart';

class OnBord_Page_View extends StatelessWidget {
  const OnBord_Page_View({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          isVisibilty: true,
          //(pageController.hasClients ? pageController.page!.round() : 0) ==0,
          subtitle:
              'نقدم لك تجربة طعام مميزة تجمع بين النكهات الأصيلة والخدمة الراقية، في أجواء دافئة ومريحة.\n',
          image: Assets.imagesBerger,
          backgroundColor: Assets.imagesPageview1background,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'مرحبًا بك في ',
                style: AppStyle.bold23,
              ),
              Text('Makani',
                  style:
                      AppStyle.bold23.copyWith(color: AppColor.kPrimaryColor)),
            ],
          ),
        ),
        PageViewItem(
          isVisibilty: false,
          // (pageController.hasClients ? pageController.page!.round() : 0) == 0,
          subtitle:
              'استمتع بأشهى أنواع البيتزا والبرجر المحضرة بأجود المكونات الطازجة.\n',
          image: Assets.imagesPitzza,
          backgroundColor: Assets.imagesPageview2background,
          title: Text(
            'ابحث وتذوق',
            textAlign: TextAlign.center,
            style: AppStyle.bold23,
          ),
        ),
      ],
    );
  }
}

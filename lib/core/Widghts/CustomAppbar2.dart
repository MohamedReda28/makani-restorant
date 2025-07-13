import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../uitels/App_TextStyle.dart';
import '../uitels/app_images.dart';
import 'CustomNotifcation.dart';

class CustomAppbar2 extends StatelessWidget {
  const CustomAppbar2(
      {super.key,
      required this.title,
      this.visableArw = true,
      this.visableicon = true, this.onTap});
  final String title;
  final bool visableArw, visableicon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          visible: visableArw,
          child: GestureDetector(
            onTap: onTap ?? () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              } else {
                SystemNavigator.pop();
              }
            },
            child: SvgPicture.asset(Assets.imagesArrowBack),
          ),
        ),
        Text(title, style: AppStyle.bold19),
        Visibility(visible: visableicon, child: const CustomNotifcation()),
      ],
    );
  }
}

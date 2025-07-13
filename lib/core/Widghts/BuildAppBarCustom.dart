import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../uitels/App_TextStyle.dart';
import '../uitels/app_images.dart';

AppBar buildAppBar(context, {required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: AppStyle.semibold16,
      ),
    ),
    leading: GestureDetector(
      onTap: () {

        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        } else {
          SystemNavigator.pop();
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: SvgPicture.asset(Assets.imagesArrowBack),
      ),
    ),
    leadingWidth: 35,
  );
}

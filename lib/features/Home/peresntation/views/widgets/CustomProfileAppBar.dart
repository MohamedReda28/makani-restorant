import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/helpes_function/getUser.dart';
import '../../../../../core/uitels/App_TextStyle.dart';
import '../../../../../core/uitels/app_images.dart';

class CustomProfileAppbar extends StatelessWidget {
  const CustomProfileAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        getUser().name,
        style: AppStyle.bold16,
      ),
      subtitle: Text(getUser().email,
          style: AppStyle.regular16.copyWith(
            color: const Color(0xFF949D9E),
          )),
      leading: Image.asset(Assets.imagesUseravatar),

    );
  }
}

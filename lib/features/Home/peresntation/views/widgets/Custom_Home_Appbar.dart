import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/helpes_function/getUser.dart';
import '../../../../../core/uitels/App_TextStyle.dart';
import '../../../../../core/uitels/app_images.dart';

class CustomHomeAppbar extends StatelessWidget {
  const CustomHomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(' مرحبا !..',
          style: AppStyle.regular16.copyWith(
            color: const Color(0xFF949D9E),
          )),
      subtitle: Text(
        getUser()!.name,
        style: AppStyle.bold16,
      ),
      leading: Image.asset(Assets.imagesUseravatar),
      trailing: Container(
        width: 34,
        height: 34,
        decoration: const ShapeDecoration(
          shape: OvalBorder(),
        ),
        child: Center(child: SvgPicture.asset(Assets.imagesNotification)),
      ),
    );
  }
}

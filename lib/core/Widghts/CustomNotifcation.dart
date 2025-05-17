import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import '../uitels/App_Color.dart';
import '../uitels/app_images.dart';

class CustomNotifcation extends StatelessWidget {
  const CustomNotifcation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration: const ShapeDecoration(

        shape: OvalBorder(),
      ),
      child: Center(child: SvgPicture.asset(Assets.imagesNotification)),
    );
  }
}

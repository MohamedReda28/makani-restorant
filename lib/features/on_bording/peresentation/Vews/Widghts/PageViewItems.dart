import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../constsns.dart';
import '../../../../../core/services/services/shardpreferance_Singlton.dart';
import '../../../../../core/uitels/App_TextStyle.dart';
import '../../../../../core/uitels/Screen_Size.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.subtitle,
      required this.image,
      required this.title,
      required this.backgroundColor,
      required this.isVisibilty});

  final String subtitle, image, backgroundColor;
  final Widget title;
  final bool isVisibilty;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.5,
          child: Stack(
            children: [
              // Positioned.fill(
              //   child: SvgPicture.asset(
              //     backgroundColor,
              //     fit: BoxFit.fill,
              //   ),
              // ),
              Container(
                color: const Color(0xFFEF2A39),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                top: 30,
                child: Image.asset(image),
              ),

              Visibility(
                visible: isVisibilty,
                child: GestureDetector(
                  onTap: () {
                    SharPref.setBool(kIsBordingViewSeen, true);
                    // Navigator.of(context).pushReplacementNamed(SiginView.routeName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40,right: 20),
                    child: Text(
                      'تخطي',
                      style: AppStyle.regular13,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
          SizedBox(
          height: 24.h,
                 ),
        title,
         SizedBox(
          height: 24.h,
        ),
        Flexible(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 32.w),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: AppStyle.semibold13,
              //softWrap: true,
             // overflow: TextOverflow.visible,
            ),
          ),
        ),
      ],
    );
  }
}

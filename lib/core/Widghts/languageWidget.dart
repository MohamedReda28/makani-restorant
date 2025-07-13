// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:makani/core/uitels/app_images.dart';
// import 'package:toggle_switch/toggle_switch.dart';
//
// class LanguageWidget extends StatelessWidget {
//   const LanguageWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ToggleSwitch(
//       minWidth: 50,
//       initialLabelIndex: context.locale.languageCode == "en" ? 0 : 1,
//       cornerRadius: 40.0,
//       inactiveBgColor: Colors.white,
//       totalSwitches: 2,
//       activeBgColor: [Theme.of(context).dialogBackgroundColor],
//       activeBorders: [
//         Border.all(
//           color: Theme.of(context).primaryColor,
//           width: 3.0,
//         ),
//       ],
//       labels: const ["english", "arabic"],
//       radiusStyle: true,
//       customWidgets: [
//         SvgPicture.asset(Assets.imagesUs),
//         SvgPicture.asset(Assets.imagesEg),
//       ],
//       onToggle: (index) async {
//         Locale newLocale = index == 1 ? const Locale('ar') : const Locale('en');
//         await context.setLocale(newLocale);
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:makani/features/auth/peresentation/views/SiginView.dart';
import '../../../../../core/helpes_function/deleteUserFromDiv.dart';
import '../../../../../core/uitels/App_Color.dart';
import '../../../../../core/uitels/App_TextStyle.dart';
import 'alirtedialog.dart';
class LogoutWidget extends StatelessWidget {
  const LogoutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showLogoutDialog(
            context: context,
            onConfirm: () {
              deleteUser();
              Navigator.pushNamed(context, SiginView.routeName);
            });
      },
      child: Container(
        decoration: const BoxDecoration(
          color: AppColor.lightPrimaryColor /* Green1-50 */,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text('تسجيل الخروج',
              textAlign: TextAlign.center,
              style: AppStyle.bold13.copyWith(color: const Color(0xFFF2F3F3))),
        ),
      ),
    );
  }
}

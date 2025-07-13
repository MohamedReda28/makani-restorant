import 'package:flutter/material.dart';
import 'package:makani/core/helpes_function/getUser.dart';
import 'package:makani/features/Splash/Presentation/Veiws/widgets/splashViewBody.dart';
import '../../../../constsns.dart';
import '../../../../core/services/services/shardpreferance_Singlton.dart';
import '../../../Home/peresntation/views/mainView.dart';
import '../../../auth/peresentation/views/SiginView.dart';
import '../../../on_bording/peresentation/Vews/on_bordView.dart';

class SplashVeiw extends StatefulWidget {
  const SplashVeiw({super.key});
  static const routeName = 'splash';

  @override
  State<SplashVeiw> createState() => _SplashVeiwState();
}

class _SplashVeiwState extends State<SplashVeiw> {
  @override
  void initState() {
    super.initState();
    excutNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }

  void excutNavigation() {
    bool isBordingViewSee = SharPref.getBool(kIsBordingViewSeen);
    Future.delayed(const Duration(seconds: 3), () {
      if (isBordingViewSee) {
        var isloggedIn = getUser() != null;
        if (isloggedIn) {
          Navigator.pushReplacementNamed(context, MainView.routeName);
        } else {
          Navigator.pushReplacementNamed(context, SiginView.routeName);
        }
      } else {
        Navigator.pushReplacementNamed(context, OnBordView.routeName);
      }
    });
  }
}

import 'package:flutter/material.dart';
import 'package:makani/core/entitys/ProductEntity.dart';
import '../../features/Home/peresntation/cubits/myorders/presintation/view/myorderview.dart';
import '../../features/Home/peresntation/views/widgets/who _our.dart';
import '../../features/checkout/presintation/views/checkout_view.dart';
import '../../features/auth/peresentation/views/Best Salling view.dart';
import '../../features/Home/domines/entites/CardEntity.dart';
import '../../features/Home/peresntation/views/mainView.dart';
import '../../features/Home/peresntation/views/produt_View.dart';
import '../../features/Searchview/SearchView.dart';
import '../../features/Splash/Presentation/Veiws/SpalshView.dart';
import '../../features/auth/peresentation/views/ForgetPass.dart';
import '../../features/auth/peresentation/views/SiginView.dart';
import '../../features/auth/peresentation/views/SignupView.dart';
import '../../features/displayaitem/presentarion/view/DispalyIrtem.dart';
import '../../features/on_bording/peresentation/Vews/on_bordView.dart';
import '../../features/rate/presntation/viwes/rateView.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashVeiw.routeName:
      return MaterialPageRoute(builder: (context) => const SplashVeiw());
    case OnBordView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBordView());
    case BestSallingView.routeName:
      return MaterialPageRoute(builder: (context) => const BestSallingView());
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());
    case SiginView.routeName:
      return MaterialPageRoute(builder: (context) =>  SiginView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) =>  SignUpView());
    case ForgetpassView.routeName:
      return MaterialPageRoute(builder: (context) => const ForgetpassView());
    case ProdutsView.routeName:
      return MaterialPageRoute(builder: (context) => const ProdutsView());
    case Searchview.routeName:
      return MaterialPageRoute(builder: (context) => const Searchview());
    case Myorderview.routeName:
      return MaterialPageRoute(builder: (context) => const Myorderview());
    case Rateview.routeName:
      return MaterialPageRoute(builder: (context) =>  Rateview(productEntity: settings.arguments as ProductEntity,
      ));
    case WhoOur.routeName:
      return MaterialPageRoute(builder: (context) => const WhoOur());
    case DisplayItem.routeName:
      return MaterialPageRoute(builder: (context) => DisplayItem(
        productEntity: settings.arguments as ProductEntity,
      ));
    case Checkout_View.routeName:
      return MaterialPageRoute(
          builder: (context) => Checkout_View(
                cartItems: settings.arguments as CartEntity,
              ));
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/cart/cart_cubit_cubit.dart';
import 'widgets/CustomBottonNavigationBar.dart';
import 'widgets/MainViewBodyBlocConsumer.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const String routeName = 'homeView';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currintindex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        bottomNavigationBar: Custombottonnavigationbar(
          changed: (index) {
            currintindex = index;
            setState(() {});
          },
        ),
        body: SafeArea(
          child: MainViewBodyBlocConsumer(currintindex: currintindex),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:makani/features/Home/peresntation/views/widgets/ProfileviewBody.dart';


class Profileview extends StatelessWidget {
  const Profileview({super.key});
  static const routeName = 'ProfileView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ProfileviewBody(),
      ),
    );
  }
}

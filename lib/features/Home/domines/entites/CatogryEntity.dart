import 'dart:ui';

class CategortEntity{

  final String image;
  final String title;
  final void Function() onTap;

  CategortEntity({required this.onTap, required this.image, required this.title});

}
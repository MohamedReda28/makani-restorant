import 'package:flutter/material.dart';
import 'package:makani/features/Home/domines/entites/PostEntity.dart';
import '../../../../../core/Widghts/custom Url image.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem({super.key, required this.postEntity});
final PostEntity postEntity;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(9),
      child: SizedBox(
        width: width,
        child: CustomNetworkImage(
            imageUrl: postEntity.imageUrl,
         ),
      ),
    );
  }
}

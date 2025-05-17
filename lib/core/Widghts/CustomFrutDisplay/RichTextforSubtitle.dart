import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../entitys/ProductEntity.dart';
import '../../uitels/App_Color.dart';
import '../../uitels/App_TextStyle.dart';

class RichTextforSubtitle extends StatelessWidget {
  const RichTextforSubtitle({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      '${productEntity.price} جنيه',
      style: AppStyle.bold23.copyWith(
        color: AppColor.secondColor,
      ),
      maxLines: 1,
      minFontSize: 12,
      overflow: TextOverflow.ellipsis,
    );

  }
}

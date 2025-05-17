import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      width: 80.w,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.fill,
        errorWidget: (context, url, error) => Container(
          color: Colors.grey,
          height: 100,
          width: 100,
        ),
      ),
    );
  }
}

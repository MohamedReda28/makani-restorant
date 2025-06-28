import 'package:flutter/material.dart';

import '../../../../../core/entitys/reviewPorductEntity.dart';
import 'DisplayCommentWidget.dart';
class ListViewReviewItemWidget extends StatelessWidget {
  const ListViewReviewItemWidget({super.key, required this.reviewporductEntity});
   final List<ReviewporductEntity> reviewporductEntity;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: reviewporductEntity.length,
      itemBuilder: (context,index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: ReviewItemWidget(
         reviewporductEntity: reviewporductEntity[index],
        ),
      ),


    );
  }
}

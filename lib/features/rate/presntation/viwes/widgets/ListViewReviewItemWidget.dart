import 'package:flutter/material.dart';

import 'DisplayCommentWidget.dart';
class ListViewReviewItemWidget extends StatelessWidget {
  const ListViewReviewItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 8,
      itemBuilder: (context,index) => const Padding(
        padding: EdgeInsets.symmetric(vertical: 4),
        child: ReviewItemWidget(
          name: "Ahmed Amr",
          date: "25/06/2020",
          avatarUrl: "https://i.pravatar.cc/150?img=1",
          rating: 5.0,
          comment: "هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء يشدّ انتباه القارئ...",
        ),
      ),


    );
  }
}

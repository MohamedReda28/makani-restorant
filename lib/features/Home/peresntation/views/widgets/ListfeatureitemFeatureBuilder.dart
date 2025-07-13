import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Widghts/customErrorWidght.dart';
import '../../../../../core/helpes_function/get_DammyPost.dart';
import '../../cubits/post/post_cubit.dart';
import 'ListFeatureItem.dart';
class ListfeatureitemFeatureBuilder extends StatelessWidget {
  const ListfeatureitemFeatureBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit,PostState>(
      builder: (context,state){
        if (state is PostSuccess){
          return ListfeatureitemFeature(postEntity: state.posts,);
        }else if(state is PostFaluir){
          return Customerrorwidght(text: state.errMassage);
        }else{
          return  ListfeatureitemFeature(postEntity:getDomyPosts() );
        }
      },
    );

  }
}

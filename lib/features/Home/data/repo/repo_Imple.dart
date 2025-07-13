import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:makani/core/erroes/Failur.dart';
import 'package:makani/core/services/services/DataBase_Serveces.dart';
import 'package:makani/core/uitels/backend%20Impoint.dart';
import 'package:makani/features/Home/data/Models/postModel.dart';
import 'package:makani/features/Home/domines/entites/PostEntity.dart';
import 'package:makani/features/Home/domines/repo/PostRepo.dart';

class PostRepoImple implements PostRepo{
  final DataBaseServeces dataBaseServeces;

  PostRepoImple({required this.dataBaseServeces});
  @override
  Future<Either<Failur, List<PostEntity>>> getPost()async {
   try {
     var data=   await dataBaseServeces.getData(path: BackEndImpoint.getPosts)as List<Map<String, dynamic>>;
     List<PostModel> posts = data.map((e)=>PostModel.fromJson(e)).toList();
     List<PostEntity> postEntity= posts.map((e)=>e.toEntity()).toList();
     return Right(postEntity);
   }  catch (e) {
     log(e.toString());
     return left(ServerFailure('Failed to load products'));
   }
  }
  
}


import 'package:dartz/dartz.dart';
import 'package:makani/core/erroes/Failur.dart';
import 'package:makani/features/Home/domines/entites/PostEntity.dart';

abstract class PostRepo {

  Future<Either<Failur,List<PostEntity>>>getPost();
}

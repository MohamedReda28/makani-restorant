import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:makani/features/Home/domines/entites/PostEntity.dart';
import 'package:makani/features/Home/domines/repo/PostRepo.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit(this.postRepo) : super(PostInitial());
  final PostRepo postRepo;

  Future<void> getPost()async{
    emit(PostLoading());
    var result = await postRepo.getPost();
    result.fold((faluir)=>emit(PostFaluir(faluir.message)),
        (posts)=>emit(PostSuccess(posts: posts))
    );
  }
}

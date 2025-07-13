import '../../features/Home/domines/entites/PostEntity.dart';

PostEntity getDummyPost() {
  return PostEntity(
      imageUrl: '');
}

List<PostEntity> getDomyPosts() {
  return [
    getDummyPost(),
    getDummyPost(),
    getDummyPost(),
  ];
}
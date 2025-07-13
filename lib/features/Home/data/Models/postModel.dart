import 'package:makani/features/Home/domines/entites/PostEntity.dart';

class PostModel{

  final String poId;
  final String imageUrl;

  PostModel({required this.poId, required this.imageUrl});
  factory PostModel.fromJson(Map<String,dynamic> json){
    return PostModel(
        poId: json['poID'],
        imageUrl: json['imageUrl']);
  }
 PostEntity toEntity(){
    return PostEntity(
        imageUrl:imageUrl
    );
  }

}


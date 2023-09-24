import 'package:trilhaap/model/post_model.dart';
import 'package:trilhaap/repositories/posts/posts_repository.dart';

import '../../jsonplaceholder_custom_dio.dart';

class PostsDioRepository implements PostsRepository {
  @override
  Future<List<PostModel>> getPosts() async {
    var jsonPlaceHolderCustomDio = JsonPlaceHolderCustomDio();
    var response = await jsonPlaceHolderCustomDio.dio.get("posts");
    if (response.statusCode == 200) {
      return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}

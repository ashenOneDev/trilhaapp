import 'package:trilhaap/model/comments_model.dart';
import 'package:trilhaap/repositories/jsonplaceholder_custom_dio.dart';

import '../comments_repository.dart';

class CommentsDioRespository implements CommentsRepository {
  @override
  Future<List<CommentsModel>> getComments(int postId) async {
    var jsonPlaceHolderCustomDio = JsonPlaceHolderCustomDio();
    var response =
        await jsonPlaceHolderCustomDio.dio.get("posts/$postId/comments");
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((e) => CommentsModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }
}

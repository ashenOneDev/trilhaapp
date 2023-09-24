import 'package:trilhaap/model/comments_model.dart';

import '../comments_repository.dart';

import 'package:dio/dio.dart';

class CommentsDioRespository implements CommentsRepository {
  @override
  Future<List<CommentsModel>> getComments(int postId) async {
    var dio = Dio();
    var response = await dio
        .get("https://jsonplaceholder.typicode.com/posts/$postId/comments");
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((e) => CommentsModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }
}

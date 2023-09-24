import 'dart:convert';

import 'package:trilhaap/model/comments_model.dart';

import 'package:http/http.dart' as http;
import 'package:trilhaap/repositories/comments/comments_repository.dart';

class CommentsHttpRepository implements CommentsRepository {
  @override
  Future<List<CommentsModel>> getComments(int postId) async {
    var response = await http.get(Uri.parse(
        "https://jsonplaceholder.typicode.com/posts/$postId/comments"));
    if (response.statusCode == 200) {
      var jsonComemnts = jsonDecode(response.body);
      return (jsonComemnts as List)
          .map((e) => CommentsModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }
}

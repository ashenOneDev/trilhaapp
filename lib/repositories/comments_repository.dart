import 'dart:convert';

import 'package:trilhaap/model/comments_model.dart';

import 'package:http/http.dart' as http;

class CommentsRepository {
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

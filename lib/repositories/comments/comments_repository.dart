import '../../model/comments_model.dart';

abstract class CommentsRepository {
  Future<List<CommentsModel>> getComments(int postId);
}

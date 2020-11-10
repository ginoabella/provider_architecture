import 'package:provider_architecture/core/models/post.dart';
import 'package:provider_architecture/core/services/api.dart';
import 'package:provider_architecture/core/view_models/base_model.dart';
import 'package:provider_architecture/locator.dart';

class HomeModel extends BaseModel {
  Api _api = locator<Api>();

  List<Post> posts;

  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    posts = await _api.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}

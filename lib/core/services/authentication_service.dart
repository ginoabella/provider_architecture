import 'dart:async';

import 'package:provider_architecture/core/models/user.dart';
import 'package:provider_architecture/core/services/api.dart';
import 'package:provider_architecture/locator.dart';

class AuthenticationService {
  // Inject our Api
  Api _api = locator<Api>();
  StreamController<User> userController = StreamController<User>();

  Future<bool> login(int userId) async {
    // Get the user profile for id
    var fetcheduser = await _api.getUserProfile(userId);

    // Check if success
    var hasUser = fetcheduser != null;
    if (hasUser) {
      userController.add(fetcheduser);
    }

    return hasUser;
  }
}

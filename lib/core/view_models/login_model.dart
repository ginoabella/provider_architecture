import 'package:provider_architecture/core/services/authentication_service.dart';
import 'package:provider_architecture/core/view_models/base_model.dart';
import 'package:provider_architecture/locator.dart';
export 'package:provider_architecture/core/enums/viewstate.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  String errorMessage;

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);

    final userId = int.tryParse(userIdText);
    if (userId == null) {
      errorMessage = 'Value entered is not a number';
      setState(ViewState.Idle);
      return false;
    } else {
      errorMessage = null;
    }

    final success = await _authenticationService.login(userId);

    setState(ViewState.Idle);
    return success;
  }
}

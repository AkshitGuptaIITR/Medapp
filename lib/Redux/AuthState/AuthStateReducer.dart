import 'package:medapp/Redux/AuthState/AuthStateActions.dart';

class AuthState {
  final bool isAuth;
  final dynamic user;

  AuthState(this.isAuth, this.user);
}

AuthState authReducer(AuthState state, dynamic action) {
  if (action is LoginAction) {
    print(action.user);
    return AuthState(true, action.user);
  } else if (action is LogoutAction) return AuthState(false, null);
  return state;
}

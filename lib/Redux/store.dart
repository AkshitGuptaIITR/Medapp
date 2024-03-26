import 'package:medapp/Redux/AuthState/AuthStateReducer.dart';
import 'package:redux/redux.dart';

final store =
    Store<AuthState>(authReducer, initialState: AuthState(false, null));

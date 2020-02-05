import 'package:pawlog/src/state/app_state.dart';

import 'package:pawlog/src/reducer/auth_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    authState: authReducer(state.authState, action),
  );
}

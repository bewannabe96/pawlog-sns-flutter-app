import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:pawlog/src/state/authentication_state.dart';

export 'authentication_state.dart';

class RootState {
  final authState = AuthenticationState();

  List<SingleChildStatelessWidget> toProviders() => [
        ChangeNotifierProvider<AuthenticationState>(
          create: (_) => authState,
        ),
      ];
}

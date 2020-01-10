export 'config.dart';
export 'user.dart';
export 'story.dart';

import 'package:http/http.dart' as http;

class PawlogAPIClient {
  static final http.Client client = http.Client();

  // static const apiServerHost =
  //     'https://8wxfdb72b0.execute-api.ap-southeast-1.amazonaws.com/dev';
  static const apiServerHost = 'http://localhost:3000';
}

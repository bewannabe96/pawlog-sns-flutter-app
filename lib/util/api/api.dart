export 'config.dart';
export 'user.dart';
export 'story.dart';

import 'package:http/http.dart' as http;

class PawlogAPIClient {
  static final http.Client client = http.Client();

  static const apiServerHost =
      'https://x6hqoxn4w5.execute-api.ap-southeast-1.amazonaws.com/dev';
}

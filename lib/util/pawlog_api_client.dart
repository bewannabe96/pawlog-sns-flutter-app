import 'package:http/http.dart' as http;

class PawlogAPIClient {
  static final http.Client _client = http.Client();

  static final _apiServerHost = 'http://localhost:3000';

  static Future<void> loadProfile(int userid) async {
    var path = '/profile/$userid';

    var response = await _client.get('$_apiServerHost$path');

    print(response.bodyBytes);
  }
}

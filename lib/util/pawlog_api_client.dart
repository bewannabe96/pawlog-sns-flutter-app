import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:pawlog/model/model.dart';

class PawlogAPIClient {
  static final http.Client _client = http.Client();

  // static final _apiServerHost = 'http://localhost:3000';
  static const _apiServerHost =
      'https://x6hqoxn4w5.execute-api.ap-southeast-1.amazonaws.com/dev';

  static Future<Profile> loadProfile(int userid) async {
    var path = '$_apiServerHost/profile/$userid';

    var response = await _client.get(path);
    if (response.statusCode != 200) {
      throw Exception('error getting profile');
    }

    var profileJSON = jsonDecode(response.body);
    return Profile.fromJSON(profileJSON);
  }
}

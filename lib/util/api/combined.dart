import 'package:pawlog/util/api/api.dart';

class CombinedAPIClient extends PawlogAPIClient {
  // static Future<List<Story>> fetchProfileStories(int userid) async {
  //   var path = PawlogAPIClient.apiServerHost + '/story/user/$userid';

  //   final response = await PawlogAPIClient.client.get(path);

  //   if (response.statusCode != 200) {
  //     throw Exception('error getting profile stories');
  //   }

  //   // var json = jsonDecode(response.body);
  //   return [];
  // }
}

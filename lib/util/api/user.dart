import 'package:pawlog/entity/entity.dart';
import 'package:pawlog/util/api/api.dart';

class UserAPIClient extends PawlogAPIClient {
  static Future<UserBaseEntity> fetchUserInfo(String userHash) async {
    throw ('not implemented');
    return UserBaseEntity(userID: 1);
  }
}

import 'package:pawlog/entity/entity.dart';
import 'package:pawlog/util/api/api.dart';

class UserAPIClient extends PawlogAPIClient {
  static Future<UserInfoEntity> fetchUserInfo(String userHash) async {
    throw ('not implemented');
    return UserInfoEntity(userID: 1);
  }
}

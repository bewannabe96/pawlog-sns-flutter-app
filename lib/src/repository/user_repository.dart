import 'package:pawlog/src/util/api/api.dart';

import 'package:pawlog/src/entity/entity.dart';
import 'package:pawlog/src/model/model.dart';

class UserRepository {
  static Future<User> fetchUserInfo(String userHash) async {
    UserEntity userEntity;

    userEntity = await UserAPIClient.fetchUserInfo(userHash);

    return User.fromEntity(userEntity);
  }
}

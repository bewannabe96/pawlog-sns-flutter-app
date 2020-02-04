import 'package:pawlog/util/api/api.dart';

import 'package:pawlog/src/entity/entity.dart';
import 'package:pawlog/src/model/model.dart';

class ConfigRepository {
  static Future<SyncConfig> loadConfig() async {
    List<BreedTypeEntity> breedTypeEntities;
    try {
      breedTypeEntities = await ConfigAPIClient.loadBreedTypes();
      // UserLocalStorage.writeUserInfo(userEntity);
    } catch (_) {
      // userEntity = await UserLocalStorage.readUserInfo();
    }

    return SyncConfig.fromEntity(
      breedTypes: breedTypeEntities,
    );
  }
}

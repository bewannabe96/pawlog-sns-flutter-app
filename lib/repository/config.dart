import 'package:pawlog/entity/entity.dart';
import 'package:pawlog/model/model.dart';
import 'package:pawlog/util/api/api.dart';

class ConfigRepository {
  static Future<SyncConfig> loadConfig() async {
    BreedTypesEntity breedTypesEntity;
    try {
      breedTypesEntity = await ConfigAPIClient.loadBreedTypes();
      // UserLocalStorage.writeUserInfo(userEntity);
    } catch (_) {
      // userEntity = await UserLocalStorage.readUserInfo();
    }

    return SyncConfig.fromEntity(
      breedTypes: breedTypesEntity,
    );
  }
}

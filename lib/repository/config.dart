import 'package:pawlog/model/model.dart';

class ConfigRepository {
  static Future<SyncConfig> loadConfig() async {
    return SyncConfig(breedTypes: {
      1: Breed(1, 'Pug'),
      2: Breed(2, 'Golden'),
      3: Breed(3, 'Fox'),
    });
  }
}

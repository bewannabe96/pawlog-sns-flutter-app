import 'package:pawlog/model/model.dart';

class ConfigRepository {
  static Future<SyncConfig> loadConfig() async {
    return SyncConfig(breedTypes: [
      Breed(1, 'Pug'),
      Breed(2, 'Golden'),
      Breed(3, 'Fox'),
    ]);
  }
}

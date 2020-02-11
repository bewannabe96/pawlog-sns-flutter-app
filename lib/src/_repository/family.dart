import 'package:meta/meta.dart';

import 'package:pawlog/src/util/api/api.dart';

import 'package:pawlog/src/entity/entity.dart';
import 'package:pawlog/src/model/model.dart';

class FamilyRepository {
  static Future<Family> registerPet(
    int userID,
    Family family, {
    @required String name,
    @required breedID,
  }) async {
    final petEntity =
        await UserAPIClient.registerPet(userID, name, breedID, null);

    return family.registerPet(Pet.fromEntity(petEntity));
  }
}

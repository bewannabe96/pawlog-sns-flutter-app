import 'package:meta/meta.dart';

import 'package:pawlog/src/util/api/api.dart';

import 'package:pawlog/src/entity/entity.dart';
import 'package:pawlog/src/model/model.dart';

class FamilyRepository {
  static Future<Family> createFamily(
    int userID, {
    @required String name,
  }) async {
    final familyEntity = await UserAPIClient.createFamily(userID, name);

    return Family.fromEntity(familyEntity);
  }

  static Future<Family> loadFamily(int userID) async {
    FamilyEntity familyEntity;
    try {
      familyEntity = await UserAPIClient.fetchFamily(userID);
      // await FamilyLocalStorage.writeUserFamily(familyEntity);
    } catch (_) {
      // familyEntity = await FamilyLocalStorage.readUserFamily();
    }

    return familyEntity == null ? null : Family.fromEntity(familyEntity);
  }

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

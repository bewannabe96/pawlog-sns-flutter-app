import 'package:meta/meta.dart';

import 'package:pawlog/entity/entity.dart';
import 'package:pawlog/model/model.dart';
import 'package:pawlog/util/api/api.dart';
import 'package:pawlog/util/local_storage/local_storage.dart';

class FamilyRepository {
  static Future<Family> createFamily(
    int userID, {
    @required String name,
  }) async {
    FamilyEntity familyEntity = FamilyEntity(name: name);

    try {
      await FamilyAPIClient.createUserFamily(userID, familyEntity);
      await FamilyLocalStorage.writeUserFamily(familyEntity);
    } catch (_) {}

    return Family.fromEntity(familyEntity);
  }

  static Future<Family> loadFamily(int userID) async {
    FamilyEntity familyEntity;
    try {
      familyEntity = await FamilyAPIClient.fetchUserFamily(userID);
    } catch (_) {
      familyEntity = await FamilyLocalStorage.readUserFamily();
    }

    return familyEntity == null ? null : Family.fromEntity(familyEntity);
  }

  static Future<Family> registerPet(
    int userID,
    Family family, {
    @required String name,
    @required breedID,
  }) async {
    FamilyEntity familyEntity = family.toEntity();
    PetEntity petEntity = PetEntity(name: name, breed: breedID);

    try {
      familyEntity = await FamilyAPIClient.registerUserPet(
        userID,
        familyEntity,
        petEntity,
      );
      await FamilyLocalStorage.writeUserFamily(familyEntity);
    } catch (_) {}

    return Family.fromEntity(familyEntity);
  }
}

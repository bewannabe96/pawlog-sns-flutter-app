import 'package:pawlog/entity/entity.dart';
import 'package:pawlog/util/api/api.dart';

class FamilyAPIClient extends PawlogAPIClient {
  static Future<void> createUserFamily(int userID, FamilyEntity familyEntity) {
    return null;
  }

  static Future<FamilyEntity> fetchUserFamily(int userID) async {
    throw ('');
    return FamilyEntity(
      name: 'HappyFam',
      pets: [
        PetEntity(petID: 1, name: 'Cash', breed: 'Pug'),
        PetEntity(petID: 2, name: 'Soye', breed: 'Pug'),
      ],
    );
  }
}

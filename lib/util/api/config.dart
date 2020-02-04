import 'dart:convert';

import 'package:pawlog/util/api/api.dart';

import 'package:pawlog/src/entity/entity.dart';

class ConfigAPIClient {
  static Future<List<BreedTypeEntity>> loadBreedTypes() async {
    final path = PawlogAPIClient.apiServerHost + '/config/breedTypes';

    final response = await PawlogAPIClient.client.get(path);

    if (response.statusCode != 200) {
      throw ('');
    }

    var json = jsonDecode(response.body);
    return (json['breeds'] as List)
        .map((j) => BreedTypeEntity.fromJson(j))
        .toList();
  }
}

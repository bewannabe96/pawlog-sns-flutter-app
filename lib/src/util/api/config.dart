import 'dart:convert';
import 'dart:io';

import 'package:pawlog/src/util/api/api.dart';

import 'package:pawlog/src/entity/entity.dart';

class ConfigAPIClient {
  static Future<List<BreedTypeEntity>> loadBreedTypes() async {
    final path = PawlogAPIClient.apiServerHost + '/config/breedTypes';

    final response = await PawlogAPIClient.client.get(path);

    switch (response.statusCode) {
      case HttpStatus.ok:
        var json = jsonDecode(response.body);
        return (json['breeds'] as List)
            .map((j) => BreedTypeEntity.fromJson(j))
            .toList();
      default:
        throw ('Unexpected Status Code');
    }
  }
}

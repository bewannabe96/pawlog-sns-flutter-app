import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pawlog/model/model.dart';
import 'package:pawlog/entity/entity.dart';

import 'package:pawlog/src/app.dart';

void main() {
  testWidgets('Stories list test', (WidgetTester tester) async {
    var jsonstring = await rootBundle.loadString('res/sample/stories.json');
    final json = jsonDecode(jsonstring);

    final entities =
        (json['stories'] as List).map((j) => StoryEntity.fromJson(j)).toList();
    final stories = entities.map((entity) => Story.fromEntity(entity)).toList();

    // Build our app and trigger a frame.
    await tester.pumpWidget(PawlogApp());
  });
}

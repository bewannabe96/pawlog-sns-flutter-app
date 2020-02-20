import 'package:pawlog/src/model/model.dart';

class StartLoadingFamilyAction {
  @override
  String toString() => 'StartLoadingFamilyAction';
}

class UpdateFamilyAction {
  final Family family;

  UpdateFamilyAction(this.family);

  @override
  String toString() => 'UpdateFamilyAction';
}

class ThrowFamilyErrorAction {
  String error;

  ThrowFamilyErrorAction(this.error);

  @override
  String toString() => 'ThrowFamilyErrorAction {$error}';
}

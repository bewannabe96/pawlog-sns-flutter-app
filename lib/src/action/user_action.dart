import 'package:pawlog/src/model/model.dart';

class StartLoadingProfileAction {
  @override
  String toString() => 'StartLoadingProfileAction';
}

class FinishLoadingProfileAction {
  final Profile profile;

  FinishLoadingProfileAction(
    this.profile,
  );

  @override
  String toString() => 'FinishLoadingProfileAction';
}

class StartLoadingFamilyAction {
  @override
  String toString() => 'StartLoadingFamilyAction';
}

class FinishLoadingFamilyAction {
  final Family family;

  FinishLoadingFamilyAction(
    this.family,
  );

  @override
  String toString() => 'FinishLoadingFamilyAction';
}

class UpdateFamilyAction {
  final Family family;

  UpdateFamilyAction(
    this.family,
  );

  @override
  String toString() => 'UpdateFamilyAction';
}

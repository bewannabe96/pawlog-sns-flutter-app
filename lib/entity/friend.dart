class FriendEntity {
  final int userID;
  final String name;
  final String email;

  const FriendEntity({
    this.userID,
    this.name,
    this.email,
  });

  factory FriendEntity.fromJson(Map<String, dynamic> json) {
    return FriendEntity(
      userID: json['userid'],
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    json['userid'] = userID;
    json['name'] = name;
    json['email'] = email;

    return json;
  }
}

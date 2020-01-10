class FriendEntity {
  final int userID;
  final String email;
  final String name;
  final String imageURL;

  const FriendEntity({
    this.userID,
    this.email,
    this.name,
    this.imageURL,
  });

  factory FriendEntity.fromJson(Map<String, dynamic> json) {
    return FriendEntity(
      userID: json['userid'],
      email: json['email'],
      name: json['name'],
      imageURL: json['imageurl'],
    );
  }
}

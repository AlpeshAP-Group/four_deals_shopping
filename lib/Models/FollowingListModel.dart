class FollowingListModel {
  final int userid;
  final String firstname;
  final String profileImage;

  FollowingListModel({
    required this.userid,
    required this.firstname,
    required this.profileImage,
  });

  factory FollowingListModel.fromJson(Map<String, dynamic> json) {
    return FollowingListModel(
      userid: json['userId'],
      firstname: json['firstName'],
      profileImage: json['profileImage'],
    );
  }
}

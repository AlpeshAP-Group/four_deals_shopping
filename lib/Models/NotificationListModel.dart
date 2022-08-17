class NotificationListModel {
  final int notificationid;
  final String title;
  final String body;
  final String titlear;
  final String bodyAr;
  final int createdat;

  NotificationListModel({
    required this.notificationid,
    required this.title,
    required this.body,
    required this.titlear,
    required this.bodyAr,
    required this.createdat,
  });

  factory NotificationListModel.fromJson(Map<String, dynamic> json) {
    return NotificationListModel(
      notificationid: json['notificationId'],
      title: json['title'],
      body: json['body'],
      titlear: json['titleAr'],
      bodyAr: json['bodyAr'],
      createdat: json['createdAt'],
    );
  }
}

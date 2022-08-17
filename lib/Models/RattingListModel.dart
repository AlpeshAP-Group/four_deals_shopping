class RattingListModel {
  final int ratting;

  final String percentage;

  RattingListModel({
    required this.ratting,
    required this.percentage,
  });

  factory RattingListModel.fromJson(Map<String, dynamic> json) {
    return RattingListModel(
      ratting: json['rating'],
      percentage: json['userPercentage'],
    );
  }
}

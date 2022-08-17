class SearchListModel {
  final String title;

  SearchListModel({
    required this.title,
  });

  factory SearchListModel.fromJson(Map<String, dynamic> json) {
    return SearchListModel(
      title: json['keywordEn'],
    );
  }
}

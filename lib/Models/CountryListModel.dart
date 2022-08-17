class CountryListModel {
  final String name;
  final String iso2;

  CountryListModel({
    required this.name,
    required this.iso2,
  });

  factory CountryListModel.fromJson(Map<String, dynamic> json) {
    return CountryListModel(
      name: json['name'],
      iso2: json['iso2'],
    );
  }
}

class GetCategoryModel {
  final int id;
  final String name;

  final String categoryimage;

  GetCategoryModel({
    required this.id,
    required this.name,
    required this.categoryimage,
  });

  factory GetCategoryModel.fromJson(Map<String, dynamic> json) {
    return GetCategoryModel(
      id: json['categoryId'],
      name: json['categoryNameEn'],
      categoryimage: json['categoryImage'],
    );
  }
}

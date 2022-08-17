class SubCategoryVarientListModel {
  final int categoryId;
  final String varname;
  final String varnamear;
  final String image;

  SubCategoryVarientListModel({
    required this.categoryId,
    required this.varname,
    required this.varnamear,
    required this.image,
  });

  factory SubCategoryVarientListModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryVarientListModel(
      categoryId: json['variantListId'],
      varname: json['nameEn'],
      varnamear: json['nameAr'],
      image: json['image'],
    );
  }
}

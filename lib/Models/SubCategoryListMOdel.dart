class SubCategoryListModel {
  final int categoryId;
  final String catname;
  final String catnamearb;
  final String catimage;
  final String catappimage;
  final String caticon;
  final int subcat;

  SubCategoryListModel({
    required this.categoryId,
    required this.catname,
    required this.catnamearb,
    required this.catimage,
    required this.catappimage,
    required this.caticon,
    required this.subcat,
  });

  factory SubCategoryListModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryListModel(
      categoryId: json['categoryId'],
      catname: json['categoryNameEn'],
      catnamearb: json['categoryNameAr'],
      catimage: json['categoryImage'],
      catappimage: json['categoryAppImage'],
      caticon: json['categoryIcon'],
      subcat: json['subCategoryId'],
    );
  }
}

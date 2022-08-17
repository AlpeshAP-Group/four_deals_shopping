class GetSubCategoryVariantListModel {
  final int id;
  final String name;

  final int groupid;

  GetSubCategoryVariantListModel({
    required this.id,
    required this.name,
    required this.groupid,
  });

  factory GetSubCategoryVariantListModel.fromJson(Map<String, dynamic> json) {
    return GetSubCategoryVariantListModel(
      id: json['variantListId'],
      name: json['nameEn'],
      groupid: json['variantGroupId'],
    );
  }
}

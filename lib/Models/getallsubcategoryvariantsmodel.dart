import 'package:four_deals_shopping/Models/GetSubCategoryVariantListModel.dart';

class GetVariantOfSubcategoryModel {
  final int id;
  final int vargroupid;
  final String name;

  final String inputtype;
  final List<GetSubCategoryVariantListModel> variants;

  GetVariantOfSubcategoryModel(
      {required this.id,
      required this.vargroupid,
      required this.name,
      required this.inputtype,
      required this.variants});

  factory GetVariantOfSubcategoryModel.fromJson(Map<String, dynamic> json) {
    return GetVariantOfSubcategoryModel(
        id: json['categoryId'],
        vargroupid: json['variantGroupId'],
        name: json['name'],
        inputtype: json['inputType'],
        variants: List<GetSubCategoryVariantListModel>.from(json["variantList"]
            .map((x) => GetSubCategoryVariantListModel.fromJson(x))));
  }
}

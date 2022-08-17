class VariantProductListModel {
  final int adid;
  final String title;
  final String descriptions;
  final String sellingprice;
  final String adstype;
  final String thumnailimage;
  final int catid;
  final int subCategoryId;
  final String thumnails;
  final String userfirstname;

  final String userName;
  final String email;
  final String mobile;
  final String role;
  final String categoryName;
  final String subCategoryName;

  VariantProductListModel(
      {required this.adid,
      required this.title,
      required this.descriptions,
      required this.sellingprice,
      required this.adstype,
      required this.thumnailimage,
      required this.subCategoryId,
      required this.catid,
      required this.thumnails,
      required this.userfirstname,
      required this.userName,
      required this.email,
      required this.mobile,
      required this.role,
      required this.categoryName,
      required this.subCategoryName});

  factory VariantProductListModel.fromJson(Map<String, dynamic> json) {
    return VariantProductListModel(
      adid: json['adId'],
      title: json['title'],
      descriptions: json['description'],
      sellingprice: json['sellingPrice'],
      adstype: json['adType'],
      thumnailimage: json['thumbnailImage'],
      subCategoryId: json['subCategoryId'],
      catid: json['categoryId'],
      thumnails: json['thumbnailImage'],
      userfirstname: json['userFirstName'],
      userName: json['userName'],
      email: json['email'],
      mobile: json['mobile'],
      role: json['role'],
      categoryName: json['categoryName'],
      subCategoryName: json['subCategoryName'],
    );
  }
}

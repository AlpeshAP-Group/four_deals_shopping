class StoreDetailsListModel {
  final int adid;

  final int storeid;
  final String title;
  final String description;
  final String amount;

  final String adtype;
  final String thumnails;
  final int catid;
  final int subcatid;
  final int aproved;
  final String catname;
  final String subcatname;
  final String adimage;

  StoreDetailsListModel(
      {required this.adid,
      required this.storeid,
      required this.title,
      required this.amount,
      required this.description,
      required this.adtype,
      required this.thumnails,
      required this.catid,
      required this.subcatid,
      required this.aproved,
      required this.catname,
      required this.subcatname,
      required this.adimage});

  factory StoreDetailsListModel.fromJson(Map<String, dynamic> json) {
    return StoreDetailsListModel(
      adid: json['adId'],
      storeid: json['storeId'],
      title: json['title'],
      description: json['description'],
      amount: json['sellingPrice'],
      adtype: json['adType'],
      thumnails: json['thumbnailImage'],
      catid: json['categoryId'],
      subcatid: json['subCategoryId'],
      aproved: json['approved'],
      catname: json['categoryName'],
      subcatname: json['subCategoryName'],
      adimage: json['adImages'],
    );
  }
}

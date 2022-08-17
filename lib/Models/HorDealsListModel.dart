class HotDealsModel {
  final int addid;
  final int storeid;
  final String title;

  final String descriptio;
  final String price;
  final String sellingprice;
  final String addtype;
  final String thumnail;

  final int catid;
  final int subcatid;

  final int startingtime;
  final int endingtime;

  HotDealsModel(
      {required this.addid,
      required this.storeid,
      required this.title,
      required this.descriptio,
      required this.price,
      required this.sellingprice,
      required this.addtype,
      required this.thumnail,
      required this.catid,
      required this.subcatid,
      required this.startingtime,
      required this.endingtime});

  factory HotDealsModel.fromJson(Map<String, dynamic> json) {
    return HotDealsModel(
      addid: json['adId'],
      storeid: json['storeId'],
      title: json['title'],
      descriptio: json['description'],
      price: json['marketPrice'],
      sellingprice: json['sellingPrice'],
      addtype: json['adType'],
      thumnail: json['thumbnailImage'],
      catid: json['categoryId'],
      subcatid: json['subCategoryId'],
      startingtime: json['offerStartingTime'],
      endingtime: json['offerClosingTime'],
    );
  }
}

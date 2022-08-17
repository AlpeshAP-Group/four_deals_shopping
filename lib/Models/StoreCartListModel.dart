class StoreCartListModel {
  final int cartid;
  final int adid;
  final int quantity;
  final int userid;
  final String storeid;
  final String title;
  final String price;
  final String image;

  StoreCartListModel({
    required this.cartid,
    required this.adid,
    required this.quantity,
    required this.userid,
    required this.storeid,
    required this.title,
    required this.price,
    required this.image,
  });

  factory StoreCartListModel.fromJson(Map<String, dynamic> json) {
    return StoreCartListModel(
      cartid: json['cartId'],
      adid: json['adId'],
      quantity: json['quantity'],
      userid: json['userId'],
      storeid: json['storeId'],
      title: json['adTitle'],
      price: json['sellingPrice'],
      image: json['thumbnailImage'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['cartId'] = this.cartid;
    data['adId'] = this.adid;
    data['quantity'] = this.quantity;
    data['userId'] = this.userid;
    data['storeId'] = this.storeid;
    data['adTitle'] = this.title;
    data['sellingPrice'] = this.price;
    data['thumbnailImage'] = this.image;

    return data;
  }
}

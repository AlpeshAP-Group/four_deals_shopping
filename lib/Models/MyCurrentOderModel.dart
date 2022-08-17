class MyCurrectOrderModel {
  final int salesid;
  final int orderid;
  final int addid;
  final String addtitile;
  final int qunatity;
  final String amount;
  final int storeid;
  final String status;
  final String thumnails;

  MyCurrectOrderModel(
      {required this.salesid,
      required this.orderid,
      required this.addid,
      required this.addtitile,
      required this.amount,
      required this.qunatity,
      required this.status,
      required this.storeid,
      required this.thumnails});

  factory MyCurrectOrderModel.fromJson(Map<String, dynamic> json) {
    return MyCurrectOrderModel(
      salesid: json['salesId'],
      orderid: json['orderId'],
      addid: json['adId'],
      addtitile: json['adTitle'],
      amount: json['amount'],
      qunatity: json['quantity'],
      status: json['status'],
      storeid: json['storeId'],
      thumnails: json['thumbnailImage'],
    );
  }
}

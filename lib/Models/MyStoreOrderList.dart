class MyStoreOrderListModel {
  final int orderid;
  final int orderdate;
  final String amount;
  final int totalitems;
  final String delstatus;
  var shipaddress;
  var customerdetails;

  MyStoreOrderListModel(
      {required this.orderid,
      required this.orderdate,
      required this.amount,
      required this.totalitems,
      required this.delstatus,
      required this.shipaddress,
      required this.customerdetails});

  factory MyStoreOrderListModel.fromJson(Map<String, dynamic> json) {
    return MyStoreOrderListModel(
      orderid: json['orderId'],
      orderdate: json['orderDate'],
      amount: json['totalAmount'],
      totalitems: json['totalItem'],
      delstatus: json['deliveryStatus'],
      shipaddress: json['shippingAddress'],
      customerdetails: json['customerDetails'],
    );
  }
}

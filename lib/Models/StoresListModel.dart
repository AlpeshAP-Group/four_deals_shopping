class StoresListModel {
  final int storeid;
  final String storename;
  final String description;
  final String logoimage;
  final String bannerimage;
  final String latitude;
  final String lontitude;
  final String address;

  StoresListModel({
    required this.storeid,
    required this.storename,
    required this.description,
    required this.logoimage,
    required this.bannerimage,
    required this.latitude,
    required this.lontitude,
    required this.address,
  });

  factory StoresListModel.fromJson(Map<String, dynamic> json) {
    return StoresListModel(
      storeid: json['storeId'],
      storename: json['storeName'],
      description: json['description'],
      logoimage: json['logoImage'],
      bannerimage: json['bannerImage'],
      latitude: json['latitude'],
      lontitude: json['longitude'],
      address: json['address'],
    );
  }
}

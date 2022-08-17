class SelectAddressModel {
  final int addressid;
  final int userid;
  final String name;
  final String street;
  final int qunatity;
  var cityName;
  final String mobile;
  final String latitude;
  final String longitude;

  SelectAddressModel(
      {required this.addressid,
      required this.userid,
      required this.name,
      required this.street,
      required this.cityName,
      required this.qunatity,
      required this.latitude,
      required this.mobile,
      required this.longitude});

  factory SelectAddressModel.fromJson(Map<String, dynamic> json) {
    return SelectAddressModel(
      addressid: json['addressId'],
      userid: json['userId'],
      name: json['name'],
      street: json['street'],
      cityName: json['cityNameEn'],
      qunatity: json['quantity'],
      latitude: json['latitude'],
      mobile: json['mobile'],
      longitude: json['longitude'],
    );
  }
}

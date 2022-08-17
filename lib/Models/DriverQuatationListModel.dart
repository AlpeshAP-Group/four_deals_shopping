class DriverQuatationListModel {
  final int driverid;
  final String cost;
  final String firstname;
  final String lastname;
  final String drivernumber;
  final String image;

  DriverQuatationListModel({
    required this.driverid,
    required this.cost,
    required this.firstname,
    required this.lastname,
    required this.drivernumber,
    required this.image,
  });

  factory DriverQuatationListModel.fromJson(Map<String, dynamic> json) {
    return DriverQuatationListModel(
      driverid: json['driverId'],
      cost: json['deliveryCost'],
      firstname: json['driverFirstName'],
      lastname: json['driverLastName'],
      drivernumber: json['driverMobile'],
      image: json['driverProfileImage'],
    );
  }
}

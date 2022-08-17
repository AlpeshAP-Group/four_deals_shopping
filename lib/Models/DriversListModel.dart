class DriverListModel {
  final int driverid;
  final String firstname;
  final String lastname;
  final String profileImage;
  final String mobile;
  final String mottertype;
  final String address;
  final String location;

  DriverListModel(
      {required this.driverid,
      required this.firstname,
      required this.lastname,
      required this.profileImage,
      required this.mobile,
      required this.mottertype,
      required this.address,
      required this.location});

  factory DriverListModel.fromJson(Map<String, dynamic> json) {
    return DriverListModel(
      driverid: json['driverId'],
      firstname: json['firstName'],
      lastname: json['lastName'],
      profileImage: json['profileImage'],
      mobile: json['mobile'],
      mottertype: json['motorType'],
      address: json['address'],
      location: json['location'],
    );
  }
}

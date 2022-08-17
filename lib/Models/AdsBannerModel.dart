class AdsBannerModel {
  final String bannerimage;
  final int bannerid;
  final String Redirectvalue;

  final String RedirectType;

  AdsBannerModel({
    required this.bannerimage,
    required this.bannerid,
    required this.Redirectvalue,
    required this.RedirectType,
  });

  factory AdsBannerModel.fromJson(Map<String, dynamic> json) {
    return AdsBannerModel(
      bannerimage: json['bannerImage'],
      bannerid: json['bannerId'],
      Redirectvalue: json['redirectValue'],
      RedirectType: json['redirectType'],
    );
  }
}

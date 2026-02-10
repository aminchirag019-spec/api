class OtpModel {
  final String? phone;
  final String? otp;

  OtpModel({
    this.phone,
    this.otp,
  });

  OtpModel copyWith({
    String? phone,
    String? otp,
  }) {
    return OtpModel(
      phone: phone ?? this.phone,
      otp: otp ?? this.otp,
    );
  }

  factory OtpModel.fromJson(Map<String, dynamic> json) {
    return OtpModel(
      phone: json['phone'],
      otp: json['otp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'otp': otp,
    };
  }
}
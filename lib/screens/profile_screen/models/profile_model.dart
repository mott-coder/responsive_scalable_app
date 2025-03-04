class ProfileModel {
  final String firstName;
  final String lastName;
  final String middleName;
  final bool isEnabled;
  final int providerId;
  final String nationalIdOrPassport;
  final String nationalIdOrPassportFrontUrl;
  final String nationalIdOrPassportBackUrl;
  final String fullName;
  final String id;
  final String userName;
  final String normalizedUserName;
  final String email;
  final String normalizedEmail;
  final bool emailConfirmed;
  final String? passwordHash;
  final String securityStamp;
  final String concurrencyStamp;
  final String phoneNumber;
  final bool phoneNumberConfirmed;
  final bool twoFactorEnabled;
  final String? lockoutEnd;
  final bool lockoutEnabled;
  final int accessFailedCount;
  final String imageUrl;

  ProfileModel({
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.isEnabled,
    required this.providerId,
    required this.nationalIdOrPassport,
    required this.nationalIdOrPassportFrontUrl,
    required this.nationalIdOrPassportBackUrl,
    required this.fullName,
    required this.id,
    required this.userName,
    required this.normalizedUserName,
    required this.email,
    required this.normalizedEmail,
    required this.emailConfirmed,
    this.passwordHash,
    required this.securityStamp,
    required this.concurrencyStamp,
    required this.phoneNumber,
    required this.phoneNumberConfirmed,
    required this.twoFactorEnabled,
    this.lockoutEnd,
    required this.lockoutEnabled,
    required this.accessFailedCount,
    required this.imageUrl,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    if (json["success"] == true && json["responseData"] != null) {
      final data = json["responseData"];
      return ProfileModel(
        firstName: data["firstName"] ?? "",
        lastName: data["lastName"] ?? "",
        middleName: data["middleName"] ?? "",
        isEnabled: data["isEnabled"] ?? false,
        providerId: data["providerId"] ?? 0,
        nationalIdOrPassport: data["nationalIdOrPassport"] ?? "",
        nationalIdOrPassportFrontUrl:
            data["nationalIdOrPassportFrontUrl"] ?? "",
        nationalIdOrPassportBackUrl: data["nationalIdOrPassportBackUrl"] ?? "",
        fullName: data["fullName"] ?? "",
        id: data["id"] ?? "",
        userName: data["userName"] ?? "",
        normalizedUserName: data["normalizedUserName"] ?? "",
        email: data["email"] ?? "",
        normalizedEmail: data["normalizedEmail"] ?? "",
        emailConfirmed: data["emailConfirmed"] ?? false,
        passwordHash: data["passwordHash"],
        securityStamp: data["securityStamp"] ?? "",
        concurrencyStamp: data["concurrencyStamp"] ?? "",
        phoneNumber: data["phoneNumber"] ?? "",
        phoneNumberConfirmed: data["phoneNumberConfirmed"] ?? false,
        twoFactorEnabled: data["twoFactorEnabled"] ?? false,
        lockoutEnd: data["lockoutEnd"],
        lockoutEnabled: data["lockoutEnabled"] ?? false,
        accessFailedCount: data["accessFailedCount"] ?? 0,
        imageUrl: data['imageUrl'] ?? "",
      );
    }
    throw Exception("Profile not found or request was not successful.");
  }
}

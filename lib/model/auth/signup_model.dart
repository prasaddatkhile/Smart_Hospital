class SignupModel {
  final String fullName;
  final String email;
  final String password;
  final String hospitalId;
  final String specialty;

  SignupModel({
    required this.fullName,
    required this.email,
    required this.password,
    required this.hospitalId,
    required this.specialty,
  });

  Map<String, dynamic> toJson() {
    return {
      "fullName": fullName,
      "email": email,
      "password": password,
      "hospitalId": hospitalId,
      "specialty": specialty,
    };
  }
}

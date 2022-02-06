class AuthResponse {
  final String token;
  final String error;

  AuthResponse({this.token, this.error});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      token: json['token'] != null ? json['token'] : "",
      error: json['error'] != null ? json['token'] : "",
    );
  }
}

class AuthRequest {
  String email;
  String password;

  AuthRequest({this.email, this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> loginMap = {
      "userName": email,
      "password": password,
    };
    return loginMap;
  }
}

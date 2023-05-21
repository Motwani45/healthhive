

class InternModel{
  final String userId;
  final String username;
  final String emailAddress;
  final String accessType;
  final String? resumeUrl;
  final String? profileUrl;

  const InternModel({
    required this.userId,
    required this.username,
    required this.emailAddress,
    required this.accessType,
    this.resumeUrl,
    this.profileUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': this.userId,
      'username': this.username,
      'emailAddress': this.emailAddress,
      'accessType': this.accessType,
      'resumeUrl': this.resumeUrl,
      'profileUrl': this.profileUrl,
    };
  }

  factory InternModel.fromMap(Map<String, dynamic> map) {
    return InternModel(
      userId: map['userId'] as String,
      username: map['username'] as String,
      emailAddress: map['emailAddress'] as String,
      accessType: map['accessType'] as String,
      resumeUrl: map['resumeUrl'] as String,
      profileUrl: map['profileUrl'] as String,
    );
  }
}
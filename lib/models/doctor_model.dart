

class DoctorModel{
  final String userId;
  final String username;
  final String emailAddress;
  final String accessType;
  final List<String> jobs;
  final String? resumeUrl;
  final String? profileUrl;

  const DoctorModel({
    required this.userId,
    required this.username,
    required this.emailAddress,
    required this.accessType,
    required this.jobs,
    this.resumeUrl,
    this.profileUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': this.userId,
      'username': this.username,
      'emailAddress': this.emailAddress,
      'accessType': this.accessType,
      'jobs': this.jobs,
      'resumeUrl': this.resumeUrl,
      'profileUrl': this.profileUrl,
    };
  }

  factory DoctorModel.fromMap(Map<String, dynamic> map) {
    return DoctorModel(
      userId: map['userId'] as String,
      username: map['username'] as String,
      emailAddress: map['emailAddress'] as String,
      accessType: map['accessType'] as String,
      jobs: map['jobs'] as List<String>,
      resumeUrl: map['resumeUrl'] as String,
      profileUrl: map['profileUrl'] as String,
    );
  }
}
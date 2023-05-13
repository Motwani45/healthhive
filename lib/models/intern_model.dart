

class InternModel{
  final String userId;
  final String username;
  final String emailAddress;
  final String accessType;
  final List<String> jobsApplied;
  final List<String> jobsSelected;
  final String? resumeUrl;

  const InternModel({
    required this.userId,
    required this.username,
    required this.emailAddress,
    required this.accessType,
    required this.jobsApplied,
    required this.jobsSelected,
    required this.resumeUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': this.userId,
      'username': this.username,
      'emailAddress': this.emailAddress,
      'accessType': this.accessType,
      'jobsApplied': this.jobsApplied,
      'jobsSelected': this.jobsSelected,
      'resumeUrl': this.resumeUrl,
    };
  }

  factory InternModel.fromMap(Map<String, dynamic> map) {
    return InternModel(
      userId: map['userId'] as String,
      username: map['username'] as String,
      emailAddress: map['emailAddress'] as String,
      accessType: map['accessType'] as String,
      jobsApplied: map['jobsApplied'] as List<String>,
      jobsSelected: map['jobsSelected'] as List<String>,
      resumeUrl: map['resumeUrl'] as String?,
    );
  }
}
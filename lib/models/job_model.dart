
class JobModel{
  final String jobCreatedBy;
  final String jobId;
  final String jobTitle;
  final String jobDescription;
  final int jobOpenings;
  final String jobLocation;
  final String jobDuration;
  final List<dynamic> appliedInterns;
  final String jobStipend;


  const JobModel({
    required this.jobId,
    required this.jobCreatedBy,
    required this.jobTitle,
    required this.jobDescription,
    required this.jobDuration,
    required this.jobOpenings,
    required this.jobLocation,
required this.appliedInterns,
    required this.jobStipend
  });

  Map<String, dynamic> toMap() {
    return {
      'jobCreatedBy': this.jobCreatedBy,
      'jobId': this.jobId,
      'jobTitle': this.jobTitle,
      'jobDescription': this.jobDescription,
      'jobOpenings': this.jobOpenings,
      'jobLocation': this.jobLocation,
      'jobDuration': this.jobDuration,
      'appliedInterns': this.appliedInterns,
      'jobStipend': this.jobStipend,
    };
  }

  factory JobModel.fromMap(Map<String, dynamic> map) {
    return JobModel(
      jobCreatedBy: map['jobCreatedBy'] as String,
      jobId: map['jobId'] as String,
      jobTitle: map['jobTitle'] as String,
      jobDescription: map['jobDescription'] as String,
      jobOpenings: map['jobOpenings'] as int,
      jobLocation: map['jobLocation'] as String,
      jobDuration: map['jobDuration'] as String,
      appliedInterns: map['appliedInterns'],
      jobStipend: map['jobStipend'] as String,
    );
  }
}
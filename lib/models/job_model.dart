
class JobModel{
  final String jobId;
  final String jobTitle;
  final String jobDescription;
  final int jobOpenings;
  final String jobLocation;
  final List<String> selectedInterns;
  final List<String> remainingInterns;

  const JobModel({
    required this.jobId,
    required this.jobTitle,
    required this.jobDescription,
    required this.jobOpenings,
    required this.jobLocation,
    required this.selectedInterns,
    required this.remainingInterns,
  });

  Map<String, dynamic> toMap() {
    return {
      'jobId': this.jobId,
      'jobTitle': this.jobTitle,
      'jobDescription': this.jobDescription,
      'jobOpenings': this.jobOpenings,
      'jobLocation': this.jobLocation,
      'selectedInterns': this.selectedInterns,
      'remainingInterns': this.remainingInterns,
    };
  }

  factory JobModel.fromMap(Map<String, dynamic> map) {
    return JobModel(
      jobId: map['jobId'] as String,
      jobTitle: map['jobTitle'] as String,
      jobDescription: map['jobDescription'] as String,
      jobOpenings: map['jobOpenings'] as int,
      jobLocation: map['jobLocation'] as String,
      selectedInterns: map['selectedInterns'] as List<String>,
      remainingInterns: map['remainingInterns'] as List<String>,
    );
  }
}
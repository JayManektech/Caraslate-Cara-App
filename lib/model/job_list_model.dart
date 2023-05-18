class JobListModel {
  final String? jobName;
  final String? log;
  final bool? isCompleted;
  final bool? isSubmitted;

  static const List<String> headers = [
    "Today's Jobs",
    'Log #',
    'Completed',
    'Submitted',
  ];

  JobListModel({this.jobName, this.log, this.isCompleted, this.isSubmitted});
}

List<JobListModel> jobList = [
  JobListModel(
      jobName: 'Uptown',
      isCompleted: true,
      isSubmitted: true,
      log: '10-580-22'),
  JobListModel(
      jobName: 'Quads 47',
      isCompleted: true,
      isSubmitted: false,
      log: '10-580-23'),
  JobListModel(
      jobName: 'South Shore',
      isCompleted: false,
      isSubmitted: false,
      log: '10-580-24'),
  JobListModel(
      jobName: 'Harper',
      isCompleted: false,
      isSubmitted: false,
      log: '10-580-25'),
  JobListModel(
      jobName: 'Roseland',
      isCompleted: false,
      isSubmitted: false,
      log: '10-580-26'),
];

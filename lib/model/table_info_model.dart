class TableInfoModel {
  final String title;
  final String subtitle;

  TableInfoModel(this.title, this.subtitle);
}

List<TableInfoModel> operationalList = [
  TableInfoModel('Supervisor Name', 'Herman Richardson'),
  TableInfoModel('Vehicle #', 'EC13'),
  TableInfoModel('Milage Out', '85984'),
  TableInfoModel('Milage In', '86015'),
];

List<TableInfoModel> timeDetailsList = [
  TableInfoModel('Begin Transport', '5:40 AM'),
  TableInfoModel('Arrival Time @ Site', '6:00 AM'),
  TableInfoModel('Departure from Site', '12:00 PM'),
  TableInfoModel('Arrival @ Destination', '12:30 PM'),
];

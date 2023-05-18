class InternTimeProcessingModel {
  static const List<String> headers = [
    'Signature',
    'Time In',
    'Time Out',
    'Assignment',
    'Black Bags',
    'Blue Bags',
    'Receprtacles',
    'Crosswalks',
    'Bus stops',
    'Lots',
    'Tree Grates',
    'Planters',
    'Signs',
  ];

  final String? fullName;
  String? signature;
  final String? timeIn;
  final String? timeOut;
  final String? assignment;
  final String? blackBags;
  final String? blueBags;
  final String? receptables;
  final String? crossWalks;
  final String? busStops;
  final String? lots;
  final String? treeGrates;
  final String? planters;
  final String? signs;
  final bool isTotal;

  InternTimeProcessingModel(
      {this.crossWalks,
      this.busStops,
      this.lots,
      this.treeGrates,
      this.planters,
      this.signs,
      this.fullName,
      this.signature,
      this.timeIn,
      this.isTotal = false,
      this.timeOut,
      this.assignment,
      this.blackBags,
      this.blueBags,
      this.receptables});
}

List<InternTimeProcessingModel> internTimeList = [
  InternTimeProcessingModel(
      fullName: 'Dantrell Bridges is in the circle',
      timeOut: '6:00 AM',
      blackBags: '9',
      blueBags: '4',
      receptables: '14'),
  InternTimeProcessingModel(
      fullName: 'Dantrell Bridges',
      timeOut: '6:00 AM',
      blackBags: '9',
      blueBags: '4',
      receptables: '14'),
  InternTimeProcessingModel(
      fullName: 'Dantrell Bridges',
      timeOut: '6:00 AM',
      blackBags: '9',
      blueBags: '4',
      receptables: '14'),
];

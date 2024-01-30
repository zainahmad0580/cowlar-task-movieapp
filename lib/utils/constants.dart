const months = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec'
];

//GENERATE A LIST OF YEARS STARTING FROM 1951 TO CURRENT YEAR
List<String> years = List.generate(
  DateTime.now().year - 1950, // Current year - 1950
  (index) => (1951 + index).toString(),
).reversed.toList();

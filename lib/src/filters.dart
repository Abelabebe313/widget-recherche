enum FiltersType {
  dropdown,
  datepicker,
  geoloc,
}

class Filters {
  Filters({
    required this.fieldName,
    required this.defaultValue,
    required this.type,
    this.values,
    this.shrink = false,
  }) {
    valueChoose = defaultValue;
  }

  String fieldName;
  String defaultValue;
  FiltersType type;
  bool shrink;
  List<String>? values;
  late String valueChoose;
}

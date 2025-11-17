class ScanEntity {
  final int id;
  final String name;
  final String tag;
  final String color;
  final List<CriterionEntity> criteria;

  ScanEntity({
    required this.id,
    required this.name,
    required this.tag,
    required this.color,
    required this.criteria,
  });
}

class CriterionEntity {
  final String type;
  final String text;
  final Map<String, VariableEntity>? variables;

  CriterionEntity({
    required this.type,
    required this.text,
    this.variables,
  });
}

class VariableEntity {
  final String type;
  final List<dynamic>? values;
  final int? minValue;
  final int? maxValue;
  final dynamic defaultValue;
  final String? studyType;
  final String? parameterName;

  VariableEntity({
    required this.type,
    this.values,
    this.minValue,
    this.maxValue,
    this.defaultValue,
    this.studyType,
    this.parameterName,
  });
}

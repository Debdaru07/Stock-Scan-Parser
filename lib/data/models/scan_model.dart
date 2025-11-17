import '../../domain/entities/scan_entity.dart';

class ScanModel extends ScanEntity {
  ScanModel({
    required super.id,
    required super.name,
    required super.tag,
    required super.color,
    required super.criteria,
  });

  factory ScanModel.fromJson(Map<String, dynamic> json) {
    return ScanModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      tag: json['tag'] ?? '',
      color: json['color'] ?? 'green',
      criteria: (json['criteria'] as List<dynamic>)
          .map(
            (c) => CriterionModel.fromJson(c),
          )
          .toList(),
    );
  }
}

class CriterionModel extends CriterionEntity {
  CriterionModel({
    required super.type,
    required super.text,
    super.variables,
  });

  factory CriterionModel.fromJson(Map<String, dynamic> json) {
    Map<String, VariableEntity>? vars;
    if (json['variable'] != null) {
      vars = (json['variable'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(
            key, VariableModel.fromJson(value as Map<String, dynamic>)),
      );
    }

    return CriterionModel(
      type: json['type'],
      text: json['text'],
      variables: vars,
    );
  }
}

class VariableModel extends VariableEntity {
  VariableModel({
    required super.type,
    super.values,
    super.minValue,
    super.maxValue,
    super.defaultValue,
    super.studyType,
    super.parameterName,
  });

  factory VariableModel.fromJson(Map<String, dynamic> json) {
    return VariableModel(
      type: json['type'],
      values: json['values'],
      minValue: json['min_value'],
      maxValue: json['max_value'],
      defaultValue: json['default'],
      studyType: json['study_type'],
      parameterName: json['parameter_name'],
    );
  }
}

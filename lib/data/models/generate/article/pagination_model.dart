import 'package:json_annotation/json_annotation.dart';

part 'pagination_model.g.dart';

@JsonSerializable()
class PaginationModel {
  final int limit;
  final int offset;
  final int total;
  final int count;
  PaginationModel({
    required this.limit,
    required this.offset,
    required this.total,
    required this.count,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);
}

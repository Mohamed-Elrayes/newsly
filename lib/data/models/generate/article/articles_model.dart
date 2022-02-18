import 'package:json_annotation/json_annotation.dart';

import 'pagination_model.dart';
import 'article_item_model.dart';
part 'articles_model.g.dart';

@JsonSerializable(explicitToJson: false)
class Articles {
  PaginationModel pagination;
  List<ArticleItem>? data;
  Articles({
    required this.pagination,
    this.data,
  });

  factory Articles.fromJson(Map<String, dynamic> json) =>
      _$ArticlesFromJson(json);
}

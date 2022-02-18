import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'article_item_model.g.dart';

@JsonSerializable()
class ArticleItem extends Equatable {
 final  String? author;
 final  String? title;
 final  String? description;
 final  String? url;
 final  String? source;
 final  String? image;
 final  String? category;
 final  String? language;
 final  String? country;
 final  String? publishedAt;

 const ArticleItem({
    this.author,
    this.title,
    this.description,
    this.url,
    this.source,
    this.image,
    this.category,
    this.language,
    this.country,
    this.publishedAt,
  });

  factory ArticleItem.fromJson(Map<String, dynamic> json) =>
      _$ArticleItemFromJson(json);

  @override
  List<Object?> get props => [
        author,
        title,
        description,
        url,
        source,
        image,
        category,
        language,
        country,
        publishedAt,
      ];
}

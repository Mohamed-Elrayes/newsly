// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleItem _$ArticleItemFromJson(Map<String, dynamic> json) => ArticleItem(
      author: json['author'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      source: json['source'] as String?,
      image: json['image'] as String?,
      category: json['category'] as String?,
      language: json['language'] as String?,
      country: json['country'] as String?,
      publishedAt: json['published_at'] as String?,
    );

Map<String, dynamic> _$ArticleItemToJson(ArticleItem instance) =>
    <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'source': instance.source,
      'image': instance.image,
      'category': instance.category,
      'language': instance.language,
      'country': instance.country,
      'publishedAt': instance.publishedAt,
    };

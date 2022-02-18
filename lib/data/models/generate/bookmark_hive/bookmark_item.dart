import 'package:hive/hive.dart';

part 'bookmark_item.g.dart';

@HiveType(typeId: 1)
class BookmarkHive {
  @HiveField(0)
  String? author;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? description;
  @HiveField(3)
  String? url;
  @HiveField(4)
  String? source;
  @HiveField(5)
  String? image;
  @HiveField(6)
  String? category;
  @HiveField(7)
  String? language;
  @HiveField(8)
  String? country;
  @HiveField(9)
  String? publishedAt;

  BookmarkHive({
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

  @override
  String toString() {
    return '$author :: $title :: $description :: $url :: $source :: $image :: $category :: $language :: $country :: $publishedAt';
  }
}

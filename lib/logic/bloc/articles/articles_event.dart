part of 'articles_bloc.dart';

abstract class ArticlesEvent extends Equatable {
  const ArticlesEvent();

  @override
  List<Object> get props => [];
}

class ArticlesFetch extends ArticlesEvent {
  final String categoryName;
  const ArticlesFetch({
    required this.categoryName,
  });
}
class ArticlesMoreFetch extends ArticlesEvent {
  final String categoryName;
  final bool fetchMore;
  const ArticlesMoreFetch({
    required this.categoryName,
    this.fetchMore = false
  });
}

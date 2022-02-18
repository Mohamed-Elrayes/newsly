part of 'articles_bloc.dart';

enum ArticlesStatus {
  loading,
  success,
  failure,
}

class ArticlesState extends Equatable {
  final ArticlesStatus status;
  final List<ArticleItem> articlesList;
  final bool hasReachedMax;
  final String? errorMessage;

  const ArticlesState(
      {this.status = ArticlesStatus.loading,
      this.articlesList = const [],
      this.hasReachedMax = false,
      this.errorMessage});

 
  @override
  List<Object> get props => [hasReachedMax, articlesList, status];

  ArticlesState copyWith({
    ArticlesStatus? status,
    List<ArticleItem>? articles,
    bool? hasReachedMax,
    String? errorMessage,
  }) {
    return ArticlesState(
      status: status ?? this.status,
      articlesList: articles ?? this.articlesList,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

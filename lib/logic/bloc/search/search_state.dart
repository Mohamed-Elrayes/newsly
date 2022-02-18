part of 'search_bloc.dart';

enum SearchStates { loading, success, failed, empty }

class SearchState extends Equatable {
  final SearchStates status;
  final List<ArticleItem> articlesDataSearched;
  final String? errorMessage; 
  const SearchState({
    this.status = SearchStates.empty,
    this.articlesDataSearched = const [],
    this.errorMessage,
  });

  @override
  List<Object> get props => [status ,articlesDataSearched ];


  

  SearchState copyWith({
    SearchStates? status,
    List<ArticleItem>? articlesDataSearched,
    String? errorMessage,
  }) {
    return SearchState(
      status: status ?? this.status,
      articlesDataSearched: articlesDataSearched ?? this.articlesDataSearched,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

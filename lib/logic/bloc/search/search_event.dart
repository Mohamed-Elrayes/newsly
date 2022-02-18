part of 'search_bloc.dart';

class SearchEvent extends Equatable {
  final String searchWord;
  const SearchEvent({
    required this.searchWord,
  });

  @override
  List<Object> get props => [];
}

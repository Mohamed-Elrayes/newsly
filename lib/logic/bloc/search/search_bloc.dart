import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/error_api_model.dart';
import '../../../data/models/models.dart';
import '../../../data/repositories/search_repository.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:rxdart/rxdart.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository _searchRepository;
  late PaginationModel paginationModel;
  int page = 0;
  SearchBloc() : _searchRepository = SearchRepository(),
        super(const SearchState()) {
    on<SearchEvent>(
      _onSearchWordFetch, transformer: debounceRestartable(const Duration(milliseconds: 400)),
    );
    // on<SearchEvent>(_onSearchWordFetch);
  }
  EventTransformer<ChangeSearchWordEvent> debounceRestartable <ChangeSearchWordEvent>(
    Duration duration,
  ) {
    return (events, mapper) => restartable<ChangeSearchWordEvent>()
        .call(events.debounceTime(duration), mapper);
  }



  FutureOr<void> _onSearchWordFetch(
      SearchEvent event, Emitter<SearchState> emit) async {
    try {
      emit(state
          .copyWith(status: SearchStates.loading, articlesDataSearched: []));
      final resultSearchArticles = await _fetchDataFromApi(pageNumber: page, searchWord: event.searchWord);
      emit(
        state.copyWith(
          status: SearchStates.success,
          articlesDataSearched: resultSearchArticles.data,
        ),
      );
    } catch (e) {
      final messageError = e as ErrorApiModel;
      emit(state.copyWith(
        status: SearchStates.failed,
        errorMessage: messageError.error?.message,
      ));
    }
  }

  Future<Articles> _fetchDataFromApi({searchWord, pageNumber}) async {
    final _articles = await _searchRepository.getByCategoryArticles(
        searchWord: searchWord, page: pageNumber);
    paginationModel = _articles.pagination;
    return _articles;
  }
}

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../core/constants/api_constant.dart';
import '../../../data/models/error_api_model.dart';
import '../../../data/models/models.dart';
import '../../../data/repositories/articles_repository.dart';

part 'articles_event.dart';
part 'articles_state.dart';

// const _postLimit = 20;

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  final ArticlesRepository _articlesRepository;
  late PaginationModel paginationModel;
  int page = 0;
  int? initialPageTab;

  ArticlesBloc()
      : _articlesRepository = ArticlesRepository(),
        super(const ArticlesState()) {
    on<ArticlesFetch>(_onArticlesFetched);
    on<ArticlesMoreFetch>(_onArticlesMoreFetched);
    // on<ArticlesFetch>(_onArticlesFetched);
  }

  FutureOr<void> _onArticlesFetched(
      ArticlesFetch event, Emitter<ArticlesState> emit) async {
    try {
      emit(state.copyWith(status: ArticlesStatus.loading, articles: []));
      final articles = await _fetchDataFromApi(
          categoryName: event.categoryName, pageNumber: page);
      emit(state.copyWith(
          status: ArticlesStatus.success,
          articles: articles.data,
          hasReachedMax: false));
    } catch (e) {
          final messageError = e as ErrorApiModel;
      emit(state.copyWith(
        status: ArticlesStatus.failure,
        errorMessage: messageError.error?.message,
      ));
    }
  }

  FutureOr<void> _onArticlesMoreFetched(
      ArticlesMoreFetch event, Emitter<ArticlesState> emit) async {
    try {
      final nextPage = ++page;

      final articles = await _fetchDataFromApi(
          categoryName: event.categoryName, pageNumber: nextPage);
      emit(state.copyWith(
          status: ArticlesStatus.success,
          articles: List.of(state.articlesList)..addAll(articles.data!),
          hasReachedMax: false));

      if ((page + limitItemInPage) >= paginationModel.total) {
        emit(state.copyWith(
            status: ArticlesStatus.success, hasReachedMax: true));
      }
    } 
     catch (e) {
      final messageError = e as ErrorApiModel;
      emit(state.copyWith(
        status: ArticlesStatus.failure,
        errorMessage: messageError.error?.message,
      ));
    }
  }

  Future<Articles> _fetchDataFromApi({categoryName, pageNumber}) async {
    final _articles = await _articlesRepository.getByCategoryArticles(
        category: categoryName, page: pageNumber);
    paginationModel = _articles.pagination;
    return _articles;
  }
}

  // FutureOr<void> _onArticlesFetched(
  //     ArticlesFetch event, Emitter<ArticlesState> emit) async {
  //   logger.i("message 1");
  //   try {
  //         emit(state.copyWith(
  //         status: ArticlesStatus.initial,
  //         articles: [],
  //         hasReachedMax: false,
  //         ));
  //     if (state.status == ArticlesStatus.initial) {
    
  //   logger.i("message==3");
  //   logger.i(event.categoryName);
        
  //       final articles = await _fetchDataFromApi(
  //           categoryName: event.categoryName, pageNumber: page);
  //       emit(state.copyWith(
  //         status: ArticlesStatus.success,
  //         articles: articles.data,
  //         hasReachedMax: false,
  //       ));
  //       if ((page + limitItemInPage) >= paginationModel.total) {
  //         emit(state.copyWith(
  //             status: ArticlesStatus.success, hasReachedMax: true));
  //       }
  //     }

  //     if (event.fetchMore) {
  //   logger.i("fetchmore==4");

  //       final nextPage = page++;
  //       final articles = await _fetchDataFromApi(
  //           categoryName: event.categoryName, pageNumber: nextPage);
  //       emit(state.copyWith(
  //           status: ArticlesStatus.success,
  //           articles: List.of(state.articles)..addAll(articles.data!),
  //           hasReachedMax: false));

  //       if ((page + limitItemInPage) >= paginationModel.total) {
  //         emit(state.copyWith(
  //             status: ArticlesStatus.success, hasReachedMax: true));
  //       }
  //     }
  //   } catch (_) {
  //     emit(state.copyWith(status: ArticlesStatus.failure));
  //   }
  // }

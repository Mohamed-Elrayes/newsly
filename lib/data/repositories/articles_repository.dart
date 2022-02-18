import '../../core/constants/api_constant.dart';
import '../../core/constants/strings.dart';
import '../data_providers/api/api_news_service.dart';

import '../models/generate/article/articles_model.dart';


class ArticlesRepository {
  
  ArticlesRepository() : articlesWebServer = WebServiceNewsApi();

  WebServiceNewsApi articlesWebServer;

  Future<Articles> getByCategoryArticles(
      {required String category, required int page}) async {
    final dataMap = await articlesWebServer.getDataService(
      urlString,
      queryParameters: {
        'access_key': apiKey,
        'limit': limitItemInPage.toString(),
        'offset': page.toString(),
        'languages': 'en',
        'categories': category.toLowerCase()
      },
    );

    logger.d(dataMap);
    final data = Articles.fromJson(dataMap);
    return data;
  }
}

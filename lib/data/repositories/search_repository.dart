
import '../../core/constants/api_constant.dart';
import '../../core/constants/strings.dart';
import '../data_providers/api/api_news_service.dart';

import '../models/generate/article/articles_model.dart';

class SearchRepository {
  WebServiceNewsApi articlesWebServer; 
SearchRepository():articlesWebServer = WebServiceNewsApi();

 Future<Articles> getByCategoryArticles({required String searchWord, required int page}) async {
    final dataMap = await articlesWebServer.getDataService(
       urlString,
      queryParameters: {
        'access_key': apiKey,
        'limit': limitItemInPage.toString(),
        'offset': page.toString(),
        'languages': 'en',
        'keywords': searchWord.toLowerCase()
      },
    );

    logger.d(dataMap);
    final data = Articles.fromJson(dataMap);
    return data;
  }


}

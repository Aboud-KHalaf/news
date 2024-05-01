import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news/core/helpers/failure_helper.dart';
import 'package:news/core/helpers/functions_helper.dart';
import 'package:news/core/services/news_services.dart';
import 'package:news/features/home/data/models/news_model/news_model.dart';
import 'package:news/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, List<NewsModel>>> fetchBreakingNews(
      {required String country}) async {
    try {
      String apiKey = '9bde4066b5a84805a5a6cecd037cc102';
      var data = await apiServices
          .get('top-headlines?country=$country&apiKey=$apiKey');
      List<NewsModel> breakingNews = [];

      for (var item in data['articles']) {
        NewsModel newsModel = NewsModel.fromNews(item);
        if (isNotNull(newsModel)) {
          breakingNews.add(newsModel);
        }
      }
      return right(breakingNews);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return (left(ServerFailure(e.toString())));
      }
    }
  }
}

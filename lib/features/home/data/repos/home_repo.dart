import 'package:dartz/dartz.dart';
import 'package:news/core/helpers/failure_helper.dart';
import 'package:news/features/home/data/models/news_model/news_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<NewsModel>>> fetchBreakingNews(
      {required String country});
}

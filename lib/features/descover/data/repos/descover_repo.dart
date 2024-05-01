import 'package:dartz/dartz.dart';
import 'package:news/core/helpers/failure_helper.dart';
import 'package:news/features/home/data/models/news_model/news_model.dart';

abstract class DescoverRepo {
  Future<Either<Failure, List<NewsModel>>> fetchNewsByCategory(
      {required String category, required String country});
  Future<Either<Failure, List<NewsModel>>> fetchNewsBySearch(
      {required String searchFor, required String country});
}

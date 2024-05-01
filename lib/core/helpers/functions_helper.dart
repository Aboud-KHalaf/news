import 'package:news/features/home/data/models/news_model/news_model.dart';

bool isNotNull(NewsModel newsModel) {
  if (newsModel.author != null &&
      newsModel.content != null &&
      newsModel.description != null &&
      newsModel.publishedAt != null &&
      newsModel.source != null &&
      newsModel.title != null &&
      newsModel.url != null &&
      newsModel.urlToImage != null) {
    return true;
  }
  return false;
}

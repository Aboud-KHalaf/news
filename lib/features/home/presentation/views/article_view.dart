import 'package:flutter/material.dart';
import 'package:news/core/widgets/image_container.dart';
import 'package:news/features/home/data/models/news_model/news_model.dart';
import 'widgets/article_body.dart';
import 'widgets/article_news_headline.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({super.key});
  static String routeName = '/articlePage';

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments as NewsModel;
    return ImageContainer(
      imageUrl: article.urlToImage!,
      height: double.infinity,
      width: double.infinity,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: ListView(
          children: [
            NewsHeadLine(
              article: article,
            ),
            ArticleBody(
              article: article,
            ),
          ],
        ),
      ),
    );
  }
}

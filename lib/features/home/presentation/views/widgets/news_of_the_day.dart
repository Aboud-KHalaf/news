import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:news/features/home/data/models/news_model/news_model.dart';
import 'package:news/features/home/presentation/views/article_view.dart';
import '../../../../../core/widgets/custom_tag.dart';
import '../../../../../core/widgets/image_container.dart';

class NewsOfTheDay extends StatelessWidget {
  const NewsOfTheDay({
    super.key,
    required this.articles,
  });

  final List<NewsModel> articles;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.45,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return MyImageContainer(article: articles[index]);
        },
        autoplay: true,
        itemCount: articles.length,
      ),
    );
  }
}

class MyImageContainer extends StatelessWidget {
  const MyImageContainer({
    super.key,
    required this.article,
  });

  final NewsModel article;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ImageContainer(
      noTopRadios: true,
      padding: const EdgeInsets.all(20.0),
      width: double.infinity,
      imageUrl: article.urlToImage!,
      height: size.height * 0.45,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTag(
            backgroundColor: Colors.grey.withAlpha(150),
            children: const [
              Text(
                "News of the day",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            article.title!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              height: 1.25, // space between lines
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            onPressed: () {
              Navigator.of(context).pushNamed(
                ArticleView.routeName,
                arguments: article,
              );
            },
            child: Row(
              children: [
                Text(
                  'show more',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.tertiary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_right_alt,
                  color: Theme.of(context).colorScheme.tertiary,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

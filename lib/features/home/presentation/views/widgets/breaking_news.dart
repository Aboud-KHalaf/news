import 'package:flutter/material.dart';
import 'package:news/features/home/data/models/news_model/news_model.dart';
import '../../../../../core/helpers/helper.dart';
import '../article_view.dart';
import '../../../../../core/widgets/image_container.dart';

class BreakingNews extends StatelessWidget {
  const BreakingNews({
    super.key,
    required this.news,
    required this.size,
  });
  final Size size;
  final List<NewsModel> news;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'Breaking News',
            style: TextStyle(
              fontSize: 28,
              color: colorScheme.secondary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 350,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: news.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    ArticleView.routeName,
                    arguments: news[index],
                  );
                },
                child: _Article(
                  size: size,
                  news: news,
                  colorScheme: colorScheme,
                  index: index,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class _Article extends StatelessWidget {
  const _Article({
    required this.size,
    required this.news,
    required this.colorScheme,
    required this.index,
  });

  final Size size;
  final List<NewsModel> news;
  final ColorScheme colorScheme;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      width: size.width * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageContainer(
            borderRadius: 17,
            height: 200,
            width: size.width * 0.5,
            imageUrl: imageURL(news[index].urlToImage!),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            news[index].title!,
            maxLines: 2,
            style: TextStyle(
              color: colorScheme.secondary,
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            '${DateTime.now().difference(
                  DateTime.parse(news[index].publishedAt!),
                ).inHours} hours ago',
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
          Text(
            'by ${news[index].author} ',
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news/features/home/data/models/news_model/news_model.dart';
import 'package:news/features/home/presentation/views/article_view.dart';

import '../../../../../core/helpers/helper.dart';
import '../../../../../core/widgets/image_container.dart';

class NewsByCategory extends StatelessWidget {
  const NewsByCategory({
    super.key,
    required this.articlesList,
    required this.colorScheme,
    this.isScroll = false,
  });

  final List<NewsModel> articlesList;
  final ColorScheme colorScheme;
  final bool isScroll;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: (!isScroll)
          ? const NeverScrollableScrollPhysics()
          : const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: articlesList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ArticleView.routeName,
              arguments: articlesList[index],
            );
          },
          child: Row(
            children: [
              ImageContainer(
                margin: const EdgeInsets.all(10.0),
                width: 80,
                borderRadius: 5,
                height: 80,
                imageUrl: imageURL(articlesList[index].urlToImage!),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      articlesList[index].title!,
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        color: colorScheme.secondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.schedule,
                          size: 18,
                          color: colorScheme.tertiary,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '${DateTime.now().difference(
                                DateTime.parse(
                                  articlesList[index].publishedAt!,
                                ),
                              ).inHours} hours ago',
                          style: TextStyle(
                            color: colorScheme.secondary,
                          ),
                        ),
                        const SizedBox(width: 20.0),
                        Icon(
                          Icons.visibility,
                          color: colorScheme.tertiary,
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${Random().nextInt(999)} views',
                          style: TextStyle(
                            color: colorScheme.secondary,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

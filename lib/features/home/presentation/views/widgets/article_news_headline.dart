import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news/features/home/data/models/news_model/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/widgets/custom_tag.dart';

class NewsHeadLine extends StatelessWidget {
  const NewsHeadLine({
    required this.article,
    super.key,
  });
  final NewsModel article;
  @override
  Widget build(BuildContext context) {
    Future<void> _launchUrl(Uri uri) async {
      if (!await launchUrl(uri)) {
        throw Exception('Could not launch $uri');
      }
    }

    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          CustomTag(
            backgroundColor: Colors.grey.withAlpha(150),
            children: [
              Text(
                'News',
                style: TextStyle(
                  fontSize: 16,
                  color: colorScheme.tertiary,
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
              fontSize: 22,
              fontWeight: FontWeight.bold,
              height: 1.25, // space between lines
            ),
          ),
          GestureDetector(
            onTap: () {
              final Uri url = Uri.parse(article.url!);
              _launchUrl(url);
            },
            child: Row(
              children: [
                Text(
                  'Article Link',
                  style: TextStyle(
                    color: colorScheme.tertiary,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: colorScheme.tertiary,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

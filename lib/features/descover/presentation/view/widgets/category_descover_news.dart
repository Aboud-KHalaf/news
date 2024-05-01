// ignore_for_file: unused_import

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/widgets/loading_widget.dart';
import 'package:news/features/descover/presentation/view_model/descover_cubit/descover_cubit.dart';
import 'package:news/features/home/data/models/news_model/news_model.dart';
import '../../../../../core/helpers/helper.dart';
import '../../../../../core/widgets/failure_widget.dart';
import '../../../../../main.dart';
import 'new_by_category.dart';

class CategoryNews extends StatefulWidget {
  const CategoryNews({
    super.key,
    required this.tabs,
  });

  final List<String> tabs;

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  @override
  void initState() {
    BlocProvider.of<DescoverCubit>(context)
        .fetchByCategory(category: tabs[0], country: 'us');
    super.initState();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        SizedBox(
          height: 60,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.tabs.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  currentIndex = index;
                  BlocProvider.of<DescoverCubit>(context).fetchByCategory(
                      category: tabs[currentIndex], country: 'us');
                  setState(() {});
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: BorderRadius.circular(16),
                    border: (currentIndex == index)
                        ? Border.all(color: colorScheme.tertiary, width: 2)
                        : null,
                  ),
                  child: Text(
                    widget.tabs[index],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
          child: Expanded(
            child: BlocBuilder<DescoverCubit, DescoverState>(
              builder: (context, state) {
                if (state is DescoverFailure) {
                  return const FailureWidget();
                } else if (state is DescoverSuccess) {
                  return NewsByCategory(
                    articlesList: state.newsByCatergory,
                    colorScheme: colorScheme,
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: LoadingWidget(),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}

// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/widgets/failure_widget.dart';
import 'package:news/core/widgets/loading_widget.dart';
import 'package:news/features/descover/presentation/view/widgets/new_by_category.dart';
import 'package:news/features/descover/presentation/view_model/search_cubit/search_cubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  static const String routeName = 'search page';

  @override
  Widget build(BuildContext context) {
    final searchBy = ModalRoute.of(context)!.settings.arguments as String;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: size.height * 0.10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Search results for ',
                      style: TextStyle(
                        color: colorScheme.secondary,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      searchBy,
                      style: TextStyle(
                        color: colorScheme.tertiary,
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchFailure) {
                    return const FailureWidget();
                  } else if (state is SearchSuccess) {
                    return NewsByCategory(
                      isScroll: true,
                      articlesList: state.news,
                      colorScheme: colorScheme,
                    );
                  } else {
                    return const LoadingWidget();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

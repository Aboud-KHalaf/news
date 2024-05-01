import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/descover/presentation/view/search_view.dart';
import 'package:news/features/descover/presentation/view_model/search_cubit/search_cubit.dart';

class DescoverNews extends StatelessWidget {
  const DescoverNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        height: size.height * 0.35,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.10,
            ),
            Text(
              "Descover",
              style: TextStyle(
                color: colorScheme.secondary,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            const SizedBox(height: 7.0),
            Text(
              "the news from all the world",
              style: TextStyle(
                color: colorScheme.secondary,
              ),
            ),
            const SizedBox(height: 15.0),
            const _CustomTextField(),
          ],
        ),
      ),
    );
  }
}

class _CustomTextField extends StatelessWidget {
  const _CustomTextField();

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return TextFormField(
      cursorColor: colorScheme.tertiary,
      onFieldSubmitted: (value) {
        BlocProvider.of<SearchCubit>(context)
            .searchFor(country: 'us', searchFor: value);
        Navigator.pushNamed(context, SearchPage.routeName, arguments: value);
      },
      decoration: InputDecoration(
        hintText: 'Search',
        fillColor: colorScheme.primary.withAlpha(160),
        filled: true,
        prefixIcon: Icon(
          Icons.search,
          color: colorScheme.tertiary,
        ),
        suffixIcon: RotatedBox(
          quarterTurns: 1,
          child: Icon(
            Icons.tune,
            color: colorScheme.secondary,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none, // none active border
        ),
      ),
    );
  }
}

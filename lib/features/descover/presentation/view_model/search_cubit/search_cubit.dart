// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:news/features/descover/data/repos/descover_repo.dart';
import 'package:news/features/home/data/models/news_model/news_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.descoverRepo) : super(SearchInitial());
  final DescoverRepo descoverRepo;
  Future<void> searchFor(
      {required String searchFor, required String country}) async {
    emit(SearchLoading());

    var result = await descoverRepo.fetchNewsBySearch(
      searchFor: searchFor,
      country: country,
    );

    result.fold(
      (l) => emit(
        SearchFailure(errMessage: l.errorMessage),
      ),
      (r) => emit(
        SearchSuccess(news: r),
      ),
    );
  }
}

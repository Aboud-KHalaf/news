import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news/features/descover/data/repos/descover_repo_impl.dart';
import 'package:news/features/home/data/models/news_model/news_model.dart';

part 'descover_state.dart';

class DescoverCubit extends Cubit<DescoverState> {
  DescoverCubit(this.descoverRepoImple) : super(DescoverInitial());
  Map<String, List<NewsModel>> newsByCategory = {
    'business': [],
    'entertainment': [],
    'general': [],
    'health': [],
    'science': [],
    'technology': [],
    'sports': [],
  };
  final DescoverRepoImple descoverRepoImple;
  Future<void> fetchByCategory(
      {required String category, required String country}) async {
    emit(DescoverLoading());

    if (newsByCategory[category]!.isEmpty) {
      var result = await descoverRepoImple.fetchNewsByCategory(
          category: category, country: country);
      result.fold(
        (l) {
          emit(DescoverFailure(errMessage: l.errorMessage));
        },
        (r) {
          emit(DescoverSuccess(newsByCatergory: r));
          newsByCategory[category] = r;
        },
      );
    } else {
      emit(DescoverSuccess(newsByCatergory: newsByCategory[category]!));
    }
  }
}
